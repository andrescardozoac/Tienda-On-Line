
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Clase.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <title>JSP Page</title>
    </head>
    
    <body>
        
        <form id="frmMostrarCabeceraProd">
            <table id="tablaMostrarCabeceraProd">
                <tr>
                    <th>
                        <h1> Peliculas Habilitadas </h1>
                    </th>
                </tr>
                <tr>
                    <td>
                        <a href="CuentaAdministrador.jsp" class="link"><h4> Pagina principal </h4></a>
                    </td>
                </tr>
            </table>
        </form>
        
        <hr>
        
        <form id="frmMostrarCuerpoProd">
            <table id="tablaMostrarCuerpoProd">
                <tr>
                    <th class="Titulo">
                        CODIGO
                    </th>
                    <th class="Titulo">
                        CLASIFICACION
                    </th>
                    <th class="Titulo">
                        GENERO
                    </th>
                     <th class="Titulo">
                        TITULO
                    </th>

                    <th class="Titulo">
                        SINOPSIS
                    </th>
                    <th class="Titulo">
                        VALOR
                    </th>
                    <th class="Titulo">
                        IMAGEN
                    </th>
                    <th class="Titulo">
                        ESTADO
                    </th>
                    <th colspan="2" class="Titulo">
                        OPCION
                    </th>
                </tr>
                
                <%
                    ArrayList<Pelicula> lista = Pelicula_DB.obtenerPeliculasHabilitadas();
                    for(int i=0; i<lista.size(); i++){
                        Pelicula P = lista.get(i);
                %>
                    
                <tr>
                    <td>
                        <%=P.getCodigoP() %>
                    </td>
                    <td>
                        <%=P.getClasificacionPelicula() %>
                    </td>
                    <td>
                        <%=P.getGeneroPelicula() %>
                    </td>
                      <td>
                        <%=P.getTitulo() %>
                    </td>
                    <td>
                        <%=P.getDescripcion() %>
                    </td>
                    <td>
                        <%=P.getPrecioP() %>
                    </td>
                    <td>
                        <%=P.getImagenP() %>
                    </td>
                    <td>
                        <%=P.getEstadoP() %>
                    </td>
                    <td class="Opcion">
                        <input type="button" name="btnModificar" id="btnModificar" class="button" value="Modificar" onclick="location.href='ModificarPelicula.jsp?codigoP=<%=P.getCodigoP() %>'"> 
                    </td>
                    <td class="Opcion">
                        <input type="button" name="btnEliminar" id="btnEliminar" class="button" value="Inhabilitar" onclick="location.href='Servlet_Pelicula?codigoP=<%=P.getCodigoP() %>&&accion=eliminar'">
                    </td>
                </tr>
                
                <%
                    }
                %>
    
            </table>
        </form>
    </body>
</html>
