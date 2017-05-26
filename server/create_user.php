<?php
  include('conector.php');
  $data['nombre'] = "'".$_POST['nombre']."'";
  $data['fecha_nacimiento'] = "'".$_POST['fecha_nacimiento']."'";
  $data['email'] = "'".$_POST['email']."'";
  $data['psw'] = "'".password_hash($_POST['psw'], PASSWORD_DEFAULT)."'";

  $con = new ConectorBD('localhost','enrique','1234');
  $response['conexion'] = $con->initConexion('agenda');

  if ($response['conexion']=='OK') {
    if($con->insertData('usuarios', $data)){
      $response['msg']="exito en la inserción";
    }else {
      $response['msg']= "Hubo un error y los datos no han sido cargados";
    }
  }else {
    $response['msg']= "No se pudo conectar a la base de datos";
  }

  echo json_encode($response);
  $con->cerrarConexion();

 ?>
