<%@page import="Logica.FormatoFecha"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Habitacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Habitaciones</title>
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
                $('#idReservar').val(id);
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
                String fechaDesdeString = request.getParameter("checkIn");
                String fechaHastaString = request.getParameter("checkOut");
                String cantidadHuespedes = request.getParameter("cantidadHuespedes");
        %>
        <!-- Navbar -->
        <%@ include file="navbar.jsp" %>        
        <!-- cuerpo -->
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-12">
                            <h2>Habitaciones Disponibles desde <%= FormatoFecha.textoATextoDiaMesAnio(fechaDesdeString)%> al <%=FormatoFecha.textoATextoDiaMesAnio(fechaHastaString)%> Huesped/es: <%=cantidadHuespedes%> </h2>
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
                                <th>Seleccionar</th>
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
                                    <a href="#reservarModal" class="success" data-toggle="modal" onclick="pasarId(<%=String.valueOf(habitacion.getId())%>)"><i class="material-icons" data-toggle="tooltip" title="Reservar">&#xe862;</i></a> 
                                </td>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Reservar Modal HTML -->
            <div id="reservarModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form method='get' action="SvHabitacionSeleccionar">
                            <div class="modal-header">						
                                <h4 class="modal-title">Confirmación</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <p>¿Esta seguro de seleccionar habitación?</p>
                                <p class="text-warning"><small>Una vez seleccionada, solo resta seleccionar cliente para realizar reserva</small></p>
                            </div>
                            <input name="id" id="idReservar" type="hidden" value="">
                            <input name="checkIn" id="checkIn" type="hidden" value="<%=fechaDesdeString%>">
                            <input name="checkOut" id="checkOut" type="hidden" value="<%=fechaHastaString%>">
                            <input name="cantidadHuespedes" id="cantidadHuespedes" type="hidden" value="<%=cantidadHuespedes%>">                            
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                <input type="submit" class="btn btn-success" value="Seleccionar">
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