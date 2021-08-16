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
        <title>Empleados</title>
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();
            });
            function pasarId(id) {
                $('#idEliminar').val(id);
            }
            function cargarFormEdit(nombreEdit, apellidoEdit, fechaNacimientoEdit, direccionEdit, profesionEdit, cargoEdit, dniEdit, idEdit) {
                $('#nombreEdit').val(nombreEdit);
                $('#apellidoEdit').val(apellidoEdit);
                $('#fechaNacimientoEdit').val(fechaNacimientoEdit);
                $('#direccionEdit').val(direccionEdit);
                $('#profesionEdit').val(profesionEdit);
                $('#cargoEdit').val(cargoEdit);
                $('#dniEdit').val(dniEdit);
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
                            <h2>Empleados</h2>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <!-- <a href="empleadoAlta.jsp" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Agregar</span></a> -->
                            <a href="#addModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Agregar</span></a>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Cargo</th>
                                <th>DNI</th>
                                <th>Usuario</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                List<Empleado> listaEmpleados = (List<Empleado>) request.getAttribute("listaEmpleados");
                                for (Empleado empleado : listaEmpleados) {
                            %>
                            <tr>
                                <td><%=empleado.getNombreCompleto()%></td>
                                <td><%=empleado.getCargo()%></td>
                                <td><%=empleado.getDni()%></td>
                                <td><%=empleado.getUsuario()%></td>
                                <td>
                                    <a href="#editModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit" onclick="cargarFormEdit('<%=empleado.getNombre()%>', '<%=empleado.getApellido()%>', '<%= FormatoFecha.fechaATexto(empleado.getFechaNacimiento())%>', '<%=empleado.getDireccion()%>', '<%=empleado.getProfesion()%>', '<%=empleado.getCargo()%>', '<%=empleado.getDni()%>', <%=String.valueOf(empleado.getId())%>)">&#xE254;</i></a> 
                                    <a href="#deleteModal" class="delete" data-toggle="modal" onclick="pasarId(<%=String.valueOf(empleado.getId())%>)"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    <a href="SvReservasEmpleado?id=<%=String.valueOf(empleado.getId())%>" class="reservas"><i class="material-icons" data-toggle="tooltip" title="Reservas">&#xe880;</i></a>
                                </td>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- add Modal HTML -->
            <div id="addModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="empleadoRegistrar" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Agregar empleado</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="label" for="nombre">Nombre *</label>
                                    <input name="nombre" type="text" class="form-control" placeholder="Ingrese nombre" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="apellido">Apellido *</label>
                                    <input name="apellido" id="apellido" type="text" class="form-control" placeholder="Ingrese apellido" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="dni">DNI *</label>
                                    <input name="dni" id="dni" type="text" class="form-control" placeholder="Ingrese DNI" minlength="7" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="fechaNacimiento">F.Nacimiento *</label>
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
                                    <label class="label" for="cargo">Cargo</label>
                                    <select class="form-control" name="cargo" id="cargo">
                                        <option>-</option>
                                        <option>Gerente</option>
                                        <option>Recepcionista</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="usuario">Nombre de usuario *</label>
                                    <input name="usuario" id="usuario" type="text" class="form-control" placeholder="Ingrese nombre de usuario" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="password">Password *</label>
                                    <input name="password" id="password" type="password" class="form-control" placeholder="Password" required>
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
                        <form action="SvEmpleadoModificar" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Editar</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label class="label" for="nombre">Nombre *</label>
                                    <input name="nombre"  id="nombreEdit" type="text" class="form-control" placeholder="Ingrese nombre" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="apellido">Apellido *</label>
                                    <input name="apellido" id="apellidoEdit" type="text" class="form-control" placeholder="Ingrese apellido" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="dni">DNI *</label>
                                    <input name="dni" id="dniEdit" type="text" class="form-control" placeholder="Ingrese DNI" minlength="7" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="fechaNacimiento">F.Nacimiento *</label>
                                    <input name="fechaNacimiento" id="fechaNacimientoEdit" type="date" class="form-control" placeholder="01/01/2001" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="direccion">Dirección</label>
                                    <input name="direccion" id="direccionEdit" type="text" class="form-control" placeholder="Ingrese dirección">
                                </div>
                                <div class="form-group">
                                    <label class="label" for="profesion">Profesión</label>
                                    <input name="profesion" id="profesionEdit" type="text" class="form-control" placeholder="Ingrese profesión">
                                </div>
                                <div class="form-group">
                                    <label class="label" for="cargo">Cargo</label>
                                    <select class="form-control" name="cargo" id="cargoEdit">
                                        <option>-</option>
                                        <option>Gerente</option>
                                        <option>Recepcionista</option>
                                    </select>
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
                        <form method='get' action="SvEmpleadoEliminar">
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
            <%@ include file="msgModal.jsp" %>
    </body>
</html>