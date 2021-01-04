
package Clase;

import java.sql.*;
import java.util.*;
import Conexion.Conexion;

public class ClasificacionP_DB {
    
    public static ArrayList<ClasificacionP> ObtenerCPHabilitados(){
        ArrayList<ClasificacionP> lista = new ArrayList<ClasificacionP>();
        Connection cn;
        Conexion con = new Conexion();
        cn=con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CLASIFICACION_PELICULAS_HABILITADAS");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                ClasificacionP cp = new ClasificacionP(rs.getString("Codigo_CP"), rs.getString("Nombre_CP"), rs.getString("Estado_CP"));
                lista.add(cp);
            }
        }catch(Exception e){ 
            System.out.println(e);
        }
        return lista;
    }
    
    public static ArrayList<ClasificacionP> obtenerCPInhabilitados(){
        ArrayList<ClasificacionP> lista = new ArrayList<ClasificacionP>();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_CLASIFICACION_PELICULAS_INHABILITADAS");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                ClasificacionP CP = new ClasificacionP(rs.getString("Codigo_CP"), rs.getString("Nombre_CP"), rs.getString("Estado_CP"));
                lista.add(CP);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return lista;
    } 
    
    public static boolean insertarClasificacionPelicula(ClasificacionP cp){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL REGISTRAR_CLASIFICACION_PELICULA (?)");
            cs.setString(1, cp.getNombreCP());
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean actualizarClasificacionPelicula(ClasificacionP cp){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MODIFICAR_CLASIFICACION_PELICULA (?,?)");
            cs.setString(1, cp.getCodigoCP());
            cs.setString(2, cp.getNombreCP()); 
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean darBajaClasificacionPelicula(ClasificacionP cp){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL ELIMINAR_CLASIFICACION_PELICULA (?)");
            cs.setString(1, cp.getCodigoCP()); 
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean darAltaClasificacionPelicula (ClasificacionP cp){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL RECUPERAR_CLASIFICACION_PELICULA (?)");
            cs.setString(1, cp.getCodigoCP()); 
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
}
