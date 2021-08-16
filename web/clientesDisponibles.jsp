<%@page import="Logica.FormatoFecha"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Clientes</title>
        <%@ include file="headCommon.jsp" %>
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();
            });
            function pasarId(id) {
                $('#idReservar').val(id);
            }
        </script>
    </head>
    <body>
        <!-- Navbar -->
        <%@ include file="navbar.jsp" %>
        <!-- cuerpo -->
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <h2>Seleccione cliente reserva</h2>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <a href="#addModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Agregar</span></a>
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
                                <th>Reservar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                List<Cliente> listaClientes = (List<Cliente>) request.getAttribute("listaClientes");
                                for (Cliente cliente : listaClientes) {
                            %>

                            <tr>
                                <td><%=cliente.getNombreCompleto()%></td>
                                <td><%=cliente.getDni()%></td>
                                <td><%=cliente.getDireccion()%></td>
                                <td><%=cliente.getTipo()%></td>
                                <td>
                                    <a href="#reservarModal" class="success" data-toggle="modal" onclick="pasarId(<%=String.valueOf(cliente.getId())%>)"><i class="material-icons" data-toggle="tooltip" title="Reservar">&#xe862;</i></a>
                                </td>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="addModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="SvClienteRegistrar" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Agregar cliente</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="label" for="nombre">Nombre</label>
                                    <input name="nombre" type="text" class="form-control" placeholder="Ingrese nombre" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="apellido">Apellido</label>
                                    <input name="apellido" id="apellido" type="text" class="form-control" placeholder="Ingrese apellido" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="dni">DNI</label>
                                    <input name="dni" id="dni" type="text" class="form-control" placeholder="Ingrese DNI" minlength="7" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="fechaNacimiento">F.Nacimiento</label>
                                    <input name="fechaNacimiento" type="date" class="form-control" placeholder="01/01/2001" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="direccion">Dirección</label>
                                    <input name="direccion" id="direccion" type="text" class="form-control" placeholder="Ingrese dirección">
                                </div>
                                <div class="form-group">
                                    <label class="label" for="profesion">Profesión</label>
                                    <input name="profesion" id="profesion" type="text" class="form-control" placeholder="Ingrese profesión">
                                </div>
                                <div class="form-group">
                                    <label class="label" for="tipo">Tipo</label>
                                    <select class="form-control" name="tipo" id="tipo">
                                        <option>Regular</option>
                                        <option>Corporativo</option>
                                    </select>
                                </div>			
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                <input type="submit" class="btn btn-success" value="Guardar">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Reserva Modal HTML -->
            <div id="reservarModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form method='post' action="SvReservaRegistrar">
                            <div class="modal-header">						
                                <h4 class="modal-title">Confirmación</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <p>¿Esta seguro de generar reserva?</p>
                                <p class="text-warning"><small>Si presiona el reservar la reserva será realizada!</small></p>
                            </div>
                            <input name="id" id="idReservar" type="hidden" value="">
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                <input type="submit" class="btn btn-success" value="Reservar">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </body>
</html>