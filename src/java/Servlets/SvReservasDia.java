/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Controladora;
import Logica.FormatoFecha;
import Logica.Habitacion;
import Logica.Reserva;
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

/**
 *
 * @author andre
 */
@WebServlet(name = "SvReservasDia", urlPatterns = {"/SvReservasDia"})
public class SvReservasDia extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                        HttpSession misesion = request.getSession();
        String empleadoId = (String) misesion.getAttribute("empleadoId");
        Controladora controladora = new Controladora();
        boolean hayEmpleadosCargados = controladora.hayEmpleadosCargados();
        if ((empleadoId == null) && (hayEmpleadosCargados)) {
            response.sendRedirect("login");
            return;
        } 
        RequestDispatcher miDispatcher = request.getRequestDispatcher("/reservasDia.jsp");
        miDispatcher.forward(request, response);
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
        String fechaString = (String) request.getParameter("fecha");
        Date fecha = FormatoFecha.textoAFecha(fechaString);
        Controladora controladora = new Controladora();
        List<Reserva> reservas = controladora.traerReservasDia(fecha);
        request.setAttribute("listaReservas", reservas);
        RequestDispatcher miDispatcher = request.getRequestDispatcher("/reservasDia.jsp");
        miDispatcher.forward(request, response);
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
