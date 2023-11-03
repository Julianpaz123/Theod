<?php

include('../../config/conect.php');

$routeResult= "Location: ../../view/login/citas.php";

if ($_SERVER['REQUEST_METHOD']== "POST") {

    $idcita =$_REQUEST['idcita'];
    $fechaCita=$_REQUEST['fechaCita'];
    $horaCita=$_REQUEST['horaCita'];
    $tipoCita=$_REQUEST['tipoCita'];


   

    $stmt = $connect->prepare("INSERT INTO cita (fecha_Cita,hora_Cita,tipo_Cita) VALUES (?,?,?)");
  $stmt->bind_param("sss",$fechaCita,$horaCita,$tipoCita);
  $stmt->execute();

  echo ("New records created successfully");
  $stmt->close();
  $connect->close();

  header($routeResult);
  exit;

}
    


?>