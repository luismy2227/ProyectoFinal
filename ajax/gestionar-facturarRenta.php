<?php
  include("../class/class-conexion.php");
  $conexion= new Conexion();
  session_start();
  $query=null;

  if(isset($_POST["cbx_VehiculoEmpresa"])){
    $idVehiculo=$_POST["cbx_VehiculoEmpresa"];
    $idVehiculo=(int)$idVehiculo;
  }

  if(isset($_POST["cbx_Clientes"])){
    $idCliente=$_POST["cbx_Clientes"];
    $idCliente=(int)$idCliente;
  }

  if(isset($_POST["cbx_FormaPago"])){
    $formaPago=$_POST["cbx_FormaPago"];
    $formaPago=(int)$formaPago;
  }

  if(isset($_POST["cbx_Descuento"])){
    $descuento=$_POST["cbx_Descuento"];
    $descuento=(int)$descuento;
  }
  if(isset($_POST["text_FechaEntrega"])){
    $fechaEntrega=$_POST["text_FechaEntrega"];
  }
  if(isset($_POST["text_FechaDevolucion"])){
    $fechaDevolucion=$_POST["text_FechaDevolucion"];
  }

  if(isset($_POST["text_totalHoras"])){
    $totalHoras=$_POST["text_totalHoras"];
    $totalHoras=(int)$totalHoras;
  }
  
  $usuario = $_SESSION['idUsuario'];

  
  $respuesta="";

if($idVehiculo==0){
  $respuesta="Seleccione un vehículo"; 
}
else if($idCliente==0){
  $respuesta="Seleccione un cliente"; 
}
else if($formaPago==0){
  $respuesta="Seleccione una forma de pago"; 
}
else if($descuento==0){
  $respuesta="Seleccione un descuento"; 
}
else if($totalHoras==0){
  $respuesta="Ingrese la cantidad de horas"; 
}
else if($fechaEntrega=='' OR $fechaEntrega==NULL){
  $respuesta="Ingrese la fecha de entrega"; 
}
else if($fechaDevolucion=='' OR $fechaDevolucion==NULL){
  $respuesta="Ingrese la fecha de devolución"; 
}

  else{
    $query="SELECT  * FROM Funcion_Pagar_Renta($idVehiculo, $idCliente, $usuario, $descuento, 
    $formaPago, '$fechaEntrega', '$fechaDevolucion', $totalHoras)";  
    $resultados=$conexion->ejecutarConsulta($query);
    $respuesta=$conexion->obtenerFila($resultados);
    $respuesta=$respuesta[1];
  }
  $conexion->cerrarConexion();
  echo json_encode($respuesta); 

?>