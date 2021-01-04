
package Clase;
import java.sql.*;
import java.util.*;
import Conexion.Conexion;


public class Venta_DB {
    public static boolean insertarVenta(Venta v){
        boolean resp = false;
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL REGISTRAR_VENTA (?,?,?)");
            cs.setString(1, v.getCliente());
            cs.setDouble(2, v.getTotal());
            cs.setString(3, v.getModoPago());
            int i = cs.executeUpdate();
            
            if(i == 1){
                resp = true;
            }else{
                resp = false;
            }
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    
    public static ArrayList<Venta> ObtenerVentas(){
        ArrayList<Venta> lista = new ArrayList<Venta>();
        Connection cn;
        Conexion con = new Conexion();
        cn=con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_VENTA");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Venta v = new Venta();
                v.setCodigoVenta(rs.getString("Codigo_V"));
                v.setCodigoCliente(rs.getString("Codigo_U")); 
                v.setCliente(rs.getString("CLIENTE"));
                v.setTotal(rs.getDouble("Total")); 
                v.setFecha(rs.getString("Fecha"));
                v.setModoPago(rs.getString("Modo_Pago"));
                lista.add(v);
            } 
        }catch(Exception e){
            System.out.println(e);
        }
        return lista;
    }
    
       public static ArrayList<Venta> ObtenerVentasMes(String mes){
        ArrayList<Venta> lista = new ArrayList<Venta>();
        Connection cn;
        Conexion con = new Conexion();
        cn=con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_VENTAS_MES (?)");
            cs.setString(1, mes);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Venta v = new Venta();
                v.setCodigoVenta(rs.getString("Codigo_V"));
                v.setCodigoCliente(rs.getString("Codigo_U")); 
                v.setCliente(rs.getString("CLIENTE"));
                v.setTotal(rs.getDouble("Total")); 
                v.setFecha(rs.getString("Fecha"));
                v.setModoPago(rs.getString("Modo_Pago"));
                lista.add(v);
            } 
        }catch(Exception e){
            System.out.println(e);
        }
        return lista;
    }
    
    public static ArrayList<Venta> ObtenerVentasMesMayor(){
        ArrayList<Venta> lista = new ArrayList<Venta>();
        Connection cn;
        Conexion con = new Conexion();
        cn=con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_VENTA_MES_MAYOR");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Venta v = new Venta();
                 v.setFecha(rs.getString("Fecha"));
                 v.setTotal(rs.getDouble("Total")); 
                lista.add(v);
            } 
        }catch(Exception e){
            System.out.println(e);
        }
        return lista;
    }
    
        public static ArrayList<Venta> ObtenerVentasMesMenor(){
        ArrayList<Venta> lista = new ArrayList<Venta>();
        Connection cn;
        Conexion con = new Conexion();
        cn=con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_VENTA_MES_MENOR");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Venta v = new Venta();
                v.setFecha(rs.getString("Fecha"));
                 v.setTotal(rs.getDouble("Total")); 
                lista.add(v);
            } 
        }catch(Exception e){
            System.out.println(e);
        }
        return lista;
    }
    
    public static boolean eliminarVenta(Venta v){
        boolean resp = false;
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL ELIMINAR_VENTA (?)");
            cs.setString(1, v.getCodigoVenta());
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
