<?php
	if(isset($_POST["accion"])){
    	$accion=$_POST["accion"];
  	}

  	session_start();
    $_SESSION['status']=false;
    $respuesta="Cerró sesión";
    $respuesta['loggedin']=0;
    $respuesta['mensajeSesion']="No tiene acceso";
?>