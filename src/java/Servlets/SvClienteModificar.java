/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvClienteModificar", urlPatterns = {"/SvClienteModificar"})
public class SvClienteModificar extends HttpServlet {

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
        long id = Long.parseLong(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        String profesion = request.getParameter("profesion");
        String tipo = request.getParameter("tipo");
        String dni = request.getParameter("dni");
        String fechaNacimientoString = request.getParameter("fechaNacimiento");     
        if ((nombre == null) || (nombre.length() == 0)
                || (apellido == null) || (apellido.length() == 0)
                || (dni == null) || (dni.length() == 0)
                || (fechaNacimientoString == null) || (fechaNacimientoString.length() < 10)) {
            request.getSession().setAttribute("msgDetail", "Debe completar los campos requeridos (*)");
            response.sendRedirect("SvClientesListar");
            return;
        }
        Date fechaNacimiento = FormatoFecha.textoAFecha(fechaNacimientoString);
        Controladora controladora = new Controladora();
        controladora.modificarCliente(id, nombre, apellido, profesion, tipo, direccion, fechaNacimiento, dni);
        response.sendRedirect("SvClientesListar");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
