<%@page import="Logica.Controladora"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Alta empleado</title>
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
        %>
        <div class="container-xl">
            <div class="row justify-content-center">
                <div class="col-md-7 col-lg-6 col-xl-5">
                    <div class="login-wrap p-4 p-md-5">
                        <h2 class="text-center mb-4">Agregar empleado</h2>
                        <form action="empleadoRegistrar" method="post" class="signup-form">
                            <div class="form-group mb-3">
                                <label class="label" for="nombre">Nombre</label>
                                <input name="nombre" type="text" class="form-control" placeholder="Ingrese nombre" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="apellido">Apellido</label>
                                <input name="apellido" id="apellido" type="text" class="form-control" placeholder="Ingrese apellido" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="dni">DNI</label>
                                <input name="dni" id="dni" type="text" class="form-control" placeholder="Ingrese DNI" minlength="7" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="fechaNacimiento">F.Nacimiento</label>
                                <input name="fechaNacimiento" type="date" class="form-control" placeholder="01/01/2001" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="direccion">Dirección</label>
                                <input name="direccion" id="direccion" type="text" class="form-control" placeholder="Ingrese dirección">
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="profesion">Profesión</label>
                                <input name="profesion" id="profesion" type="text" class="form-control" placeholder="Ingrese profesión">
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="cargo">Cargo</label>
                                <!-- <input name="cargo" id="cargo" type="text" class="form-control" placeholder="Ingrese cargo"> -->
                                <select class="form-control" name="cargo" id="cargo">
                                    <option>-</option>
                                    <option>Gerente</option>
                                    <option>Recepcionista</option>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="usuario">Nombre de usuario</label>
                                <input name="usuario" id="usuario" type="text" class="form-control" placeholder="Ingrese nombre de usuario" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="password">Password</label>
                                <input name="password" id="password" type="password" class="form-control" placeholder="Password" minlength="5" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary rounded submit px-3">Crear empleado</button>
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