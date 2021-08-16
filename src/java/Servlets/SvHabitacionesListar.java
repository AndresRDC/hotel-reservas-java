package Servlets;

import Logica.Controladora;
import Logica.Habitacion;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvHabitacionesListar", urlPatterns = {"/SvHabitacionesListar"})
public class SvHabitacionesListar extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Controladora controladora = new Controladora();
        List<Habitacion> habitaciones = controladora.traerHabitaciones();
        request.setAttribute("listaHabitaciones", habitaciones);
        RequestDispatcher miDispatcher = request.getRequestDispatcher("/habitaciones.jsp");
        miDispatcher.forward(request, response);
        processRequest(request, response);
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
