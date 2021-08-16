<%@page import="java.util.List"%>
<%@page import="Logica.Habitacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@ include file="headCommon.jsp" %>
        <title>Habitaciones</title>
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();
            });
            function pasarId(id) {
                $('#idEliminar').val(id);
            }
            function cargarFormEdit(numeroEdit, pisoEdit, tipoEdit, tematicaEdit, precioEdit, idEdit){
                $('#numeroEdit').val(numeroEdit);
                $('#pisoEdit').val(pisoEdit);
                $('#tipoEdit').val(tipoEdit);
                $('#tematicaEdit').val(tematicaEdit);
                $('#precioEdit').val(precioEdit);
                $('#idEdit').val(idEdit);
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
                            <h2>Habitaciones</h2>
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
                                <th>Numero</th>
                                <th>Piso</th>
                                <th>Tipo</th>
                                <th>Temática</th>
                                <th>Precio</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Habitacion> listaHabitaciones = (List<Habitacion>) request.getAttribute("listaHabitaciones");
                                for (Habitacion habitacion : listaHabitaciones) {
                            %>

                            <tr>
                                <td><%=habitacion.getNumero()%></td>
                                <td><%=habitacion.getPiso()%></td>
                                <td><%=habitacion.getTipo()%></td>
                                <td><%=habitacion.getTematica()%></td>
                                <td><%=habitacion.getPrecio()%></td>
                                <td>
                                    <a href="#editModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit" onclick="cargarFormEdit(<%=habitacion.getNumero()%>, <%=habitacion.getPiso()%>, '<%= habitacion.getTipo()%>', '<%=habitacion.getTematica()%>', <%=habitacion.getPrecio()%>, <%=String.valueOf(habitacion.getId())%>)">&#xE254;</i></a> 
                                    <a href="#deleteModal" class="delete" data-toggle="modal" onclick="pasarId(<%=String.valueOf(habitacion.getId())%>)"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a> 
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
                        <form action="SvHabitacionRegistrar" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Agregar habitacion</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="label" for="numero">Numero</label>
                                    <input name="numero" id="numero" type="number" class="form-control" placeholder="Ingrese numero" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="piso">Piso</label>
                                    <input name="piso" id="piso" type="number" class="form-control" placeholder="Ingrese piso" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="tipo">Tipo</label>
                                    <!-- <input name="tipo" id="tipo" type="text" class="form-control" placeholder="Ingrese tipo" required>-->
                                    <select class="form-control" name="tipo" id="tipo">
                                        <option>Simple</option>
                                        <option>Doble</option>
                                        <option>Triple</option>
                                        <option>Multiple</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="tematica">Tematica</label>
                                    <!-- <input name="tematica" id="tematica" type="text" class="form-control" placeholder="Ingrese tematica">-->
                                    <select class="form-control" name="tematica" id="tematica">
                                        <option>Regular</option>
                                        <option>Matrimonial</option>
                                        <option>Familiar</option>
                                        <option>Suite</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="precio">Precio</label>
                                    <input name="precio" id="precio" type="number" class="form-control" placeholder="Ingrese precio">
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
            <!-- Edit Modal HTML -->
            <div id="editModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="SvHabitacionModificar" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Editar</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">	
                                <div class="form-group">
                                    <label class="label" for="numero">Numero</label>
                                    <input name="numero" id="numeroEdit" type="number" class="form-control" placeholder="Ingrese numero" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="piso">Piso</label>
                                    <input name="piso" id="pisoEdit" type="number" class="form-control" placeholder="Ingrese piso" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="tipo">Tipo</label>
                                    <select class="form-control" name="tipo" id="tipoEdit">
                                        <option>Simple</option>
                                        <option>Doble</option>
                                        <option>Triple</option>
                                        <option>Multiple</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="tematica">Tematica</label>
                                    <!-- <input name="tematica" id="tematicaEdit" type="text" class="form-control" placeholder="Ingrese tematica">-->
                                    <select class="form-control" name="tematica" id="tematicaEdit">
                                        <option>Regular</option>
                                        <option>Matrimonial</option>
                                        <option>Familiar</option>
                                        <option>Suite</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="precio">Precio</label>
                                    <input name="precio" id="precioEdit" type="number" class="form-control" placeholder="Ingrese precio">
                                </div>	
                                <input name="id" id="idEdit" type="hidden" value="">
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                <input type="submit" class="btn btn-info" value="Guardar">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Delete Modal HTML -->
            <div id="deleteModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form method='get' action="SvHabitacionEliminar">
                            <div class="modal-header">						
                                <h4 class="modal-title">Confirmación</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <p>¿Esta seguro que desea eliminarlo?</p>
                                <p class="text-warning"><small>El registro no se podrá recuperar.</small></p>
                            </div>
                            <input name="id" id="idEliminar" type="hidden" value="">
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