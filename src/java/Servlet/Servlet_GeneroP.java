

package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Clase.*;


public class Servlet_GeneroP extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String accion = request.getParameter("accion");
            
            if(accion.equals("insertar")){
                this.RegistrarGeneroPelicula(request, response);
            }
            if(accion.equals("actualizar")){
                this.ActualizarGeneroPelicula(request, response);
            }
            if(accion.equals("eliminar")){
                this.darBajaGeneroPelicula(request, response);
            }
            if(accion.equals("recuperar")){
                this.darAltaGeneroPelicula(request, response);
            }
        }
    }
    
    private void RegistrarGeneroPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GeneroP mp = new GeneroP();
        mp.setNombreMP(request.getParameter("txtNombre"));
        
        boolean resp = GeneroP_DB.insertarGeneroPelicula(mp);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha registrado un genero de pelicula correctamente'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al registrar en genero pelicula'"); 
        }
    }
    
    private void ActualizarGeneroPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GeneroP mp = new GeneroP();
        mp.setCodigoMP(request.getParameter("txtCodigo"));
        mp.setNombreMP(request.getParameter("txtNombre")); 
        
        boolean resp = GeneroP_DB.actualizarGeneroPelicula(mp);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha modificado el genero de la pelicula "+mp.getCodigoMP()+"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al modificar el genero de la pelicula'"); 
        }
    }
    
    private void darBajaGeneroPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GeneroP mp = new GeneroP();
        mp.setCodigoMP(request.getParameter("codigoMP"));
        
        boolean resp = GeneroP_DB.eliminarGeneroPelicula(mp);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha eliminado el genero de la pelicula "+mp.getCodigoMP()+"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al eliminar el genero de la pelicula'"); 
        }
    }
    
    private void darAltaGeneroPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GeneroP mp = new GeneroP();
        mp.setCodigoMP(request.getParameter("codigoMP"));
        
        boolean resp = GeneroP_DB.recuperarGeneroPelicula(mp);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha recuperado el genero de la pelicula "+mp.getCodigoMP()+"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al recuperar el genero de la pelicula'"); 
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
