<?php
	include("../class/class-conexion.php");
	$conexion = new Conexion();
	$idModelo = $_POST['idModelo'];
	$queryVersiones = "SELECT idVersion, descripcion FROM tbl_Version WHERE idModelo = '$idModelo' ORDER BY descripcion;";
	$resultadoVersiones = $conexion -> ejecutarConsulta($queryVersiones);

	$html = "<option value='0'>Selecciona una versión</option>";
	echo $html;
	while($rowVersiones = pg_fetch_array($resultadoVersiones)) {
		$html = "<option value='".$rowVersiones[0]."'>".$rowVersiones[1]."</option>";
		echo $html;
	}
?>