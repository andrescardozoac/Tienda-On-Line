
package Clase;
import Conexion.Conexion;
import java.sql.*;
import java.util.*;

public class DetalleVenta_DB {
    public static ArrayList<DetalleVenta> obtenerDetalleVenta(String CodigoVenta){
        ArrayList<DetalleVenta> lista = new ArrayList<DetalleVenta>();
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_DETALLE_VENTA_POR_CODIGO (?)");
            cs.setString(1, CodigoVenta);
            ResultSet rs = cs.executeQuery();
            
            while(rs.next()){
                DetalleVenta dv = new DetalleVenta();
                dv.setCodigoVenta(rs.getString("Codigo_V"));
                dv.setTituloPelicula(rs.getString("Pelicula"));
                dv.setPrecio(rs.getDouble("Precio"));
                dv.setCantidad(rs.getDouble("Cantidad"));
                dv.setDescuento(rs.getDouble("Descuento"));
                dv.setSubTotal(rs.getDouble("SubTotal")); 
                lista.add(dv);
            }
        }catch(Exception e){System.out.println(e);}
        return lista;
    }
    
     public static ArrayList<DetalleVenta> obtenerPeliculasAlquiladas() {
        ArrayList<DetalleVenta> lista = new ArrayList<DetalleVenta>();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();

        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            cs = cn.prepareCall("CALL MOSTRAR_PELICULAS_ALQUILADAS");
            rs = cs.executeQuery();
            while (rs.next()) {
                DetalleVenta dv = new DetalleVenta();
                dv.setCodigoVenta(rs.getString("Codigo_V"));
                dv.setCodigoPelicula(rs.getString("Codigo_P"));
                dv.setTituloPelicula(rs.getString("Pelicula"));
                dv.setCodigoUsuario(rs.getString("Codigo_U"));
                dv.setNombreUsuario(rs.getString("Usuario"));
                dv.setPrecio(rs.getDouble("Precio"));
                dv.setCantidad(rs.getDouble("Cantidad"));
                dv.setDescuento(rs.getDouble("Descuento"));
                dv.setSubTotal(rs.getDouble("SubTotal"));
                dv.setEstado(rs.getString("Estado"));
                lista.add(dv);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return lista;
    }
     
     public static ArrayList<DetalleVenta> obtenerPeliculasAlquiladasporUsuario(String CodUsuario) {
        ArrayList<DetalleVenta> lista = new ArrayList<DetalleVenta>();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();

        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            cs = cn.prepareCall("CALL MOSTRAR_PELICULAS_ALQUILADAS_USUARIO (?)");
            cs.setString(1, CodUsuario);
            rs = cs.executeQuery();
            while (rs.next()) {
                DetalleVenta dv = new DetalleVenta();
                dv.setCodigoVenta(rs.getString("Codigo_V"));
                dv.setCodigoPelicula(rs.getString("Codigo_P"));
                dv.setTituloPelicula(rs.getString("Pelicula"));
                dv.setCodigoUsuario(rs.getString("Codigo_U"));
                dv.setNombreUsuario(rs.getString("Usuario"));
                dv.setPrecio(rs.getDouble("Precio"));
                dv.setCantidad(rs.getDouble("Cantidad"));
                dv.setDescuento(rs.getDouble("Descuento"));
                dv.setSubTotal(rs.getDouble("SubTotal"));
                dv.setEstado(rs.getString("Estado"));
                lista.add(dv);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return lista;
    }
     
     public static boolean entregarPelicula(DetalleVenta dv ){
         
        boolean resp = false;
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL ENTREGAR_PELICULA (?,?)");
            cs.setString(1, dv.getCodigoPelicula());
            cs.setString(2, dv.getCodigoVenta());
           
            int i = cs.executeUpdate();
            
            if(i == 1){
                resp = true;
            }else{
                resp = false;
            }
            
        }catch(Exception e){System.out.println(e);}
        return resp;
     }
       
}
