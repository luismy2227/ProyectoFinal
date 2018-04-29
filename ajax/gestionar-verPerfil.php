<?php
  session_start();
  include("../class/class-conexion.php");
  include("../class/class-Usuario.php");
  if(isset($_POST["accion"])){
    $conexion = new Conexion();
    switch ($_POST['accion']) {
      case "verPerfil":
            $respuesta=Usuario::verPerfil($conexion, $_SESSION['idUsuario']);
            echo json_encode($respuesta);
      break;

      case "cargarInfo":
            $respuesta=Usuario::cargarInfo($conexion, $_SESSION['idUsuario']);
            echo json_encode($respuesta);
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