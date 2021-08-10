/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import Persistencia.ClienteJpaController;
import Persistencia.EmpleadoJpaController;
import Persistencia.HabitacionJpaController;
import Persistencia.PersonaJpaController;
import Persistencia.ReservaJpaController;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.Query;

public class ControladoraPersistencia {
    HabitacionJpaController habitacionJPA = new HabitacionJpaController();
    PersonaJpaController personaJPA = new PersonaJpaController();
    ClienteJpaController clienteJPA = new ClienteJpaController();
    EmpleadoJpaController empleadoJPA = new EmpleadoJpaController();
    ReservaJpaController reservaJPA = new ReservaJpaController();
    public void crearHabitacion(Habitacion habitacion){
        habitacionJPA.create(habitacion);
    }
    public List<Habitacion> traerHabitaciones(){
        return habitacionJPA.findHabitacionEntities();
    }
    public Habitacion traerHabitacion(long id){
        return habitacionJPA.findHabitacion(id);
    }
    public void eliminarHabitacion(long id){
        try {
            habitacionJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<Habitacion> traerHabitacionesSinReservas(Date fechaDesde, Date fechaHasta, int cantidadHuespedes){
        EntityManager em = habitacionJPA.getEntityManager();
        Query query = em.createQuery("Select h FROM Habitacion h WHERE h.capacidad >= :cantidad AND h NOT IN (SELECT r.habitacion FROM Reserva r WHERE (r.checkIn <= :desde AND r.checkOut >= :desde) OR (r.checkIn <= :hasta  AND r.checkOut >= :hasta ) OR (r.checkIn >= :desde AND r.checkOut <= :hasta ))");
        query.setParameter("cantidad", cantidadHuespedes);
        query.setParameter("desde", fechaDesde);
        query.setParameter("hasta", fechaHasta);
        List<Habitacion> habitaciones = query.getResultList();
        return habitaciones;
    }
    //Empleado
    public void crearEmpleado(Empleado empleado){
        empleadoJPA.create(empleado);
    }
    public List<Empleado> traerEmpleados(){
        return empleadoJPA.findEmpleadoEntities();
    }
    public Empleado traerEmpleado(long id){
        return empleadoJPA.findEmpleado(id);
    }
    public void eliminarEmpleado(long id){
        try {
            empleadoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //Cliente
    public void crearCliente(Cliente cliente){
        clienteJPA.create(cliente);
    }
    public List<Cliente> traerClientes(){
        return clienteJPA.findClienteEntities();
    }
    public Cliente traerCliente(long id){
        return clienteJPA.findCliente(id);
    }
    public void eliminarCliente(long id){
        try {
            clienteJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //Reserva
    public void crearReserva(Reserva reserva){
        reservaJPA.create(reserva);
    }
    public List<Reserva> traerReservasDia(Date fecha){
        EntityManager em = reservaJPA.getEntityManager();
        Query query = em.createQuery("SELECT r FROM Reserva r WHERE (r.checkIn <= :fecha AND r.checkOut >= :fecha)");
        query.setParameter("fecha", fecha);
        List<Reserva> reservas = query.getResultList();
        return reservas;
    }
    
    public List<Reserva> traerReservasEmpleado(long empleadoId){
        EntityManager em = reservaJPA.getEntityManager();
        Query query = em.createQuery("SELECT r FROM Reserva r WHERE r.empleado.id = :empleadoId");
        query.setParameter("empleadoId", empleadoId);
        List<Reserva> reservas = query.getResultList();
        return reservas;
    }
    public List<Reserva> traerReservasClientePeriodo(Date fechaDesde, Date fechaHasta, long clienteId){
        EntityManager em = reservaJPA.getEntityManager();
        Query query = em.createQuery("SELECT r FROM Reserva r WHERE r.cliente.id = :clienteId AND ((r.checkIn <= :desde AND r.checkOut >= :desde) OR (r.checkIn <= :hasta  AND r.checkOut >= :hasta ) OR (r.checkIn >= :desde AND r.checkOut <= :hasta ))");
        query.setParameter("clienteId", clienteId);
        query.setParameter("desde", fechaDesde);
        query.setParameter("hasta", fechaHasta);
        List<Reserva> reservas = query.getResultList();
        return reservas;
    }
    
}
