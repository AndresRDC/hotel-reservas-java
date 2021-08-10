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
                Date fechaActualDate = new Date();
                String fechaActual = FormatoFecha.fechaATexto(fechaActualDate);
        %>
        <!-- Navbar -->
        <%@ include file="navbar.jsp" %>
        <!-- cuerpo -->
        <div class="container-xl">
            <div class="row justify-content-center">
                <div class="col-md-7 col-lg-6 col-xl-5">
                    <div class="login-wrap p-4 p-md-5">
                        <h2 class="text-center mb-4">Filtrar habitaciones a reservar</h2>
                        <form action="SvHabitacionesListarDisponibles" method="post">
                             <div class="form-group mb-3">
                                <label class="label" for="checkIn">Check In</label>
                                <input name="checkIn" id="checkIn" type="date" class="form-control" placeholder="01/01/2001" min="<%=fechaActual%>" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="checkOut">Check Out</label>
                                <input name="checkOut" id="checkOut" type="date" class="form-control" placeholder="01/01/2001"  min="<%=fechaActual%>" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="huespedes">Cantidad de huespedes</label>
                                <input name="cantidadHuespedes" id="huespedes" type="number" class="form-control" placeholder="Ingrese cantidad de huespedes" min="1" max="6" value="1" required >
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary rounded submit px-3">Filtrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </body>
</html>