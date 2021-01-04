$(document).ready(function(){
    $('.textBox').val("");
    
    $('#btnCancelar').click(function(){
        history.back();
    });
    
    $('#btnGuardar').click(function(){
        validarDatos();
    });
});

function validarDatos(){
    var email1 = $('#txtEmail').val();
    var pass = $('#txtPass').val();
    
    if(email1 == ""){
        alert("El campo email no puede estar vacio");
        $('#txtEmail').focus();
    }
   
    else if(pass == ""){
        alert("El campo contraseña no puede estar vacio");
        $('#txtPass').focus();
    }
    else{
 
            $('#frmModificarEmail').submit();
        
        
    }
}