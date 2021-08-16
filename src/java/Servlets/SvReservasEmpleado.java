/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Controladora;
import Logica.Empleado;
import Logica.FormatoFecha;
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
@WebServlet(name = "SvReservasEmpleado", urlPatterns = {"/SvReservasEmpleado"})
public class SvReservasEmpleado extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String empleadoIdReserva = (String) request.getParameter("id");
        if(empleadoIdReserva != null){
            Controladora controladora = new Controladora();
            Empleado empleado = controladora.traerEmpleado(Long.parseLong(empleadoIdReserva));
            List<Reserva> reservas = controladora.traerReservasEmpleado(Long.parseLong(empleadoIdReserva));
            request.setAttribute("listaReservas", reservas);
            request.setAttribute("empleadoNombre",empleado.getNombreCompleto());
            RequestDispatcher miDispatcher = request.getRequestDispatcher("/reservasEmpleado.jsp");
            miDispatcher.forward(request, response);
        }
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
