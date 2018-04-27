<?php
	include("../class/class-conexion.php");
	$conexion = new Conexion();
	$idSucursal = $_POST['idSucursal'];
	$queryGarage = "SELECT idGarage, descripcion FROM tbl_Garage WHERE idSucursal = '$idSucursal' ORDER BY descripcion;";
	$resultadoGarage = $conexion -> ejecutarConsulta($queryGarage);

	$html = "<option value='0'>Selecciona un garage</option>";
	echo $html;
	while($rowGarage = pg_fetch_array($resultadoGarage)) {
		$html = "<option value='".$rowGarage[0]."'>".$rowGarage[1]."</option>";
		echo $html;
	}
?>