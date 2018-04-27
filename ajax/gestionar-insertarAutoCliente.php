<?php
  include("../class/class-conexion.php");
  $conexion= new Conexion();
  $query=null;

  if(isset($_POST["cbx_Marca"])){
    $marca=$_POST["cbx_Marca"];
    $marca=(int)$marca;
  }
  if(isset($_POST["cbx_Modelo"])){
    $modelo=$_POST["cbx_Modelo"];
    $modelo=(int)$modelo;
  }

  if(isset($_POST["cbx_Version"])){
    $version=$_POST["cbx_Version"];
    $version=(int)$version;
  }

  if(isset($_POST["cbx_Transmisiones"])){
    $transmision=$_POST["cbx_Transmisiones"];
    $transmision=(int)$transmision;
  }

  if(isset($_POST["cbx_Gasolinas"])){
    $gasolina=$_POST["cbx_Gasolinas"];
    $gasolina=(int)$gasolina;
  }

  if(isset($_POST["cbx_Cilindraje"])){
    $cilindraje=$_POST["cbx_Cilindraje"];
    $cilindraje=(int)$cilindraje;
  }

  if(isset($_POST["text_Color"])){
    $color=$_POST["text_Color"];
  }

  if(isset($_POST["text_Placa"])){
    $placa=$_POST["text_Placa"];
  }

  if(isset($_POST["text_Anio"])){
    $anio=$_POST["text_Anio"];
  }

  if(isset($_POST["text_Generacion"])){
    $generacion=$_POST["text_Generacion"];
  }

  if(isset($_POST["text_Serie"])){
    $serie=$_POST["text_Serie"];
  }

  if(isset($_POST["text_TipoMotor"])){
    $tipoMotor=$_POST["text_TipoMotor"];
    $tipoMotor=(float)$tipoMotor;
  }

  if(isset($_POST["cbx_Sucursal"])){
    $sucursal=$_POST["cbx_Sucursal"];
    $sucursal=(int)$sucursal;
  }

  if(isset($_POST["cbx_Garage"])){
    $garage=$_POST["cbx_Garage"];
    $garage=(int)$garage;
  }

  if(isset($_POST["cbx_ClientePertenece"])){
    $clientePertenece=$_POST["cbx_ClientePertenece"];
    $clientePertenece=(int)$clientePertenece;
  }

  $respuesta="";

  if($marca==0){
    $respuesta="Seleccione una marca"; 
  }

  else if($modelo==0){
    $respuesta="Seleccione un modelo";
  }

  else if($version==0){
    $respuesta="Seleccione una versión";
  }

  else if($transmision==0){
    $respuesta="Seleccione una transmision";
  }

  else if($gasolina==0){
    $respuesta="Seleccione un tipo de combustible";
  }

  else if($cilindraje==0){
    $respuesta="Seleccione un tipo de cilindraje";
  }

  else if($sucursal==0){
    $respuesta="Seleccione la sucursal";
  }

  else if($garage==0){
    $respuesta="Seleccione el garage";
  }

  else if($clientePertenece==0){
    $respuesta="Seleccione el cliente dueño";
  }
  
  else{
    $query="SELECT  * FROM Funcion_Agregar_Vehiculo_Cliente('$color', 
    '$placa','$anio','$generacion','$serie',$tipoMotor,$marca,$transmision,
    $gasolina,$garage,$cilindraje,$modelo,$version,$clientePertenece);";  
    $resultados=$conexion->ejecutarConsulta($query);
    $respuesta=$conexion->obtenerFila($resultados);
    $respuesta=$respuesta[1];
  }
  $conexion->cerrarConexion();
  echo json_encode($respuesta); 
?>