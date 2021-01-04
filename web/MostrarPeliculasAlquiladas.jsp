
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Clase.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <title>VideoTienda</title>
    </head>
    
    <body>
        
        <form id="frmMostrarCabeceraProd">
            <table id="tablaMostrarCabeceraProd">
                <tr>
                    <th>
                        <h1> Peliculas Alquiladas </h1>
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
                        IDENTIFICACION USUARIO
                    </th>
                     <th class="Titulo">
                        USUARIO
                    </th>
                    <th class="Titulo">
                        PELICULA
                    </th>
                    <th class="Titulo">
                        VALOR
                    </th>
                     <th class="Titulo">
                        CANTIDAD
                    </th>
                    
                    <th class="Titulo">
                        ESTADO
                    </th>
                    <th colspan="2" class="Titulo">
                        OPCION
                    </th>
                </tr>
                
                <%
                    DecimalFormat df = new DecimalFormat("###,###.##");
                    DecimalFormatSymbols dfs = df.getDecimalFormatSymbols();
                    dfs.setDecimalSeparator('.');
                    df.setDecimalFormatSymbols(dfs);
                    
                    ArrayList<DetalleVenta> lista = DetalleVenta_DB.obtenerPeliculasAlquiladas();
                    for(int i=0; i<lista.size(); i++){
                        DetalleVenta dv = lista.get(i);
                %>
                    
                <tr>
                    <td>
                         <%=dv.getCodigoUsuario() %>
                       
                    </td>
                    <td>
                        <%=dv.getNombreUsuario() %>
                    </td>
                    <td>
                        <%=dv.getTituloPelicula() %>
                    </td>
                    <td>
                        $<%=df.format(dv.getPrecio()) %>
                    </td>
                      <td>
                        <%=df.format(dv.getCantidad()) %>
                    </td> 
                    <td>
                        <%=dv.getEstado()%>
                    </td>
                    
                    <td class="Opcion">
                          <input type="hidden" id="codigoVenta" name="codigoVenta" value=" <%=dv.getCodigoVenta() %>">
                          <input type="hidden" id="codigoPelicula" name="codigoPelicula" value="<%=dv.getCodigoPelicula() %>">
                        <input type="button" name="btnModificar" id="btnModificar" class="button" value="Entregar" onclick="location.href='Servlet_Venta?codigoV=<%=dv.getCodigoVenta() %>&&codigoP=<%=dv.getCodigoPelicula() %>&&accion=entregar'">
                    </td>
                </tr>
                
                <%
                    }
                %>
    
            </table>
        </form>
    </body>
</html>
