
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Clase.*;


public class Servlet_ClasificacionP extends HttpServlet {

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
           
            
            String accion = request.getParameter("accion");
            if(accion.equals("insertar")){
                this.RegistrarClasificacionPelicula(request, response);
            }
            if(accion.equals("actualizar")){
                this.ActualizarClasificacionPelicula(request, response); 
            }
            if(accion.equals("eliminar")){
                this.EliminarClasificacionPelicula(request, response); 
            }
            if(accion.equals("recuperar")){
                this.RecuperarClasificacionPelicula(request, response); 
            }
            
        }
    }
    
    private void RegistrarClasificacionPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        ClasificacionP cp = new ClasificacionP();
        cp.setNombreCP(request.getParameter("txtNombre")); 
        
        boolean resp = ClasificacionP_DB.insertarClasificacionPelicula(cp);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha registrado una clasificacion de la pelicula correctamente'");
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al registrar en la clasificacion de la pelicula'"); 
        }
    }
    
    private void ActualizarClasificacionPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        ClasificacionP cp = new ClasificacionP();
        cp.setCodigoCP(request.getParameter("txtCodigo"));
        cp.setNombreCP(request.getParameter("txtNombre")); 
        
        boolean resp = ClasificacionP_DB.actualizarClasificacionPelicula(cp);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha modificado la clasificacion de la pelicula "+cp.getCodigoCP()+"'");
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al actualizar la clasificacion de la pelicula'");
        }
    }
    
    private void EliminarClasificacionPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        ClasificacionP cp = new ClasificacionP();
        cp.setCodigoCP(request.getParameter("codigoCP"));
        
        boolean resp = ClasificacionP_DB.darBajaClasificacionPelicula(cp);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha eliminado la clasificacion de la pelicula "+cp.getCodigoCP()+"'");
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al eliminar la clasificacion de la pelicula'");
        }
    }
    
    private void RecuperarClasificacionPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        ClasificacionP cp = new ClasificacionP();
        cp.setCodigoCP(request.getParameter("codigoCP"));
        
        boolean resp = ClasificacionP_DB.darAltaClasificacionPelicula(cp);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha recuperado la clasificacion de la pelicula "+cp.getCodigoCP()+"'");
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al recuperar la clasificacion de la pelicula'");
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
