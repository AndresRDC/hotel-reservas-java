<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@ include file="headCommon.jsp" %>
        <title>Ingresar</title>
    </head>
    <body>
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img src="assets/images/undraw_remotely_2j6y.svg" alt="Image" class="img-fluid">
                    </div>
                    <div class="col-md-6 contents">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="mb-4">
                                    <h3>Ingresar</h3>
                                    <p class="mb-4">Si aún no posees un usuario solicitalo al supervisor</p>
                                </div>
                                <form action="login" method="post">
                                    <div class="form-group first">
                                        <label for="username">Nombre de usuario</label>
                                        <input name="usuario"type="text" class="form-control" id="username">

                                    </div>
                                    <div class="form-group last mb-4">
                                        <label for="password">Password</label>
                                        <input name="password" type="password" class="form-control" id="password">
                                    </div>
                                    <input type="submit" value="Ingresar" class="btn btn-block btn-primary">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="msgModal.jsp" %>
    </body>
</html>

