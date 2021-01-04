
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <form id="frmAdministrador">
            <table id="tablaAdministrador">
                <tr>
                    <th colspan="5">
                        <h2> Menu Administrador </h2>
                    </th>
                </tr>
                <tr>
                    <th>
                        Registrar Nuevo
                    </th>
                    <th>
                        Registros Habilitados
                    </th>
                    <th>
                        Registros Inhabilitados
                    </th>
                    <th>
                        Reportes Administrador
                    </th>
                    <th>
                        Mis Opciones
                    </th>
                </tr>
                <tr>
                    <td>
                        <a href="RegistrarClasificacionPelicula.jsp" class="link">Clasificacion Productos</a>
                    </td>
                    <td>
                        <a href="MostrarCP.jsp" class="link">Clasificacion Productos</a>
                    </td>
                    <td>
                        <a href="MostrarCPEliminados.jsp" class="link">Clasificacion Productos</a>
                    </td>
                    <td>
                        <a href="MostrarVenta.jsp" class="link">Mejores Clientes</a>
                    </td>
                    <td>
                          <a href="MostrarPeliculasAlquiladas.jsp" class="link">Productos Comprados</a>
                       
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="RegistrarGeneroPelicula.jsp" class="link">Generos Productos</a>
                    </td>
                    <td>
                        <a href="MostrarGP.jsp" class="link">Generos Productos</a>
                    </td>
                    <td>
                        <a href="MostrarGPEliminados.jsp" class="link">Generos Productos</a>
                    </td>
                    <td>
                        <a href="MostrarPeliculasMas.jsp" class="link">Productos Mas Pedidos</a>
                    </td>
                    <td>
                          <a href="Catalogo.jsp" class="link">Ir a catalogo</a> 
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="RegistrarPelicula.jsp" class="link">Productos</a>
                    </td>
                    <td>
                        <a href="MostrarPeliculas.jsp" class="link">Productos</a>
                    </td>
                    <td>
                        <a href="MostrarPeliculasEliminadas.jsp" class="link">Productos</a>
                    </td>
                    <td>
                         <a href="MostrarVentaMesMayor.jsp" class="link">Meses Mayores Ventas</a>
                    </td>
                    <td>
                        <a href="RegistrarTienda.jsp" class="link">Tienda</a>
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>
                        <a href="MostrarUsuario.jsp" class="link">Usuario</a>
                    </td>
                    <td>
                        <a href="MostrarUsuarioEliminado.jsp" class="link">Usuario</a>
                    </td>
                    <td>
                       <a href="MostrarVentaMesMenor.jsp" class="link">Meses Menores Ventas</a>
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>
        </form>
        
    </body>
</html>
