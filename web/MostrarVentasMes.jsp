
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
        <%
            String fecha = (String) session.getAttribute("Fecha");
        %>

        <form id="frmMostrarCabeceraVenta">
            <table id="tablaMostrarCabeceraVenta">
                <tr>
                    <th>
                        <h1> Resumen de Ventas Mes: 
                                <%=fecha %>
                        </h1>
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
                        CODIGO
                    </th>
                    <th class="Titulo">
                        CLIENTE
                    </th>
                    <th class="Titulo">
                        VALOR ($)
                    </th>
                    <th class="Titulo">
                        OPCION DE PAGO
                    </th>
                    <th class="Titulo">
                        FECHA Y HORA
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

                    ArrayList<Venta> lista = Venta_DB.ObtenerVentasMes(fecha);
                    for (int i = 0; i < lista.size(); i++) {
                        Venta v = lista.get(i);
                %>

                <tr>
                    <td>
                        <%=v.getCodigoVenta()%>
                    </td>
                    <td>
                        <%=v.getCliente()%>
                    </td>
                    <td>
                        $<%=df.format(v.getTotal())%>
                    </td>
                    <td>
                        <%=v.getModoPago()%>
                    </td>
                    <td>
                        <%=v.getFecha()%>
                    </td>
                    <td class="Opcion">
                        <input type="button" name="btnDetalle" id="btnDetalle" class="button" value="Detalle venta" onclick="location.href = 'Servlet_Venta?codigoV=<%=v.getCodigoVenta()%>&&cliente=<%=v.getCliente()%>&&importe=<%=v.getTotal()%>&&FechaV=<%=v.getFecha()%>&&codigoCli=<%=v.getCodigoCliente()%>&&accion=MostrarDetalle2'">
                    </td>

                </tr>

                <%
                    }
                %>

            </table>
        </form>

    </body>
</html>
