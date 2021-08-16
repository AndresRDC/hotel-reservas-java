/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author andre
 */
@WebFilter(filterName = "LoginFilter", urlPatterns = {"/*"})
public class LoginFilter implements Filter {
    private HttpServletRequest httpRequest;
    private static final String[] notLoginRequiredURLs = {
        "/login",
        "/empleadoAlta.jsp",
        "/empleadoRegistrar"
    };

    private FilterConfig filterConfig = null;
    
    public LoginFilter() {
    }    
       

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
httpRequest = (HttpServletRequest) request;
 
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
 
        if (path.startsWith("/assets/")) {
            chain.doFilter(request, response);
            return;
        }
        HttpSession session = httpRequest.getSession(false);
 
        boolean isLoggedIn = (session != null && session.getAttribute("empleadoId") != null);
 
        String loginURI = httpRequest.getContextPath() + "/login";
        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
        boolean isLoginPage = httpRequest.getRequestURI().endsWith("login.jsp");
 
        if (isLoggedIn && (isLoginRequest || isLoginPage)) {
            // the user is already logged in and he's trying to login again
            // then forward to the homepage
            httpRequest.getRequestDispatcher("/").forward(request, response);
 
        } else if (!isLoggedIn && !isNotLoginRequired()) {
            // the user is not logged in, and the requested page requires
            // authentication, then forward to the login page
            String loginPage = "/login";
            RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginPage);
            dispatcher.forward(request, response);
        } else {
            // for other requested pages that do not require authentication
            // or the user is already logged in, continue to the destination
            chain.doFilter(request, response);
        }
        


    }
    private boolean isNotLoginRequired() {
        String requestURL = httpRequest.getRequestURL().toString();
        for (String notLoginRequiredURL : notLoginRequiredURLs) {
            if (requestURL.contains(notLoginRequiredURL)) {
                return true;
            }
        }
        return false;
    }

    public void destroy() {        
    }


    public void init(FilterConfig filterConfig) {        
    }
  
    
}
