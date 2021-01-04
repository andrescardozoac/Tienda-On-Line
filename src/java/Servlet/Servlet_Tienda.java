/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Clase.Tienda;
import Clase.Tienda_DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andres.cardozo
 */
@WebServlet(name = "Servlet_Tienda", urlPatterns = {"/Servlet_Tienda"})
public class Servlet_Tienda extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
            
            if(accion.equals("registrar")){
                RegistrarTienda(request, response); 
            }
    }
    
     private void RegistrarTienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = request.getParameter("codigoTienda");
        String NuevoCodigo = request.getParameter("txtCodigo");
        String Nombre = request.getParameter("txtNombre");
        String Direccion = request.getParameter("txtDireccion");
        
        
        Tienda tienda = new Tienda();
        tienda.setCodTienda(NuevoCodigo);
        tienda.setNombreTienda(Nombre);
        tienda.setDireccionT(Direccion);
        
         
        boolean resp = Tienda_DB.RegistrarTienda(tienda,codigo);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Tienda Actualizada correctamente'");
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error: Estamos solucionando un problema'"); 
        }
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
