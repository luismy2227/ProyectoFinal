<?php
  //session_start();
  include("../class/class-conexion.php");
  include("../class/class-Sucursal.php");
  if(isset($_POST["accion"])){
    $conexion = new Conexion();
    switch ($_POST['accion']) {
      case "listar":
            $respuesta=Sucursal::listar($conexion);
            echo json_encode($respuesta);
      break;

      case "seleccionar":
      break;

      case "eliminar-registro":
      break;

      case "insertar-registro":
      break;

      case "actualizar-registro":
      break;

      default:
        echo json_encode("Petición inválida");
      break;
    }
    $conexion->cerrarConexion();
  }else{
    echo json_encode("No se especificó petición");
  }
?>