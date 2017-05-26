$(function(){
  var fechaActiva="";
  var container = $('#contact-panel');
  var email =$('#email');
  var nombre = $('#nombre');
  var psw = $('#psw');
  var verificador = $('#verificador');
  var fecha = $('#fec_nacimiento');

  //calendario fecha nacimiento
  $('#fec_nacimiento').datepicker({ changeYear: true, dateFormat: 'yy-mm-dd' });
  //cancelar accion formulario usuario
  $('#cancelar-btn').on('click',function(){
    nombre.val('');
    psw.val('');
    email.val('');
    verificador.val('');
    fecha.val('');
    container.css('bottom','-500px');
    $('#btn-registrar').show();
  });
  // cerrar formulario usuario
  $(document).mouseup(function (e) {
    if (!container.is(e.target) // si no es igual al contenedor
    && container.has(e.target).length === 0
    && fecha.val()==''
    && nombre.val()==''
    && psw.val()==''
    && verificador.val()==''
    && email.val()==''
    )
      {
        container.css('bottom','-500px');
        $('#btn-registrar').show();
      }else{
        container.css('bottom','0px');
        $('#btn-registrar').hide();
      }
  });

  //envio de formulario de registro
  $('#FrmUsuarioNew').submit(function(event){
    event.preventDefault();
    checkContrasena();
  });

  $('#login-form').submit('click',function(event){
    var username = $('#login-form').find('#user').val();
    var passw = $('#login-form').find('#password').val();
    event.preventDefault();
    $.ajax({
      url: '../server/check_login.php',
      dataType: "json",
      cache: false,
      data: {username: username, passw: passw},
      type: 'POST',
      success: function(php_response){
        if (php_response.conexion=="OK") {

          if (php_response.acceso == 'concedido') {
            window.location.href = 'main.html';
          }else {
            alert(php_response.motivo);
          }
        }else{
          alert(php_response.conexion);
        }
      },
      error: function(xhr, textStatus, error){
        console.log(xhr);
        console.log(textStatus);
        console.log(error);
        alert("error en la comunicación con el servidor");
      }
    });

  });

});


function checkContrasena(){
  var contrasena = $('#psw').val();
  var repContrasena = $('#verificador').val();

  if (contrasena===repContrasena) {
    getDatos();

  }else {
    alert('Las contraseñas no coinciden')
  }
}

function getDatos(){
  var form_data = new FormData();
  form_data.append('nombre', $('#nombre').val());
  form_data.append('fecha_nacimiento', $('#fec_nacimiento').val());
  form_data.append('email', $('#email').val());
  form_data.append('psw', $('#psw').val());
  sendForm(form_data);
}

function sendForm(formData){
  $.ajax({
    url: '../server/create_user.php',
    dataType: "json",
    cache: false,
    processData: false,
    contentType: false,
    data: formData,
    type: 'POST',

    success: function(php_response){
      if (php_response.msg == "exito en la inserción") {
        alert("usuario agregado exitosamente");
        window.location.href = 'index.html';
      }else {
        alert(php_response.msg);
      }
    },
    error: function(xhr, textStatus, error){
      console.log(xhr.statusText);
      console.log(textStatus);
      console.log(error);
      alert("error en la comunicación con el servidor");
    }

  });
}
