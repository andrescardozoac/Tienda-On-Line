
<%@page import="javax.persistence.Convert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <title>JSP Page</title>
    </head>
    <body>
        
        <form id="frmMostrarCabeceraVenta">
            <table id="tablaMostrarCabeceraVenta">
                <tr>
                    <th>
                        <h1> Meses Menores Ventas </h1>
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
        
        <form id="frmMostrarCuerpoVenta">
            <table id="tablaMostrarCuerpoVenta">
                <tr>
                    <th class="Titulo">
                        FECHA (MES / AÑO)
                    </th>
                   
                    <th class="Titulo">
                        VALOR ($)
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
                    
                    ArrayList<Venta> lista = Venta_DB.ObtenerVentasMesMenor();
                    for(int i=0; i<lista.size(); i++){
                        Venta v = lista.get(i);
                        %>
                        
                <tr>
                    <td>
                        <%=v.getFecha() %>
                    </td>
                    <td>
                   
                        $<%=df.format(v.getTotal())%>
                    </td>
                    
                    <td class="Opcion">
                        <input type="button" name="btnDetalle" id="btnDetalle" class="button" value="Detalles Ventas" onclick="location.href='Servlet_Venta?Fecha=<%=v.getFecha()%>&&accion=MostrarVentasMes'">
                    </td>
                    
                </tr>
                
                <%
                    }
                %>

            </table>
        </form>
        
    </body>
</html>
