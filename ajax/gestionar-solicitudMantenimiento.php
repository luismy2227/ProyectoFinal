<?php
session_start();
  include("../class/class-conexion.php");
  $conexion= new Conexion();
  $idEmpleado=$_SESSION['idUsuario'];

  if(isset($_POST["cbx_VehiculoCliente"])){
    $vehiculoCliente=$_POST["cbx_VehiculoCliente"];
    $vehiculoCliente=(int)$vehiculoCliente;
  }
  if(isset($_POST["cbx_TipoMantenimiento"])){
    $tipoMantenimiento=$_POST["cbx_TipoMantenimiento"];
    $tipoMantenimiento=(int)$tipoMantenimiento;
  }

  if(isset($_POST["cbx_Repuesto"])){
    $repuesto=$_POST["cbx_Repuesto"];
    $repuesto=(int)$repuesto;
  }

 

  if(isset($_POST["cbx_Taller"])){
    $taller=$_POST["cbx_Taller"];
    $taller=(int)$taller;
  }


  if(isset($_POST["text_FechaEntrada"])){
    $fechaEntrada=$_POST["text_FechaEntrada"];
  }

  if(isset($_POST["text_FechaSalida"])){
    $fechaSalida=$_POST["text_FechaSalida"];
  }

  

  $respuesta="";

  if($vehiculoCliente==0){
    $respuesta="Seleccione un Vehiculo"; 
  }

  else if($tipoMantenimiento==0){
    $respuesta="Seleccione un Mantenimiento";
  }

  else if($repuesto==0){
    $respuesta="Seleccione un Repuesto";
  }

 

  else if($taller==0){
    $respuesta="Seleccione un Taller";
  }
else if ($fechaEntrada==null or $fechaEntrada==""){
  $respuesta="Ingrese la Fecha de Entrada";

}
else if ($fechaSalida==null or $fechaSalida==""){
  $respuesta="Ingrese la Fecha de Salida";

}
  
  else{
    $query="SELECT  * FROM funcion_mantenimiento('$fechaSalida', 
    '$fechaEntrada','$tipoMantenimiento','$vehiculoCliente','$idEmpleado',$taller,$repuesto);";  
    $resultados=$conexion->ejecutarConsulta($query);
    $respuesta=$conexion->obtenerFila($resultados);
    $respuesta=$respuesta[1];
  }
  $conexion->cerrarConexion();
  echo json_encode($respuesta); 
?>

