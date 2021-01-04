

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/MiPerfil.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <title>JSP Page</title>
    </head>
    
    <%
        Usuario usu = Usuario_DB.listarUsuarioPorCodigo(request.getParameter("codigoU"));
    %>
    
    <body>
        <form action="Servlet_Usuario" method="post" id="frmModificarUsuario">
            <table id="tablaModificarUsuario">
                <tr>
                    <th colspan="3">
                        <h1>Mi perfil</h1>
                    </th>
                </tr>
                <tr>
                    <td colspan="3">
                        <input type="hidden" name="txtCodigo" value="<%=usu.getCodigoUsuario() %>"> 
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Nombres : 
                    </td>
                    <td>
                        <dd class="soloTexto"> <%=usu.getNombreUsuario() %> </dd>
                        <dd> <input type="text" name="txtNombre" id="txtNombre" class="campoOculto" value="<%=usu.getNombreUsuario() %>" size="30" maxlength="50"> </dd>
                        
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Apellidos : 
                    </td>
                    <td>
                        <dd class="soloTexto"> <%=usu.getApellidosUsuario()%> </dd>
                        <dd> <input type="text" name="txtApellidos" id="txtApellido" class="campoOculto" value="<%=usu.getApellidosUsuario() %>" size="30" maxlength="50"> </dd>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Identificacion :
                    </td>
                    <td>
                        <dd class="soloTexto"> <%=usu.getDniUsuario()%> </dd>
                        <dd> <input type="text" name="txtDni" id="txtDni" class="campoOculto" value="<%=usu.getDniUsuario() %>" size="30" maxlength="8"> </dd>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Correo Electronico :
                    </td>
                    <td>
                        <dd> <%=usu.getEmailUsuario()%> </dd>
                    </td>
                    <td>
                        <dd> <a href="ModificarEmail.jsp?codigoU=<%=usu.getCodigoUsuario() %>" class="Enlace">Cambiar Correo</a> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Contraseña :
                    </td>
                    <td>
                        <dd> ********** </dd>
                    </td>
                    <td>
                        <dd> <a href="ModificarContraseña.jsp?codigoU=<%=usu.getCodigoUsuario() %>" class="Enlace">Cambiar contraseña</a> </dd>
                    </td>
                </tr>
               
                <tr>
                    <td class="primeraColumna">
                        Direccion  :
                    </td>
                    <td>
                        <dd class="soloTexto"> <%=usu.getDireccion1Usuario()%> </dd>
                        <dd> <input type="text" name="txtDireccion1" id="txtDireccion1" class="campoOculto" value="<%=usu.getDireccion1Usuario() %>" size="30" maxlength="50"> </dd>
                    </td>
                    <td></td>
                </tr>
               
                <tr>
                    <td class="primeraColumna">
                        Telefono :
                    </td>
                    <td>
                        <dd class="soloTexto"> <%=usu.getTelefonoUsuario()%> </dd>
                        <dd> <input type="text" name="txtTelefono" id="txtTelefono" class="campoOculto" value="<%=usu.getTelefonoUsuario() %>" size="30" maxlength="9"> </dd>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    
                </tr>
                <tr>
                    <td colspan="3" class="Botones">
                        <br>
                        <input type="button" name="btnCancelar" id="btnCancelar" class="button" value="Cancelar">
                        <input type="button" name="btnModificar" id="btnModificar" class="button" value="Modificar">
                        <input type="button" name="btnGuardar" id="btnGuardar" class="campoOculto" value="Guardar">
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                    </td>
                </tr>
            </table>
                    <input type="hidden" name="accion" value="modificarUsuario">
        </form>
    </body>
</html>
