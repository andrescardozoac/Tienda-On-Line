$(document).ready(function (){
    var tipo = $('#txtTipo').val();
    
    if(tipo == "ADMINISTRADOR"){
        cuentaAdministrador()
    }
    else if(tipo == "CLIENTE"){
        cuentaUsuario();
    }
    else{
        cuentaNegada();
        $('.BotonADD').click(function (){
             alert("Para Comprar Producto - Debe Iniciar Sesion");
            $(location).attr('href',"Catalogo.jsp");
        });
    }
});

function cuentaAdministrador(){
    $('#lnkAdm').show();
    $('#lnkLogout').show();
    $('#lnkLogin').hide();
    $('.BotonModificar').show();
    $('#lnkReportes').hide();
    $('#lnkCompra').show();
}
function cuentaUsuario(){
    $('#lnkLogout').show();
    $('#lnkLogin').hide();
    $('#lnkAdm').hide();
    $('.BotonModificar').hide();
    $('#lnkReportes').show();
    $('#lnkCompra').show();
}
function cuentaNegada(){
    $('#lnkLogin').show();
    $('#lnkLogout').hide();
    $('#lnkAdm').hide();
    $('#lnkPerfil').hide();
    $('.BotonModificar').hide();
    $('#lnkReportes').hide();
    $('#lnkCompra').hide();
}

