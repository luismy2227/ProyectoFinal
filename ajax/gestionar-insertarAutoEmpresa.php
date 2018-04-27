<?php
  include("../class/class-conexion.php");
  $conexion= new Conexion();
  $aux=null;
  $aux1=null;
  $aux2=null;
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

  if(isset($_POST["cbx_Estado"])){
    $estado=$_POST["cbx_Estado"];
    $estado=(int)$estado;
  }

  if(isset($_POST["cbx_SeVende"])){
    $seVende=$_POST["cbx_SeVende"];
  }

  if(isset($_POST["text_PrecioVenta"])){
    $precioVenta=$_POST["text_PrecioVenta"];
    $precioVenta=(float)$precioVenta;
  }

  if(isset($_POST["cbx_SeRenta"])){
    $seRenta=$_POST["cbx_SeRenta"];
  }

  if(isset($_POST["text_PrecioRenta"])){
    $precioRenta=$_POST["text_PrecioRenta"];
    $precioRenta=(float)$precioRenta;
  }

  if(isset($_POST["cbx_EstadoMatricula"])){
    $estadoMatricula=$_POST["cbx_EstadoMatricula"];
  }

  if(isset($_POST["text_MontoMatricula"])){
    $montoMatricula=$_POST["text_MontoMatricula"];
    $montoMatricula=(float)$montoMatricula;
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

  if(isset($_POST["text_FechaAdquisicion"])){
    $fechaAdquisicion=$_POST["text_FechaAdquisicion"];
  }

  if(isset($_POST["text_Seguro"])){
    $seguro=$_POST["text_Seguro"];
    $seguro=(float)$seguro;
  }

  if(isset($_POST["cbx_Sucursal"])){
    $sucursal=$_POST["cbx_Sucursal"];
    $sucursal=(int)$sucursal;
  }

  if(isset($_POST["cbx_Garage"])){
    $garage=$_POST["cbx_Garage"];
    $garage=(int)$garage;
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

  else if($estado==0){
    $respuesta="Seleccione un tipo de estado";
  }
  else if($seVende==0){
    $respuesta="Seleccione si se vende";
  }

  else if((is_null($precioVenta) OR $precioVenta=="") AND $precioVenta!=0){
    $respuesta="Precio de venta inválido";
  }

  else if($seRenta==0){
    $respuesta="Seleccione si se renta";
  }

  else if((is_null($precioRenta) OR $precioRenta=="") AND $precioRenta!=0){
    $respuesta="Precio de renta inválido";
  }

  else if($estadoMatricula==0){
    $respuesta="Seleccione el estado del pago de matrícula";
  }

  else if((is_null($montoMatricula) OR $montoMatricula=="") AND $montoMatricula!=0){
    $respuesta="Monto de matrícula inválido";
  }

  else if($sucursal==0){
    $respuesta="Seleccione la sucursal";
  }

  else if($garage==0){
    $respuesta="Seleccione el garage";
  }
  
  else{
    
    if($seVende==1){
      $aux=1;
    }
    else{
      $aux=0;
    }
    if($seRenta==1){
      $aux1=1;
    }
    else{
      $aux1=0;
    }
    if($estadoMatricula==1){
      $aux2="P";
    }
    else{
      $aux2="D";
    }
    $query="SELECT  * FROM Funcion_Agregar_Vehiculo_Empresa('$color', '$placa','$anio','$generacion','$serie',$tipoMotor,$marca,$transmision,$gasolina,$garage,$cilindraje,$modelo,$version,'$fechaAdquisicion',$seguro,$estado,$precioVenta,$precioRenta,'$aux','$aux1', '$aux2',$montoMatricula);";  
    $resultados=$conexion->ejecutarConsulta($query);
    $respuesta=$conexion->obtenerFila($resultados);
    $respuesta=$respuesta[1];
  }
  $conexion->cerrarConexion();
  echo json_encode($respuesta); 
?>