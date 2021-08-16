package Servlets;

import Logica.Cliente;
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

@WebServlet(name = "SvReservasClientePeriodo", urlPatterns = {"/SvReservasClientePeriodo"})
public class SvReservasClientePeriodo extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvReservasClientePeriodo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvReservasClientePeriodo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String clienteId = (String) request.getParameter("id");
        if(clienteId != null){
            Controladora controladora = new Controladora();
            Cliente cliente = controladora.traerCliente(Long.parseLong(clienteId));
            request.setAttribute("clienteNombre",cliente.getNombreCompleto());
            RequestDispatcher miDispatcher = request.getRequestDispatcher("/reservasClientePeriodo.jsp");
            miDispatcher.forward(request, response);
        }
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        String fechaDesdeString = request.getParameter("fechaDesde");
        Date fechaDesde = FormatoFecha.textoAFecha(fechaDesdeString);
        String fechaHastaString = request.getParameter("fechaHasta");
        Date fechaHasta = FormatoFecha.textoAFecha(fechaHastaString);
        String clienteId = (String) request.getParameter("id");
        if(clienteId != null){
            Controladora controladora = new Controladora();
            Cliente cliente = controladora.traerCliente(Long.parseLong(clienteId));
            List<Reserva> reservas = controladora.traerReservasClientePeriodo(fechaDesde,fechaHasta,Long.parseLong(clienteId));
            request.setAttribute("listaReservas", reservas);
            request.setAttribute("clienteNombre",cliente.getNombreCompleto());
            RequestDispatcher miDispatcher = request.getRequestDispatcher("/reservasClientePeriodo.jsp");
            miDispatcher.forward(request, response);
        }
        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
