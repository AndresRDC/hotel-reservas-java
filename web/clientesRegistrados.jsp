<%@page import="Logica.Cliente"%>
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
            Date fecha = new Date();
            String fechaString = FormatoFecha.fechaATextoDiaMesAnio(fecha);
        %>
        <!-- Navbar -->
        <%@ include file="navbar.jsp" %>
        <!-- cuerpo -->
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <h2>Clientes huespedes registrados actualmente (<%=fechaString%>)</h2>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>DNI</th>
                                <th>Direccion</th>
                                <th>Tipo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Cliente> listaClientes = (List<Cliente>) request.getAttribute("listaClientes");
                                for (Cliente cliente : listaClientes) {
                            %>

                            <tr>
                                <td><%=cliente.getNombreCompleto()%></td>
                                <td><%=cliente.getDni()%></td>
                                <td><%=cliente.getDireccion()%></td>
                                <td><%=cliente.getTipo()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>