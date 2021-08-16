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
                                    <h3>Bienvenido <%=usuarioActual%></h3>
                                    <h4>Información util</h4>
                                    <p>Tel +54 2262 000-0000</p>
                                    <p>Email info@hotel.com</p>
                                    <p>Av 2 Nro 5454</p>
                                    <p>7630 Necochea, Argentina.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
