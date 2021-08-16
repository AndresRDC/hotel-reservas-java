/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

@WebServlet(name = "SvHabitacionRegistrar", urlPatterns = {"/SvHabitacionRegistrar"})
public class SvHabitacionRegistrar extends HttpServlet {

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
        Controladora controladora = new Controladora();
        int numero = Integer.parseInt(request.getParameter("numero"));
        int piso = Integer.parseInt(request.getParameter("piso"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        String tematica = request.getParameter("tematica");
        String tipo = request.getParameter("tipo");
        if ((numero <= 0) || (piso <= 0) || (precio <= 0)
                || (tematica == null) || (tematica.length() == 0)
                || (tipo == null) || (tipo.length() == 0)) {
            request.getSession().setAttribute("msgDetail", "Debe completar los campos requeridos (*)");
            response.sendRedirect("SvHabitacionesListar");
            return;
        }
        controladora.crearHabitacion(numero, piso, tematica, tipo, precio);
        response.sendRedirect("SvHabitacionesListar");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
