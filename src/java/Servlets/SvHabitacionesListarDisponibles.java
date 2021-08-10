package Servlets;

import Logica.Controladora;
import Logica.FormatoFecha;
import Logica.Habitacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvHabitacionesListarDisponibles", urlPatterns = {"/SvHabitacionesListarDisponibles"})
public class SvHabitacionesListarDisponibles extends HttpServlet {

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
        if (empleadoId == null) {
            response.sendRedirect("login");
            return;
        } 
        
        int cantidadHuespedes = Integer.parseInt(request.getParameter("cantidadHuespedes"));
        String fechaDesdeString = request.getParameter("checkIn");
        Date fechaDesde = FormatoFecha.textoAFecha(fechaDesdeString);
        String fechaHastaString = request.getParameter("checkOut");
        Date fechaHasta = FormatoFecha.textoAFecha(fechaHastaString);

        Controladora controladora = new Controladora();
        List<Habitacion> habitaciones = controladora.traerHabitacionesSinReservas(fechaDesde, fechaHasta, cantidadHuespedes);
        request.setAttribute("listaHabitaciones", habitaciones);
        RequestDispatcher miDispatcher = request.getRequestDispatcher("/habitacionesDisponibles.jsp");
        miDispatcher.forward(request, response);
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
