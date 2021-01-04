$(document).ready(function (){
    limpiarCampos();
    
    $('#btnRegistrar').click(function (){
        validarDatos();
    });
    
    $('#btnCancelar').click(function (){
        history.back();
    });
    
    $('#SelectDepartamento').change(function (){
        $('#text_depart').val("1");
        $.pos
        $.post("cbProvincia.jsp","#frmDepartamento".serialize(),function(data){
            $('#SelectProvincia').html(data);
        });
    });
});

function limpiarCampos(){
    $('.textBox').val("");
}

function validarDatos(){
    var nombre = $('#txtNombre').val();
    var apellido = $('#txtApellido').val();
    var dni = $('#txtDni').val();
    var email = $('#txtEmail').val();
    var direccion1 = $('#txtDireccion1').val();
    var telefono = $('#txtTelefono').val();
    var usuario = $('#txtUsuario').val();
    var pass1 = $('#txtClave').val();
    var pass2 = $('#txtConfirClave').val();
    
    if(nombre == ""){
        alert("El campo Nombres no puede estar vacio");
        $('#txtNombre').focus();
    }
    else if(apellido == ""){
        alert("El campo Apellidos no puede estar vacio");
        $('#txtApellido').focus();
    }
    else if(dni == ""){
        alert("El campo Identificacion no puede estar vacio");
        $('#txtDni').focus();
    }
    else if(email == ""){
        alert("El campo Correo Electronico no puede estar vacio");
        $('#txtEmail').focus();
    }
    
    else if(direccion1 == ""){
        alert("El campo Direccion no puede estar vacio");
        $('#txtDireccion1').focus();
    }
    else if(telefono == ""){
        alert("El campo Telefono no puede estar vacio");
        $('#txtTelefono').focus();
    }
    else if(usuario == ""){
        alert("El campo Usuario no puede estar vacio");
        $('#txtUsuario').focus();
    }
    else if(pass1 == ""){
        alert("El campo clave no puede estar vacio");
        $('#txtClave').focus();
    }
    else if(pass2 == ""){
        alert("El campo confirmar clave no puede estar vacio");
        $('#txtConfirClave').focus();
    }
    else{
        
        if(pass1 != pass2){
            alert("Las contraseñas no son iguales");
        }
        else{
            $('#frmRegistrarUsuario').submit();
        }
        
    }
}