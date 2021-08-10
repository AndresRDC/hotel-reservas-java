package Logica;

import Logica.Cliente;
import Logica.Empleado;
import Logica.Habitacion;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-08-09T20:44:33")
@StaticMetamodel(Reserva.class)
public class Reserva_ { 

    public static volatile SingularAttribute<Reserva, Cliente> cliente;
    public static volatile SingularAttribute<Reserva, Double> total;
    public static volatile SingularAttribute<Reserva, Date> checkIn;
    public static volatile SingularAttribute<Reserva, Date> dateCreated;
    public static volatile SingularAttribute<Reserva, Empleado> empleado;
    public static volatile SingularAttribute<Reserva, Long> id;
    public static volatile SingularAttribute<Reserva, Date> checkOut;
    public static volatile SingularAttribute<Reserva, Habitacion> habitacion;

}