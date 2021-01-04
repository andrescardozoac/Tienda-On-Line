<%@page import="Clase.Usuario_DB"%>
<%@page import="Clase.Usuario"%>
<%@page import="Clase.Pelicula_DB"%>
<%@page import="Clase.Pelicula"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Tienda Online</title>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/Catalogo.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <link type="text/css" rel="stylesheet" href="css/css2.css" />
        
        <script>
            $(document).ready(function () {
                $(".wish-icon i").click(function () {
                    $(this).toggleClass("fa-heart fa-heart-o");
                });
            });
        </script>
    </head>
    <body onload="cargar()">

        <%
            String codigo = (String) session.getAttribute("parametroCodigo");

            Usuario usu = Usuario_DB.listarUsuarioPorCodigo(codigo);
            String cliente = usu.getNombreUsuario() + ", " + usu.getApellidosUsuario();
           
        %>

        <form action="Servlet_Usuario" method="post" id="frmCabecera">
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <!-- Brand -->
                <a class="navbar-brand" href="#">Tienda Online</a>

                <!-- Links -->
                <ul class="navbar-nav">
                   
                    <li class="nav-item">
                        <a href="RegistrarVenta.jsp" class="navbar-brand"  id="lnkCompra">Mi Compra</a>
                    </li>
                      <li class="nav-item">
                         <a href="MiPerfil.jsp?codigoU=<%=usu.getCodigoUsuario()%>" class="navbar-brand" id="lnkPerfil">Mi cuenta</a> 
                    </li>
                    <li class="nav-item">
                       <a href="MostrarPeliculasAlquiladasUsu.jsp?codigoU=<%=usu.getCodigoUsuario()%>" class="navbar-brand" id="lnkReportes">Mis Alquileres</a> 
                    </li>
                    <li class="nav-item">
                         <a href="CuentaAdministrador.jsp" class="navbar-brand" id="lnkAdm">Administrar</a>
                    </li>
                    
                </ul>
                    
                     <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i> ${logueo}</a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a class="dropdown-item" href="#"><img src="Imagen/user.png" alt="60" height="60"/></a>                        
                        <a class="dropdown-item" href="#">${usu.getNombreUsuario()}</a>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">Iniciar Sesion</a>
                       
                        <a class="dropdown-item" href="Servlet_Usuario?accion=logout"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>
                    
            </nav>

            <input type="hidden" value="<%=usu.getTipoUsuario()%>" name="txtTipo" id="txtTipo">
            <input type="hidden" name="accion" value="logout">
        </form>


        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Catalogo <b>Productos</b></h2>
                    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
                        <!-- Carousel indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                        </ol>   
                        <!-- Wrapper for carousel items -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="row">
                                    <%
                                        DecimalFormat df = new DecimalFormat("###,###.##");
                                        DecimalFormatSymbols dfs = df.getDecimalFormatSymbols();
                                        dfs.setDecimalSeparator('.');
                                        df.setDecimalFormatSymbols(dfs);

                                        ArrayList<Pelicula> lista = Pelicula_DB.obtenerPeliculasHabilitadas();
                                        int salto = 0;
                                        for (int i = 0; i < lista.size(); i++) {
                                            Pelicula p = lista.get(i);
                                    %>
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <span class="wish-icon"><i class="fa fa-heart-o"></i></span>
                                            <div class="img-box">
                                                <img src="Imagen/<%=p.getImagenP()%>" class="img-responsive" alt="">									
                                            </div>
                                            <div class="thumb-content">
                                                <h4><%=p.getTitulo()%></h4>									
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                    </ul>
                                                </div>
                                                <p class="item-price"><strike>$80.000</strike> <b>$<%=df.format(p.getPrecioP())%></b></p>

                                                <input type="button" class="BotonModificar" name="btnModificar" value="Modificar" onclick="location.href = 'ModificarPelicula.jsp?codigoP=<%=p.getCodigoP()%>'">
                                                <input type="button" class="BotonADD" name="btnADD" value="Comprar" onclick="location.href = 'AnadirCarrito.jsp?codigoP=<%=p.getCodigoP()%>&&cliente=<%=cliente%>'"><br>
                                            </div>						
                                        </div>
                                    </div>
                                    <%
                                        salto++;
                                        if (salto == 4) {
                                    %>
                                </div>
                            </div>
                            <div class="item">
                                <div class="row">

                                    <%
                                                salto = 0;
                                            }
                                        }
                                    %>

                                </div>
                            </div>


                        </div>
                        <!-- Carousel controls -->
                        <a class="carousel-control left" href="#myCarousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="carousel-control right" href="#myCarousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
                                    
                                     <!-- Modal Iniciar Session o Registrarse -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="container col-lg-9">                   
                    <div class="modal-content">                   
                        <div class="pr-2 pt-1">                         
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                            </button>                    
                        </div>
                        <div class="text-center">                         
                            <img src="Imagen/user.png" width="100" height="100">                         
                        </div>
                        <div class="modal-header text-center">                      
                            <ul class="nav nav-pills">                           
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                                </li>                          
                            </ul>  
                        </div>
                        <div class="modal-body"> 
                            <div class="tab-content" id="pills-tabContent">
                                <!-- Iniciar Session -->
                                <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                    <form method="post" action="Servlet_Usuario" id="frmLogin">
                                        <div class="form-group">
                                            <label>Usuario</label>
                                            <input type="text" name="txtUsuario" class="form-control" placeholder="Usuario" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtClave" class="form-control" placeholder="Password" required>
                                        </div>                                   
                                        <button type="submit" name="btnIngresar" value="Validar" class="btn btn-outline-danger btn-block">Iniciar</button>
                                        <input type="hidden" name="accion" value="login">
                                    </form>
                                </div>
                                <!-- Registrarse -->
                                <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                                    <form name="frm" action="Servlet_Usuario" method="post">                               
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtNombres" id="txtNombre" class="form-control" placeholder="Andres" required>
                                        </div>
                                         <div class="form-group">
                                            <label>Apellidos</label>
                                            <input type="text" name="txtApellidos" id="txtApellido" class="form-control" placeholder="Cardozo" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Identificacion</label>
                                            <input type="text" maxlength="10" name="txtDni" id="txtDni" class="form-control" placeholder="111245678" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Direccion</label>
                                            <input type="text"  name="txtDireccion1" id="txtDireccion1" class="form-control" placeholder="Calle 111 - La Victoria" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Telefono</label>
                                            <input type="text" name="txtTelefono" id="txtTelefono" class="form-control" placeholder="458 58 35" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Correo Electronico</label>
                                            <input type="email" name="txtEmail" id="txtEmail" class="form-control" placeholder="email@example.com" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Usuario</label>
                                            <input type="text" name="txtUsuario" id="txtUsuario" class="form-control" placeholder="andres88" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtClave" id="txtClave" class="form-control" placeholder="Password" required>
                                        </div>      
                                        <button type="submit" name="accion" value="registrar" class="btn btn-outline-danger btn-block">Crear Cuenta</button>
                           
                                    </form>
                                </div>                          
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="container col-lg-9">                   
                    <div class="modal-content">                   
                        <div class="pr-2 pt-1">                         
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                            </button>                    
                        </div>
                        <div class="text-center">                         
                            <img src="img/user.png" width="100" height="100">                         
                        </div>
                        <div class="modal-header text-center">                      
                            <ul class="nav nav-pills">                           
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                                </li>                          
                            </ul>  
                        </div>
                        <div class="modal-body"> 
                            <div class="tab-content" id="pills-tabContent">
                                <!-- Iniciar Session -->
                                <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                    <form action="Controlador">
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                   
                                        <button type="submit" name="accion" value="Validar" class="btn btn-outline-danger btn-block">Iniciar</button>
                                    </form>
                                </div>
                                <!-- Registrarse -->
                                <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                                    <form action="Controlador">                               
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Leo Perez">
                                        </div>
                                        <div class="form-group">
                                            <label>Apellidos</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Leo Perez">
                                        </div>
                                        <div class="form-group">
                                            <label>Identificacion</label>
                                            <input type="text" maxlength="8" name="txtdni" class="form-control" placeholder="01245678">
                                        </div>
                                        <div class="form-group">
                                            <label>Direccion</label>
                                            <input type="text" name="txtdire" class="form-control" placeholder="Chiclayo - La Victoria">
                                        </div>
                                         <div class="form-group">
                                            <label>Telefono</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Leo Perez">
                                        </div>
                                        <div class="form-group">
                                            <label>Correo Electronico</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                         <div class="form-group">
                                            <label>Usuario</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Leo Perez">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                  
                                        <button type="submit" name="accion" value="Registrar" class="btn btn-outline-danger btn-block">Crear Cuenta</button>
                                    </form>
                                </div>                          
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        


        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </body>
</html>                                		