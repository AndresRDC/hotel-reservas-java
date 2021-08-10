package Logica;

import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Controladora {
    ControladoraPersistencia controladoraPersistencia = new ControladoraPersistencia();
    //Habitaciones
    public List<Habitacion> traerHabitaciones(){
        return controladoraPersistencia.traerHabitaciones();
    }
    public List<Habitacion> traerHabitacionesSinReservas(Date fechaDesde, Date fechaHasta, int cantidadHuespedes){
        return controladoraPersistencia.traerHabitacionesSinReservas(fechaDesde, fechaHasta, cantidadHuespedes);
    }
    public Habitacion traerHabitacion(long id){
        return controladoraPersistencia.traerHabitacion(id);
    }
    private int ObtenerCapacidad(String tipo){
        int capacidad = 0;
        switch(tipo){
            case "Simple":
                capacidad = 1;
                break;
            case "Doble":
                capacidad = 2;  
                break;
            case "Triple":
                capacidad = 3;
                break;
            case "Multiple":
                capacidad = 6;
                break;
            default:
                capacidad = 0;
        }
        return capacidad;
    }
    public void crearHabitacion(int numero, int piso, String tematica, String tipo, double precio){
        Habitacion habitacion = new Habitacion();
        habitacion.setNumero(numero);
        habitacion.setPiso(piso);
        habitacion.setTematica(tematica);
        habitacion.setTipo(tipo);
        habitacion.setPrecio(precio);
        habitacion.setCapacidad(ObtenerCapacidad(tipo));
        controladoraPersistencia.crearHabitacion(habitacion);
    }    
    public void modificarHabitacion(long id, int numero, int piso, String tematica, String tipo, double precio){
        Habitacion habitacion = this.traerHabitacion(id);
        habitacion.setNumero(numero);
        habitacion.setPiso(piso);
        habitacion.setPrecio(precio);
        habitacion.setTematica(tematica);
        habitacion.setTipo(tipo);
        habitacion.setCapacidad(ObtenerCapacidad(tipo));
        try {
            controladoraPersistencia.habitacionJPA.edit(habitacion);
        } catch (Exception ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void eliminarHabitacion(long id){
        controladoraPersistencia.eliminarHabitacion(id);
    }
    //Empleados
    public long obtenerIdEmpleado(String usuario, String password){
        PasswordAuthentication passwordAuthentication = new PasswordAuthentication();
        List<Empleado> empleados = controladoraPersistencia.traerEmpleados();
        for(Empleado empleado :  empleados){
            if((usuario.equals(empleado.getUsuario())) && (passwordAuthentication.authenticate(password, empleado.getPassword()))){
                return empleado.getId();
            }
        }
        return 0;
    }
    public List<Empleado> traerEmpleados(){
        return controladoraPersistencia.traerEmpleados();
    }
    public Empleado traerEmpleado(long id){
        return controladoraPersistencia.traerEmpleado(id);
    }
    public boolean hayEmpleadosCargados(){
        return !controladoraPersistencia.traerEmpleados().isEmpty();
    }
    public void crearEmpleado(String nombre, String apellido, String direccion, String profesion, String cargo, String usuario, String password, Date fechaNacimiento, String dni){
        Empleado empleado = new Empleado();
        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setDireccion(direccion);
        empleado.setProfesion(profesion);
        empleado.setCargo(cargo);
        empleado.setUsuario(usuario);
        empleado.setPassword(password);
        empleado.setFechaNacimiento(fechaNacimiento);
        empleado.setDni(dni);
        controladoraPersistencia.crearEmpleado(empleado);
    }
    public void modificarEmpleado(long id, String nombre, String apellido, String profesion, String cargo, String direccion, Date fechaNacimiento, String dni){
        Empleado empleado = this.traerEmpleado(id);
        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setProfesion(profesion);
        empleado.setCargo(cargo);
        empleado.setDireccion(direccion);        
        empleado.setFechaNacimiento(fechaNacimiento);
        empleado.setDni(dni);
        try {
            controladoraPersistencia.empleadoJPA.edit(empleado);
        } catch (Exception ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void eliminarEmpleado(long id){
        controladoraPersistencia.eliminarEmpleado(id);
    }
    

    //Clientes
    public List<Cliente> traerClientes(){
        return controladoraPersistencia.traerClientes();
    }
    public Cliente traerCliente(long id){
        return controladoraPersistencia.traerCliente(id);
    }
    
    public void crearCliente(String nombre, String apellido, String direccion, String profesion, String tipo, Date fechaNacimiento, String dni){
        Cliente cliente = new Cliente();
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDireccion(direccion);
        cliente.setProfesion(profesion);
        cliente.setTipo(tipo);
        cliente.setFechaNacimiento(fechaNacimiento);
        cliente.setDni(dni);
        controladoraPersistencia.crearCliente(cliente);
    }
    public void modificarCliente(long id, String nombre, String apellido, String profesion, String tipo, String direccion, Date fechaNacimiento, String dni){
        Cliente cliente = this.traerCliente(id);
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setProfesion(profesion);
        cliente.setTipo(tipo);
        cliente.setDireccion(direccion);        
        cliente.setFechaNacimiento(fechaNacimiento);
        cliente.setDni(dni);
        try {
            controladoraPersistencia.clienteJPA.edit(cliente);
        } catch (Exception ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void eliminarCliente(long id){
        controladoraPersistencia.eliminarCliente(id);
    }
    
    //Reserva
    public void crearReserva(Date checkIn, Date checkOut, double total, Empleado empleado, Cliente cliente, Habitacion habitacion){
        Date dateCreated = new Date();
        Reserva reserva = new Reserva();
        reserva.setDateCreated(dateCreated);
        reserva.setCheckIn(checkIn);
        reserva.setCheckOut(checkOut);
        reserva.setTotal(total);
        reserva.setEmpleado(empleado);
        reserva.setCliente(cliente);
        reserva.setHabitacion(habitacion);
        controladoraPersistencia.crearReserva(reserva);
    }
    public List<Reserva> traerReservasDia(Date fecha){
        return controladoraPersistencia.traerReservasDia(fecha);
    }
    public List<Reserva> traerReservasEmpleado(long empleadoId){
        return controladoraPersistencia.traerReservasEmpleado(empleadoId);
    }
    public List<Reserva> traerReservasClientePeriodo(Date fechaDesde, Date fechaHasta, long clienteId){
        return controladoraPersistencia.traerReservasClientePeriodo(fechaDesde, fechaHasta, clienteId);
    }
}
