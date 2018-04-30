<?php
	include("../class/class-conexion.php");
	$conexion = new Conexion();
	$idSucursal = $_POST['idSucursal'];
	$queryTaller = "SELECT idTaller,estado FROM tbl_Taller WHERE idSucursal = '$idSucursal';";
	$resultado = $conexion -> ejecutarConsulta($queryTaller);

	$html = "<option value='0'>Selecciona un Taller</option>";
	echo $html;
	while($rowTaller = pg_fetch_array($resultado)) {
		$html = "<option value='".$rowTaller[0]."'> Taller No. ".$rowTaller[0]." (".$rowTaller[1].")</option>";
		echo $html;
	}
?>