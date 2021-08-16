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
            function pasarId(id) {
                $('#idEliminar').val(id);
            }
        </script>
    </head>
    <body>
        <%
            String empleadoNombre = (String) request.getAttribute("empleadoNombre");
            String empleadoId = (String) request.getParameter("id");
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
                                <th>Acciones</th>
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
                                <td>
                                    <a href="#deleteModal" class="delete" data-toggle="modal" onclick="pasarId(<%=String.valueOf(reserva.getId())%>)"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
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
        <!-- Delete Modal HTML -->
        <div id="deleteModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method='get' action="SvReservaEliminar">
                        <div class="modal-header">						
                            <h4 class="modal-title">Confirmación</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>¿Esta seguro que desea eliminarla?</p>
                            <p class="text-warning"><small>El registro no se podrá recuperar.</small></p>
                        </div>
                        <input name="id" id="idEliminar" type="hidden" value="">
                        <input name="pathRedirect" id="pathRedirect" type="hidden" value='SvReservasEmpleado?id=<%=empleadoId%>'>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                            <input type="submit" class="btn btn-danger" value="Eliminar">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>