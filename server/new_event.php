<?php
session_start();
include('conector.php');

if (isset($_SESSION['usuario'])) {
  $data['id_usuario']=$_SESSION['usuario'];
  $data['titulo'] = "'".$_POST['titulo']."'";
  $data['fecha_inicio'] = "'".$_POST['fecha_inicio']."'";
  $data['hora_inicio'] = "'".$_POST['hora_inicio']."'";
  $data['fecha_finalizacion'] = "'".$_POST['fecha_finalizacion']."'";
  $data['hora_finalizacion'] = "'".$_POST['hora_finalizacion']."'";
  $data['todoElDia'] = $_POST['todoElDia'];

  $con = new ConectorBD('localhost', 'enrique', '1234');
   if ($con->initConexion('agenda')=='OK') {
     if($con->insertData('evento', $data)){
       $response['msg'] = "OK";
     }else {
       $response['msg']= "Hubo un error y los datos no han sido cargados";
     }
   }else{
     $response['msg']= 'No se pudo conectar a la base de datos';
   }

}else{
  $response['msg'] = "fail";
}
  echo json_encode($response);
 ?>
