package Clase;

import java.sql.*;
import java.util.*;
import Conexion.Conexion;

public class Pelicula_DB {

    // Traer todo las peliculas
    public static ArrayList<Pelicula> obtenerPeliculasHabilitadas() {
        ArrayList<Pelicula> lista = new ArrayList<Pelicula>();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();

        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            cs = cn.prepareCall("CALL MOSTRAR_PELICULAS_HABILITADAS");
            rs = cs.executeQuery();
            while (rs.next()) {
                Pelicula p = new Pelicula(rs.getString("Codigo_P"), rs.getString("Clase_P"), rs.getString("Marca_P"), rs.getString("Titulo_P"), rs.getString("Descripcion_P"), rs.getDouble("Precio_P"), rs.getString("Imagen_P"), rs.getString("Estado_P"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return lista;
    }

    public static ArrayList<Pelicula> obtenerPeliculasInhabilitadas() {
        ArrayList<Pelicula> lista = new ArrayList<Pelicula>();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();

        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            cs = cn.prepareCall("CALL MOSTRAR_PELICULAS_ELIMINADAS");
            rs = cs.executeQuery();
            while (rs.next()) {
                Pelicula p = new Pelicula(rs.getString("Codigo_P"), rs.getString("Clase_P"), rs.getString("Marca_P"), rs.getString("Titulo_P"), rs.getString("Descripcion_P"), rs.getDouble("Precio_P"), rs.getString("Imagen_P"), rs.getString("Estado_P"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return lista;
    }

    public static ArrayList<Pelicula> obtenerPeliculasMasPedidas() {
        ArrayList<Pelicula> lista = new ArrayList<Pelicula>();
        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();

        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            cs = cn.prepareCall("CALL MOSTRAR_PELICULAS_MAS_PEDIDAS");
            rs = cs.executeQuery();
            while (rs.next()) {
               
                Pelicula p = new Pelicula();
                p.setCodigoP(rs.getString("Codigo"));
                p.setClasificacionPelicula(rs.getString("Clasificacion"));
                p.setGeneroPelicula(rs.getString("Genero"));
                p.setTitulo(rs.getString("Titulo"));
                p.setDescripcion(rs.getString("Sinopsis"));
                p.setEstadoP(rs.getString("Estado"));
                p.setCantidad(rs.getInt("Cantidad"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return lista;
    }
    
    public static boolean insertarPelicula(Pelicula p) {
        boolean resp = false;

        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();

        try {
            CallableStatement cs = cn.prepareCall("CALL REGISTRAR_PELICULA (?,?,?,?,?,?)");
            cs.setString(1, p.getClasificacionPelicula());
            cs.setString(2, p.getGeneroPelicula());
            cs.setString(3, p.getTitulo());
            cs.setString(4, p.getDescripcion());
            cs.setDouble(5, p.getPrecioP());
            cs.setString(6, p.getImagenP());
            int i = cs.executeUpdate();

            if (i == 1) {
                resp = true;
            } else {
                resp = false;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return resp;
    }

    public static boolean actualizarPelicula(Pelicula p) {
        boolean resp = false;

        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();

        try {
            CallableStatement cs = cn.prepareCall("CALL MODIFICAR_PELICULA (?,?,?,?,?,?,?)");
            cs.setString(1, p.getCodigoP());
            cs.setString(2, p.getClasificacionPelicula());
            cs.setString(3, p.getGeneroPelicula());
            cs.setString(4, p.getTitulo());
            cs.setString(5, p.getDescripcion());
            cs.setDouble(6, p.getPrecioP());
            cs.setString(7, p.getImagenP());
            cs.executeUpdate();

            int i = cs.executeUpdate();

            if (i == 1) {
                resp = true;
            } else {
                resp = false;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return resp;
    }

    public static boolean eliminarPelicula(Pelicula p) {
        boolean resp = false;

        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();

        try {
            CallableStatement cs = cn.prepareCall("CALL ELIMINAR_PELICULA (?)");
            cs.setString(1, p.getCodigoP());

            int i = cs.executeUpdate();

            if (i == 1) {
                resp = true;
            } else {
                resp = false;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return resp;
    }

    public static boolean recuperarPelicula(Pelicula p) {
        boolean resp = false;

        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();

        try {
            CallableStatement cs = cn.prepareCall("CALL RECUPERAR_PELICULA (?)");
            cs.setString(1, p.getCodigoP());

            int i = cs.executeUpdate();

            if (i == 1) {
                resp = true;
            } else {
                resp = false;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return resp;
    }

    public static Pelicula listarPeliculasPorCodigo(String Codigo) {
        Pelicula p = new Pelicula();

        Connection cn;
        Conexion con = new Conexion();
        cn = con.conectar();

        try {
            CallableStatement cs = cn.prepareCall("CALL BUSCAR_PELICULA_CODIGO (?)");
            cs.setString(1, Codigo);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                p.setCodigoP(rs.getString("Codigo_P"));
                p.setClasificacionPelicula(rs.getString("Nombre_CP"));
                p.setGeneroPelicula(rs.getString("Nombre_MP"));
                p.setTitulo(rs.getString("Titulo_P"));
                p.setDescripcion(rs.getString("Descripcion_P"));
                p.setPrecioP(rs.getDouble("Precio_P"));
                p.setImagenP(rs.getString("Imagen_P"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return p;
    }

}
