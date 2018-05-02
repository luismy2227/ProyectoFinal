<?php
  include("../class/class-conexion.php");
  //include("../class/class-usuario.php");
  $conexion= new Conexion();

  if(isset($_POST["user"])){
    $usuario=$_POST["user"];
  }
  if(isset($_POST["password"])){
    $contra1=$_POST["password"];
    $contra=hash("sha512",$contra1);
  }
  if(isset($_POST["accion"])){
    $accion=$_POST["accion"];
  }

     
  $query = "SELECT  * FROM Funcion_Login('".$usuario."','".$contra."');";
  $resultados=$conexion->ejecutarConsulta($query);
  $respuesta=$conexion->obtenerFila($resultados);

  if($respuesta[1] == 0){
    session_start();

    $query="SELECT tbl_Persona.primerNombre, tbl_Persona.primerApellido FROM tbl_Persona 
    INNER JOIN tbl_Cliente ON tbl_Cliente.idCliente=tbl_Persona.idPersona
    INNER JOIN tbl_Usuario ON tbl_Cliente.idUsuario = tbl_Usuario.idUsuario;";
    $id = $conexion -> ejecutarConsulta($query);
    $idUser = $conexion ->obtenerFila($id);

    $query="SELECT tbl_Persona.primerNombre, tbl_Persona.primerApellido FROM tbl_Persona 
    INNER JOIN tbl_Cliente ON tbl_Cliente.idCliente=tbl_Persona.idPersona
    INNER JOIN tbl_Usuario ON tbl_Cliente.idUsuario = tbl_Usuario.idUsuario;";
    $nombre = $conexion -> ejecutarConsulta($query);
    $nombre = $conexion ->obtenerFila($nombre);
    $nombreCompleto = $nombre[0]." ".$nombre[1];

    $_SESSION['status']=true;
    $_SESSION['ultimoAcceso']=date("Y-n-j H:i:s");
    $_SESSION['idUsuario'] = $idUser[0];
    $_SESSION['nombre']=$nombreCompleto;
    $respuesta['loggedin']=1;
    $respuesta['mensajeSesion']="Tiene acceso";
  }
  else{
    session_start();
    $_SESSION['status']=false;
    $respuesta['loggedin']=0;
    $respuesta['mensajeSesion']="No tiene acceso";
  }

  //$respuesta="$accion $usuario $contra";
  
  echo json_encode($respuesta);
  $conexion->cerrarConexion();
?>