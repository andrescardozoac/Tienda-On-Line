

package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Clase.*;
import Conexion.Conexion;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.servlet.http.HttpSession;


public class Servlet_Pelicula extends HttpServlet {

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
                this.RegistrarPelicula(request, response); 
            }
            if(accion.equals("actualizar")){
                this.ActualizarPelicula(request, response); 
            }
            if(accion.equals("eliminar")){
                this.DarBajaPelicula(request, response); 
            }
            if(accion.equals("recuperar")){
                this.DarAltaPelicula(request, response); 
            }
            if(accion.equals("anadirCarrito")){
                this.AnadirCarrito(request, response);
            }
        }
    }
    
    private void RegistrarPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pelicula p = new Pelicula();
        p.setClasificacionPelicula(request.getParameter("txtClase")); 
        p.setGeneroPelicula(request.getParameter("txtMarca"));
        p.setTitulo(request.getParameter("txtTitulo"));
        p.setDescripcion(request.getParameter("txtDescripcion"));
        p.setPrecioP(Double.parseDouble(request.getParameter("txtPrecio")));
        p.setImagenP(request.getParameter("txtImagen")); 
        
        boolean resp = Pelicula_DB.insertarPelicula(p);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha registrado una pelicula correctamente'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al registrar una pelicula'"); 
        }
    }
    
    private void ActualizarPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pelicula p = new Pelicula();
        p.setCodigoP(request.getParameter("txtCodigo")); 
        p.setClasificacionPelicula(request.getParameter("txtNombreCP")); 
        p.setGeneroPelicula(request.getParameter("txtNombreMP"));
        p.setTitulo(request.getParameter("txtTituloP"));
        p.setDescripcion(request.getParameter("txtDescripcionP"));
        p.setPrecioP(Double.parseDouble(request.getParameter("txtPrecioP")));
        
        String imagen = request.getParameter("selected");
        
        if(imagen.equals("SelectImagenActual")){
            p.setImagenP(request.getParameter("txtImagen")); 
        }else{
            p.setImagenP(request.getParameter("txtModificarImagen")); 
        }
        
        boolean resp = Pelicula_DB.actualizarPelicula(p);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha modificado la pelicula "+p.getCodigoP()+"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al modificar la pelicula'"); 
        }
    }
    
    private void DarBajaPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pelicula p = new Pelicula();
        p.setCodigoP(request.getParameter("codigoP")); 
        
        boolean resp = Pelicula_DB.eliminarPelicula(p);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha eliminado la pelicula "+p.getCodigoP()+"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al eliminar la pelicula'"); 
        }
    }
    
    private void DarAltaPelicula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pelicula p = new Pelicula();
        p.setCodigoP(request.getParameter("codigoP")); 
        
        boolean resp = Pelicula_DB.recuperarPelicula(p);
        if(resp){
            response.sendRedirect("mensaje.jsp?mens='Se ha recuperado la pelicula "+p.getCodigoP()+"'"); 
        }else{
            response.sendRedirect("mensaje.jsp?mens='Error al recuperar la pelicula'"); 
        }
    }
    
    
    private void AnadirCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DecimalFormat df = new DecimalFormat("0.00");
        DecimalFormatSymbols dfs = df.getDecimalFormatSymbols();
        dfs.setDecimalSeparator('.');
        df.setDecimalFormatSymbols(dfs);
        
        HttpSession session = request.getSession();
        ArrayList<DetalleVenta> carritoCompra;
        
        if(session.getAttribute("carrito") == null){
            carritoCompra = new ArrayList<DetalleVenta>();
        }else{
            carritoCompra = (ArrayList<DetalleVenta>)session.getAttribute("carrito");
        }
        
        Pelicula p = Pelicula_DB.listarPeliculasPorCodigo(request.getParameter("txtCodigo")); 
        
        DetalleVenta dv = new DetalleVenta();
        dv.setCodigoPelicula(request.getParameter("txtCodigo")); 
        dv.setTituloPelicula(request.getParameter("txtTituloP")); 
        dv.setSinopsisPelicula(request.getParameter("txtNombreP")); 
        dv.setPrecio(Double.parseDouble(request.getParameter("txtPrecio")));
        dv.setCantidad(Double.parseDouble(request.getParameter("txtCantidad"))); 
        
        // Realizamos un descuento para el sub total
        double subTotal = p.getPrecioP() * dv.getCantidad();
        if(subTotal > 1000){
          //  dv.setDescuento(subTotal * 0.25);
          dv.setDescuento(0); 
        }
        else if(subTotal > 400){
          //  dv.setDescuento(subTotal * 0.10);
          dv.setDescuento(0); 
        }
        else{
            dv.setDescuento(0); 
        }
        
        dv.setSubTotal(dv.getPrecio() * dv.getCantidad() - dv.getDescuento());
        
        int indice = -1;
        for(int i=0; i<carritoCompra.size(); i++){
            DetalleVenta det = carritoCompra.get(i);
            if(det.getCodigoPelicula().equals(p.getCodigoP())){
                indice = i;
                break;
            }
        }
        
        if(indice == -1){
            dv.setNumero(String.valueOf(carritoCompra.size() + 1)); 
            carritoCompra.add(dv);
        }else{
            dv.setNumero(String.valueOf(indice + 1));
            carritoCompra.set(indice, dv);
        }
        
        session.setAttribute("carrito", carritoCompra); 
        request.getSession().setAttribute("parametroCliente", request.getParameter("txtCliente"));
        response.sendRedirect("RegistrarVenta.jsp");
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
