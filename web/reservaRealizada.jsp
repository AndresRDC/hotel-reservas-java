<%@page import="Logica.Habitacion"%>
<%@page import="Logica.FormatoFecha"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@ include file="headCommon.jsp" %>
        <title>Inicio</title>
    </head>
    <body>
        <%
            Habitacion habitacion = (Habitacion) request.getAttribute("habitacion");
            String clienteNombre = (String) request.getAttribute("clienteNombre");
            double total = (double) request.getAttribute("total");
            int dias = (int) request.getAttribute("dias");
            String checkIn = (String) request.getAttribute("checkInString");
            String checkOut = (String) request.getAttribute("checkOutString");
        %>

        <!-- Navbar -->
        <%@ include file="navbar.jsp" %>
        <!-- cuerpo -->
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img src="assets/images/undraw_Booking_re_gw4j.svg" alt="Image" class="img-fluid">
                    </div>
                    <div class="col-md-6 contents">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="mb-4">
                                    <h3>Reserva realizada</h3>
                                    <p>
                                        Cliente: <%=clienteNombre%>
                                    </p>
                                    <p>
                                        CheckIn: <%=FormatoFecha.textoATextoDiaMesAnio(checkIn)%> CheckOut: <%=FormatoFecha.textoATextoDiaMesAnio(checkOut)%>
                                    </p>
                                    <p>
                                        Habitación <%=habitacion.getNumero()%> Piso <%=habitacion.getPiso()%> <%=habitacion.getTipo()%> <%=habitacion.getTematica()%>
                                    </p>
                                    <p>
                                        Precio: $ <%=habitacion.getPrecio()%>
                                    </p>
                                    <p>
                                        Estadia: <%=dias%> días
                                    </p>
                                    <p>
                                        Total: $ <%=total%>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
