package Servlets;

import Logica.Controladora;
import Logica.FormatoFecha;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvHabitacionSeleccionar", urlPatterns = {"/SvHabitacionSeleccionar"})
public class SvHabitacionSeleccionar extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        long idHabitacion = Long.parseLong(request.getParameter("id"));
        int cantidadHuespedes = Integer.parseInt(request.getParameter("cantidadHuespedes"));
        String checkInString = request.getParameter("checkIn");
        String checkOutString = request.getParameter("checkOut");
        request.getSession().setAttribute("reservaIdHabitacion", idHabitacion);
        request.getSession().setAttribute("reservaCantidadHuespedes", cantidadHuespedes);
        request.getSession().setAttribute("reservaCheckIn", checkInString);
        request.getSession().setAttribute("reservaCheckOut", checkOutString);
        response.sendRedirect("SvClientesListarDisponibles");
        
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
