

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/RegistrarProd.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <title>JSP Page</title>
    </head>

    <%
        String Codigo_P = ObtenerCodigo.CodigoProducto();
    %>

    <body onload="cargar()">
        <form name="frm" action="Servlet_Pelicula" method="post" id="frmRegistrarProd">
            <table id="tablaRegistrarProd">
                <tr>
                    <th colspan="2">
                        <h1> Registrar Pelicula </h1>
                    </th>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Codigo :
                    </td>
                    <td>
                <dd> <input type="text" name="txtCodigo" value="<%=Codigo_P%>" readonly="readonly"> </dd>
                </td>
                </tr>

                <tr>
                    <td class="primeraColumna">
                        Clasificacion  :
                    </td>
                    <td>
                <dd>
                    <select name="txtClase" id="txtClase" class="textBox" style="width: 160px" required>
                        <%
                            ArrayList<ClasificacionP> lista = ClasificacionP_DB.ObtenerCPHabilitados();
                            for (int i = 0; i < lista.size(); i++) {
                                ClasificacionP CP = lista.get(i);


                        %>

                        <option value='<%=CP.getNombreCP()%>'><%=CP.getNombreCP()%></option>

                        <%
                            }
                        %>
                    </select>
                </dd>

                </td>
                </tr>


                <tr>
                    <td class="primeraColumna">
                        Genero :
                    </td>
                    <td>
                <dd>
                    <select name="txtMarca" id="txtMarca" class="textBox" style="width: 160px" required>
                        <%
                            ArrayList<GeneroP> lista2 = GeneroP_DB.obtenerGPHabilitados();
                            for (int i = 0; i < lista2.size(); i++) {
                                GeneroP MP = lista2.get(i);

                        %>

                        <option value='<%=MP.getNombreMP() %>'><%=MP.getNombreMP() %></option>

                        <%
                            }
                        %>
                    </select>
                </dd>

                </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Titulo :
                    </td>
                    <td>
                <dd> <input type="text" name="txtTitulo" id="txtTitulo" class="textBox"> </dd>
                </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Sinopsis :
                    </td>
                    <td>
                <dd> <input type="text" name="txtDescripcion" id="txtDescripcion" class="textBox"> </dd>
                </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Valor :
                    </td>
                    <td>
                <dd> <input type="text" name="txtPrecio" id="txtPrecio" class="textBox"> </dd>
                </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Imagen :
                    </td>
                    <td>
                <dd> <input type="file" name="txtImagen" size="30" id="txtImagen" class="textBox"> </dd>
                </td>
                </tr>
                <tr>
                    <td colspan="2" class="Botones">
                        <br>
                        <input type="button" name="btnCancelar" id="btnCancelar" class="button" value="Cancelar">
                        <input type="button" name="btnRegistrar" id="btnRegistrar" class="button" value="Registrar">
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="accion" value="insertar">
        </form>
    </body>
</html>
