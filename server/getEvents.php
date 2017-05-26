<?php
  session_start();
  include('conector.php');

  if (isset($_SESSION['usuario'])) {
   $con = new ConectorBD('localhost', 'enrique', '1234');
    if ($con->initConexion('agenda')=='OK') {
      $resultado = $con->consultar(['evento'],''," WHERE id_usuario=".$_SESSION['usuario']);
      //asignando el resultado a la respuesta
      $i=0;
      while ($fila = $resultado->fetch_assoc()) {
        $response['eventos'][$i]['id_evento']=$fila['id_evento'];
        $response['eventos'][$i]['title']=$fila['titulo'];
        $response['eventos'][$i]['start']=$fila['fecha_inicio']." ".$fila['hora_inicio'];
        $response['eventos'][$i]['end']=$fila['fecha_finalizacion']." ".$fila['hora_finalizacion'];
        $response['eventos'][$i]['allDay']=$fila['todoElDia'];
        $i++;
      }
      $response['msg']= 'OK';
      $response['usuario'] = $_SESSION['usuario'];
    }else {
      $response['msg']= 'No se pudo conectar a la base de datos';
    }

  }else {
    $response['msg']= 'No se ha iniciado una sesión';
  }


  echo json_encode($response);

 ?>
