/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

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

@WebServlet(name = "SvEmpleadoEliminar", urlPatterns = {"/SvEmpleadoEliminar"})
public class SvEmpleadoEliminar extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        long id = Long.parseLong(request.getParameter("id"));
        
        HttpSession misesion = request.getSession();
        String empleadoId = (String) misesion.getAttribute("empleadoId");
        long empleadoActualId = Long.parseLong(empleadoId);

        if(id == empleadoActualId){
            request.getSession().setAttribute("msgDetail", "No se puede eliminar el empleado actual");
            response.sendRedirect("SvEmpleadosListar");
            return;
        }
        Controladora controladora = new Controladora();
        controladora.eliminarEmpleado(id);
        response.sendRedirect("SvEmpleadosListar");
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
