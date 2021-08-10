<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <!-- Bootstrap CSS -->
        <!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <!-- Style -->
        <link rel="stylesheet" href="css/style.css">
        <title>Ingresar</title>
    </head>
    <body>
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img src="images/undraw_remotely_2j6y.svg" alt="Image" class="img-fluid">
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


        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

