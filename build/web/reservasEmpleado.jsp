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
        <title>Filtrar Habitaciones</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <%
            HttpSession misesion = request.getSession();
            String empleadoId = (String) misesion.getAttribute("empleadoId");
            Controladora controladora = new Controladora();
            boolean hayEmpleadosCargados = controladora.hayEmpleadosCargados();
            if ((empleadoId == null) && (hayEmpleadosCargados)) {
                response.sendRedirect("login");
            } else {
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
        <%
            }
        %>
    </body>
</html>