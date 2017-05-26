<?php
  include('conector.php');
  $idEvento=$_POST['id_evento'];

  $con = new ConectorBD('localhost', 'enrique', '1234');
   if ($con->initConexion('agenda')=='OK') {
     if($resultado = $con->eliminarRegistro('evento',"id_evento=".$idEvento)){
       $response['msg'] = 'OK';
     }else{
       $response['msg'] = 'Ocurrio un problema y no es posible eliminar el registro';
     }
   }else{
     $response['msg']= 'No se pudo conectar a la base de datos';
   }
   echo json_encode($response);
 ?>
