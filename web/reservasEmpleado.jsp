<%@page import="Logica.Reserva"%>
<%@page import="Logica.FormatoFecha"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.Controladora"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@ include file="headCommon.jsp" %>
        <title>Filtrar Habitaciones</title>
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <%
            String empleadoNombre = (String) request.getAttribute("empleadoNombre");
        %>
        <!-- Navbar -->
        <%@ include file="navbar.jsp" %>
        <!-- cuerpo -->
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <h2>Reservas empleado <%=empleadoNombre%></h2>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Check In</th>
                                <th>Check Out</th>
                                <th>Nro Habitacion</th>
                                <th>Cliente</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                
                                List<Reserva> listaReservas = (List<Reserva>) request.getAttribute("listaReservas");
                                if (listaReservas != null) {
                                    for (Reserva reserva : listaReservas) {
                            %>
                            <tr>
                                <td><%=FormatoFecha.fechaATextoDiaMesAnio(reserva.getCheckIn())%></td>
                                <td><%=FormatoFecha.fechaATextoDiaMesAnio(reserva.getCheckOut())%></td>
                                <td><%=reserva.getHabitacion().getNumero()%></td>
                                <td><%=reserva.getCliente().getNombreCompleto()%></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>