
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/RegistrarTienda.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <title>VideoTienda</title>
    </head>
    
    <%
        
        Tienda tienda = ObtenerCodigo.DatosTienda();
    %>
    
    <body onload="cargar()">
        <form name="frm" action="Servlet_Tienda" method="post" id="frmRegistrarTienda">
            <table id="tablaRegistrarTienda">
                <tr>
                    <th colspan="2">
                        <h1>Registrar o Actualizar Tienda</h1>
                    </th>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Codigo :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtCodigo" id="txtCodigo"  value="<%=tienda.getCodTienda()%>">  </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Nombre :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtNombre" id="txtNombre" value="<%=tienda.getNombreTienda() %>"> </dd>
                    </td>
                </tr>
                 <tr>
                    <td class="primeraColumna">
                        Direccion :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtDireccion" id="txtDireccion" value="<%=tienda.getDireccionT() %>"> </dd>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="Botones">
                        <br>
                        <input type="button" name="btnCancelar" id="btnCancelar" class="button" value="Cancelar"> 
                        <input type="button" name="btnRegistrar" id="btnRegistrar" class="button" value="Actualizar"> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                    </td>
                </tr>
            </table>  
                    <input type="hidden" id="codigoTienda" name="codigoTienda" value="<%=tienda.getCodTienda()%>">
                    <input type="hidden" name="accion" value="registrar">
        </form>
    </body>
</html>
