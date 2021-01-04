$(document).ready(function(){
    $('.textBox').val("");
    
    $('#btnCancelar').click(function(){
        history.back();
    });
    
    $('#btnRegistrar').click(function(){
        validarDatos();
    });
});

function validarDatos(){
    var codigo = $('#txtCodigo').val();
    var nombre = $('#txtNombre').val();
    var direccion = $('#txtDireccion').val();
    
    
    if(codigo == ""){
        alert("El campo Codigo Tienda no puede estar vacio");
        $('#txtCodigo').focus();
    }
    else if(nombre == ""){
        alert("El campo Nombre Tienda no puede estar vacio");
        $('#txtNombre').focus();
    }
    else if(direccion == ""){
        alert("El campo Direccion Tienda no puede estar vacio");
        $('#txtDireccion').focus();
    }
    else{
        $('#frmRegistrarTienda').submit();
    }
}