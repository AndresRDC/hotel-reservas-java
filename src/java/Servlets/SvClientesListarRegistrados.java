/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Cliente;
import Logica.Controladora;
import Logica.Reserva;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvClientesListarRegistrados", urlPatterns = {"/SvClientesListarRegistrados"})
public class SvClientesListarRegistrados extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date fecha =  new Date();
        Controladora controladora = new Controladora();
        List<Reserva> reservas = controladora.traerReservasDia(fecha);
        
        
        List<Cliente> clientes = new ArrayList<Cliente>() ;
        for(Reserva reserva : reservas){
            clientes.add(reserva.getCliente());
        }
        request.setAttribute("listaClientes", clientes);
        RequestDispatcher miDispatcher = request.getRequestDispatcher("/clientesRegistrados.jsp");
        miDispatcher.forward(request, response);
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
