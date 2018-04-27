<?php
	include("../class/class-conexion.php");
	$conexion = new Conexion();
	$idMarca = $_POST['idMarca'];
	$queryModelos = "SELECT idModelo, descripcion FROM tbl_Modelo WHERE idMarca = '$idMarca' ORDER BY descripcion;";
	$resultado = $conexion -> ejecutarConsulta($queryModelos);

	$html = "<option value='0'>Selecciona un modelo</option>";
	echo $html;
	while($rowModelos = pg_fetch_array($resultado)) {
		$html = "<option value='".$rowModelos[0]."'>".$rowModelos[1]."</option>";
		echo $html;
	}
?>