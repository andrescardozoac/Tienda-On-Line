
package Clase;

import java.sql.*;
import java.util.*;
import Conexion.Conexion;


public class GeneroP_DB {
    
    public static ArrayList<GeneroP> obtenerGPHabilitados(){
        ArrayList<GeneroP> lista = new ArrayList<GeneroP>();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_GENERO_PELICULAS_HABILITADAS");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                GeneroP MP = new GeneroP(rs.getString("Codigo_MP"), rs.getString("Nombre_MP"), rs.getString("Estado_MP"));
                lista.add(MP);
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        return lista;
    }
    
    public static ArrayList<GeneroP> obtenerGPInhabilitados(){
        ArrayList<GeneroP> lista = new ArrayList<GeneroP>();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_GENERO_PELICULAS_INHABILITADAS");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                GeneroP MP = new GeneroP(rs.getString("Codigo_MP"), rs.getString("Nombre_MP"), rs.getString("Estado_MP"));
                lista.add(MP);
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        return lista;
    }
    
    public static boolean insertarGeneroPelicula (GeneroP mp){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL REGISTRAR_GENERO_PELICULA (?)");
            cs.setString(1, mp.getNombreMP());
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean actualizarGeneroPelicula(GeneroP mp){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MODIFICAR_GENERO_PELICULA (?,?)");
            cs.setString(1, mp.getCodigoMP());
            cs.setString(2, mp.getNombreMP()); 
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean eliminarGeneroPelicula(GeneroP mp){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL ELIMINAR_GENERO_PELICULA (?)");
            cs.setString(1, mp.getCodigoMP());
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static boolean recuperarGeneroPelicula(GeneroP mp){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL RECUPERAR_GENERO_PELICULA (?)");
            cs.setString(1, mp.getCodigoMP());
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }

}
