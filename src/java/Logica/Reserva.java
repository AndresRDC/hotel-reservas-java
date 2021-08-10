package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Reserva implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Temporal(TemporalType.DATE)
    private Date checkIn;
    @Temporal(TemporalType.DATE)
    private Date checkOut;
    @Temporal(TemporalType.DATE)
    private Date dateCreated;
    @Basic
    private double total;
    @ManyToOne
    private Empleado empleado;
    @ManyToOne
    private Cliente cliente;
    @ManyToOne
    private Habitacion habitacion;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Habitacion getHabitacion() {
        return habitacion;
    }

    public void setHabitacion(Habitacion habitacion) {
        this.habitacion = habitacion;
    }

    public Reserva(long id, Date checkIn, Date checkOut, Date dateCreated, double total, Empleado empleado, Cliente cliente, Habitacion habitacion) {
        this.id = id;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.dateCreated = dateCreated;
        this.total = total;
        this.empleado = empleado;
        this.cliente = cliente;
        this.habitacion = habitacion;
    }

    public Reserva() {
    }
}
