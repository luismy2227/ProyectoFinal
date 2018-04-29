<?php
	session_start();
	include("../class/class-conexion.php");
  	include("../class/class-Usuario.php");

	$conexion = new Conexion();

	$respuesta = Usuario::verPerfil($conexion, 23);
	var_dump($respuesta);
?>