
package Clase;

import java.sql.*;
import Conexion.Conexion;


public class Tienda_DB {
    // Traer todo las peliculas
    
    public static boolean RegistrarTienda (Tienda t, String codigo){
        boolean resp = false;
        
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();
        
        try{
            CallableStatement cs = cn.prepareCall("CALL REGISTRAR_TIENDA (?,?,?,?)");
            cs.setString(1, codigo);
            cs.setString(2, t.getCodTienda());
            cs.setString(3, t.getNombreTienda());
            cs.setString(4, t.getDireccionT());
            
            cs.executeUpdate();
            
            int i = cs.executeUpdate();
            
            if(i==1)
                resp = true;
            else
                resp = false;
            
        }catch(Exception e){System.out.println(e);}
        return resp;
    }
    

}
