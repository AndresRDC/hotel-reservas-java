/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvLogin", urlPatterns = {"/login"})
public class SvLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Si estas logueado al index
        HttpSession misesion = request.getSession();
        String empleadoId = (String) misesion.getAttribute("empleadoId");
        if (empleadoId != null) {
            response.sendRedirect("index.jsp");
            return;
        } 
        //Si no hay empleados cargados al alta sino al login
        Controladora controladora = new Controladora();
        boolean hayEmpleadosCargados = controladora.hayEmpleadosCargados();
        if (!hayEmpleadosCargados){
            response.sendRedirect("empleadoAlta.jsp");
        }else{
            RequestDispatcher miDispatcher = request.getRequestDispatcher("/login.jsp");
            miDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        if((usuario == null) || (password == null) || (usuario.length() == 0) || (password.length() == 0)){
            request.getSession().setAttribute("msgDetail", "Datos ingresados no validos");
            RequestDispatcher miDispatcher = request.getRequestDispatcher("/login.jsp");
            miDispatcher.forward(request, response);
            return;
        }
        Controladora controladora = new Controladora();
        long empleadoId = controladora.obtenerIdEmpleado(usuario,password);
        if(empleadoId != 0){
            request.getSession().setAttribute("empleadoUsuario", usuario);
            request.getSession().setAttribute("empleadoId", String.valueOf(empleadoId));
            response.sendRedirect("index.jsp");
        }else{
            request.getSession().setAttribute("msgDetail", "Verifique los valores ingresados");
            RequestDispatcher miDispatcher = request.getRequestDispatcher("/login.jsp");
            miDispatcher.forward(request, response);
        }      
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
