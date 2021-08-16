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
            function pasarId(id) {
                $('#idEliminar').val(id);
            }
            function cargarFormEdit(nombreEdit, apellidoEdit, fechaNacimientoEdit, direccionEdit, profesionEdit, tipoEdit, dniEdit, idEdit){
                $('#nombreEdit').val(nombreEdit);
                $('#apellidoEdit').val(apellidoEdit);
                $('#fechaNacimientoEdit').val(fechaNacimientoEdit);
                $('#direccionEdit').val(direccionEdit);
                $('#profesionEdit').val(profesionEdit);
                $('#tipoEdit').val(tipoEdit);
                $('#dniEdit').val(dniEdit);
                $('#idEdit').val(idEdit);
            }            
        </script>
    </head>
    <body>
        <%
            HttpSession misesion = request.getSession();
            String empleadoId = (String) misesion.getAttribute("empleadoId");
            if (empleadoId == null) {
                response.sendRedirect("login");
            } else {
        %>

        <!-- Navbar -->
        <%@ include file="navbar.jsp" %>
        <!-- cuerpo -->
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <h2>Clientes</h2>
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
                                <th>Acciones</th>
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
                                <td>
                                    <a href="#editModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit" onclick="cargarFormEdit('<%=cliente.getNombre()%>', '<%=cliente.getApellido()%>', '<%= FormatoFecha.fechaATexto(cliente.getFechaNacimiento())%>', '<%=cliente.getDireccion()%>', '<%=cliente.getProfesion()%>', '<%=cliente.getTipo()%>', '<%=cliente.getDni()%>', <%=String.valueOf(cliente.getId())%>)">&#xE254;</i></a> 
                                    <a href="#deleteModal" class="delete" data-toggle="modal" onclick="pasarId(<%=String.valueOf(cliente.getId())%>)"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a> 
                                    <a href="SvReservasClientePeriodo?id=<%=String.valueOf(cliente.getId())%>" class="reservas"><i class="material-icons" data-toggle="tooltip" title="Reservas">&#xe880;</i></a>
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
            <!-- Edit Modal HTML -->
            <div id="editModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="SvClienteModificar" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Editar</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label class="label" for="nombre">Nombre</label>
                                    <input name="nombre"  id="nombreEdit" type="text" class="form-control" placeholder="Ingrese nombre" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="apellido">Apellido</label>
                                    <input name="apellido" id="apellidoEdit" type="text" class="form-control" placeholder="Ingrese apellido" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="dni">DNI</label>
                                    <input name="dni" id="dniEdit" type="text" class="form-control" placeholder="Ingrese DNI" minlength="7" required>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="fechaNacimiento">F.Nacimiento</label>
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
                                    <label class="label" for="tipo">Tipo</label>
                                    <select class="form-control" name="tipo" id="tipoEdit">
                                        <option>Regular</option>
                                        <option>Corporativo</option>
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
                        <form method='get' action="SvClienteEliminar">
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
            <%
                }
            %>
    </body>
</html>