/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Cliente;
import Logica.Controladora;
import Logica.Empleado;
import Logica.FormatoFecha;
import Logica.Habitacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
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

/**
 *
 * @author andre
 */
@WebServlet(name = "SvReservaRegistrar", urlPatterns = {"/SvReservaRegistrar"})
public class SvReservaRegistrar extends HttpServlet {
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
        long empleadoActualId = Long.parseLong(empleadoId);
        long clienteId = Long.parseLong(request.getParameter("id"));
        
        long habitacionId =  (long) misesion.getAttribute("reservaIdHabitacion");
        String checkInString = (String)  misesion.getAttribute("reservaCheckIn");
        String checkOutString = (String)  misesion.getAttribute("reservaCheckOut");
        
        int cantidadHuespedes = (int) misesion.getAttribute("reservaCantidadHuespedes");
        Date checkIn = FormatoFecha.textoAFecha(checkInString);
        Date checkOut = FormatoFecha.textoAFecha(checkOutString);
                
        Controladora controladora = new Controladora();
        
        Empleado empleado = controladora.traerEmpleado(empleadoActualId);
        Cliente cliente = controladora.traerCliente(clienteId);
        Habitacion habitacion = controladora.traerHabitacion(habitacionId);       
        //Diferencia días
        int milisegundosPorDia = 86400000;
        int dias = (int) ((checkOut.getTime()  - checkIn.getTime()) / milisegundosPorDia);
        double total = dias * habitacion.getPrecio();
        controladora.crearReserva(checkIn, checkOut, total, empleado, cliente, habitacion);
        
        request.getSession().removeAttribute("reservaIdHabitacion");
        request.getSession().removeAttribute("reservaCheckIn");
        request.getSession().removeAttribute("reservaCheckOut");
        request.getSession().removeAttribute("reservaCantidadHuespedes");
       
        
        request.setAttribute("clienteNombre", cliente.getNombreCompleto());
        request.setAttribute("habitacion", habitacion);
        request.setAttribute("total", total);   
        request.setAttribute("checkInString", checkInString); 
        request.setAttribute("checkOutString", checkOutString); 
        request.setAttribute("dias", dias);         
        RequestDispatcher miDispatcher = request.getRequestDispatcher("/reservaRealizada.jsp");
        miDispatcher.forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
