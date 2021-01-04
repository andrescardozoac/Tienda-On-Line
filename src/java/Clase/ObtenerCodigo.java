
package Clase;
import java.sql.*;
import Conexion.Conexion;


public class ObtenerCodigo {
    public static String CodigoProducto(){
        String Codigo = "";
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CODIGO_PELICULA");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Codigo = rs.getString("Codigo_P");
            }
        }catch(Exception e){
           System.out.println(e);
        }
        return Codigo;
    }
    
    public static String CodigoGeneroPelicula(){
        String Codigo = "";
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CODIGO_GENERO_PELICULA");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Codigo = rs.getString("Codigo_MP");
            }
        }catch(Exception e){
           System.out.println(e);
        }
        return Codigo;
    }
    
    public static String CodigoClasificacionPelicula(){
        String Codigo = "";
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CODIGO_CLASIFICACION_PELICULA");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Codigo = rs.getString("Codigo_CP");
            }
        }catch(Exception e){
           System.out.println(e);
        }
        return Codigo;
    }
    
    public static String CodigoVenta(){
        String Codigo = "";
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CODIGO_VENTA");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Codigo = rs.getString("Codigo_V");
            }
        }catch(Exception e){
           System.out.println(e);
        }
        return Codigo;
    }
    
    
      public static Tienda DatosTienda(){
        Tienda tienda = new Tienda();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_DATOS_TIENDA");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                tienda.setCodTienda(rs.getString("CodTienda"));
                tienda.setNombreTienda(rs.getString("nombreTienda"));
                tienda.setDireccionT(rs.getString("direccion"));
                
            }
        }catch(Exception e){
           System.out.println(e);
        }
        return tienda;
    }
}
