<?php
include('conector.php');

  $idEvento = $_POST['id_evento'];
  $data['titulo'] = "'".$_POST['title']."'";
  $data['fecha_inicio'] = "'".$_POST['start_date']."'";
  $data['hora_inicio'] = "'".$_POST['start_hour']."'";
  $data['fecha_finalizacion'] = "'".$_POST['end_date']."'";
  $data['hora_finalizacion'] = "'".$_POST['end_hour']."'";  

  $con = new ConectorBD('localhost', 'enrique', '1234');
   if ($con->initConexion('agenda')=='OK') {
     if($con->actualizarRegistro('evento', $data, "id_evento=".$idEvento)){
       $response['msg'] = "OK";
     }else {
       $response['msg']= "Hubo un error y los datos no han sido cargados";
     }
   }else{
     $response['msg']= 'No se pudo conectar a la base de datos';
   }

  echo json_encode($response);



 ?>
