<%
    String usuarioActual = (String) request.getSession().getAttribute("empleadoUsuario");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Inicio </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="SvEmpleadosListar">Empleados </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="SvClientesListar">Clientes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="SvHabitacionesListar">Habitaciones</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="habitacionesFiltrar.jsp">Reservar</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Informes
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="SvReservasDia">Reservas en día</a>
                    <a class="dropdown-item" href="SvClientesListarRegistrados">Clientes registrados</a>
                    <!--<a class="dropdown-item" href="#">Reservas empleado</a>-->
                    <!--<a class="dropdown-item" href="#">Reservas cliente por período</a>-->
                    <!--<a class="dropdown-item" href="#">Ganancias diarias</a>-->
                    <!--<a class="dropdown-item" href="#">Ganancias mensuales</a>-->
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="SvLogout">Salir (<%=usuarioActual%>)</a>
            </li>
        </ul>
    </div>
</nav>