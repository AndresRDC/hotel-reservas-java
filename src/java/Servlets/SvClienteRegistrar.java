package Servlets;

import Logica.Controladora;
import Logica.FormatoFecha;
import Logica.PasswordAuthentication;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvClienteRegistrar", urlPatterns = {"/SvClienteRegistrar"})
public class SvClienteRegistrar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                HttpSession misesion = request.getSession();
        String empleadoId = (String) misesion.getAttribute("empleadoId");
        Controladora controladora = new Controladora();
        boolean hayEmpleadosCargados = controladora.hayEmpleadosCargados();
        if ((empleadoId == null) && (hayEmpleadosCargados)) {
            response.sendRedirect("login");
            return;
        } 
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        String profesion = request.getParameter("profesion");
        String tipo = request.getParameter("tipo");
        String fechaNacimientoString = request.getParameter("fechaNacimiento");
        Date fechaNacimiento = FormatoFecha.textoAFecha(fechaNacimientoString);     
        String dni = request.getParameter("dni");
        controladora.crearCliente(nombre, apellido, direccion, profesion, tipo, fechaNacimiento, dni);
        
        Object reservaIdHabitacion =  misesion.getAttribute("reservaIdHabitacion");
        if(reservaIdHabitacion != null){
            response.sendRedirect("SvClientesListarDisponibles");
        }else{
            response.sendRedirect("SvClientesListar");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
