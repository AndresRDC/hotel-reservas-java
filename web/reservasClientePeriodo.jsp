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
        <title>Reservas cliente periodo</title>
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
            String clienteNombre = (String) request.getAttribute("clienteNombre");
            String clienteId = request.getParameter("id");
            String fechaDesde = request.getParameter("fechaDesde");
            String fechaDesdeString = "";
            if(fechaDesde!=null){
                fechaDesdeString = FormatoFecha.textoATextoDiaMesAnio(fechaDesde);
            }
            String fechaHasta = request.getParameter("fechaHasta");
            String fechaHastaString = "";
            if(fechaHasta!=null){
                fechaHastaString = FormatoFecha.textoATextoDiaMesAnio(fechaHasta);
            }
        %>
        <!-- Navbar -->
        <%@ include file="navbar.jsp" %>
        <!-- cuerpo -->
        <div class="container-xl">
            <div class="row justify-content-center">
                <div class="col-md-7 col-lg-6 col-xl-5">
                    <div class="login-wrap p-4 p-md-5">
                        <h2 class="text-center mb-4">Filtrar reservas Cliente periodo</h2>
                        <form action="SvReservasClientePeriodo" method="post">
                            <div class="form-group mb-3">
                                <label class="label" for="fecha">Fecha desde</label>
                                <input name="fechaDesde" id="fechaDesde" type="date" class="form-control" placeholder="01/01/2001" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="fecha">Fecha hasta</label>
                                <input name="fechaHasta" id="fechaHasta" type="date" class="form-control" placeholder="01/01/2001" required>
                            </div>
                            <input name="id" id="id" type="hidden" value="<%=clienteId%>">
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary rounded submit px-3">Filtrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <h2>Reservas <%=clienteNombre%> <%=fechaDesdeString%> <%=fechaHastaString%></h2>
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
                        <input name="pathRedirect" id="pathRedirect" type="hidden" value='SvReservasClientePeriodo?id=<%=clienteId%>'>
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