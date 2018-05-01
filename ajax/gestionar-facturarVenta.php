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

  if(isset($_POST["cbx_SeleccioneGenero"])){
    $genero=$_POST["cbx_SeleccioneGenero"];
    $genero=(int)$genero;
  }

  if(isset($_POST["cbx_FormaPago"])){
    $formaPago=$_POST["cbx_FormaPago"];
    $formaPago=(int)$formaPago;
  }

  if(isset($_POST["cbx_Descuento"])){
    $descuento=$_POST["cbx_Descuento"];
    $descuento=(int)$descuento;
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

  else{
    $query="SELECT  * FROM Funcion_Pagar_Venta($idVehiculo, $idCliente, $usuario, $descuento, $formaPago)";  
    $resultados=$conexion->ejecutarConsulta($query);
    $respuesta=$conexion->obtenerFila($resultados);
    $respuesta=$respuesta[1];
  }
  $conexion->cerrarConexion();
  echo json_encode($respuesta); 

?>