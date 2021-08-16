package Servlets;

import Logica.Cliente;
import Logica.Controladora;
import Logica.Empleado;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvClientesListar", urlPatterns = {"/SvClientesListar"})
public class SvClientesListar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Para asegurarme no redirija a cliente de seleccion reserva
        //No debería pasar pero al no implementar cancelar pueden quedar los datos en sesión
        request.getSession().removeAttribute("reservaIdHabitacion");
        request.getSession().removeAttribute("reservaCheckIn");
        request.getSession().removeAttribute("reservaCheckOut");
        request.getSession().removeAttribute("reservaCantidadHuespedes");

        Controladora controladora = new Controladora();
        List<Cliente> clientes = controladora.traerClientes();
        request.setAttribute("listaClientes", clientes);
        RequestDispatcher miDispatcher = request.getRequestDispatcher("/clientes.jsp");
        miDispatcher.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
