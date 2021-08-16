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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvEmpleadoRegistrar", urlPatterns = {"/empleadoRegistrar"})
public class SvEmpleadoRegistrar extends HttpServlet {

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
        String cargo = request.getParameter("cargo");
        String usuario = request.getParameter("usuario");
        String passwordPlano = request.getParameter("password");
        String fechaNacimientoString = request.getParameter("fechaNacimiento");
        String dni = request.getParameter("dni");
        if ((nombre == null) || (nombre.length() == 0)
                || (apellido == null) || (apellido.length() == 0)
                || (dni == null) || (dni.length() == 0)
                || (usuario == null) || (usuario.length() == 0)
                || (passwordPlano == null) || (passwordPlano.length() == 0)
                || (fechaNacimientoString == null) || (fechaNacimientoString.length() < 10)) {
            request.getSession().setAttribute("msgDetail", "Debe completar los campos requeridos (*)");

            if (hayEmpleadosCargados) {
                response.sendRedirect("SvEmpleadosListar");
            } else {
                response.sendRedirect("empleadoAlta.jsp");
            }
            return;
        }
        PasswordAuthentication passwordAuthentication = new PasswordAuthentication();
        String password = passwordAuthentication.hash(passwordPlano);
        Date fechaNacimiento = FormatoFecha.textoAFecha(fechaNacimientoString);
        controladora.crearEmpleado(nombre, apellido, direccion, profesion, cargo, usuario, password, fechaNacimiento, dni);
        response.sendRedirect("SvEmpleadosListar");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
