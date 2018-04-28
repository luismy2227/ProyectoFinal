<?php

	class Sucursal{

		private $idSucursal;
		private $descripcion;
		private $idDireccion;

		public function __construct($idSucursal,
					$descripcion,
					$idDireccion){
			$this->idSucursal = $idSucursal;
			$this->descripcion = $descripcion;
			$this->idDireccion = $idDireccion;
		}
		public function getIdSucursal(){
			return $this->idSucursal;
		}
		public function setIdSucursal($idSucursal){
			$this->idSucursal = $idSucursal;
		}
		public function getDescripcion(){
			return $this->descripcion;
		}
		public function setDescripcion($descripcion){
			$this->descripcion = $descripcion;
		}
		public function getIdDireccion(){
			return $this->idDireccion;
		}
		public function setIdDireccion($idDireccion){
			$this->idDireccion = $idDireccion;
		}
		public function __toString(){
			return "IdSucursal: " . $this->idSucursal .
				" Descripcion: " . $this->descripcion .
				" IdDireccion: " . $this->idDireccion;
		}

		public static function listar($conexion){
			$query = "SELECT tbl_VehiculoEmpresa.idVehiculoEmpresa idVehiculo, tbl_Marca.descripcion marca, tbl_Modelo.descripcion modelo,
			tbl_VehiculoEmpresa.precioVenta precioVenta, tbl_VehiculoEmpresa.precioVenta precioRenta, tbl_Foto.rutaFoto foto FROM tbl_VehiculoEmpresa 
			INNER JOIN tbl_Vehiculo ON tbl_Vehiculo.idVehiculo = tbl_VehiculoEmpresa.idVehiculo
			INNER JOIN tbl_Marca ON tbl_Vehiculo.idMarca = tbl_Marca.idMarca
			INNER JOIN tbl_Modelo ON tbl_Modelo.idModelo = tbl_Vehiculo.idModelo
			INNER JOIN tbl_Foto ON tbl_Foto.idVehiculo = tbl_Vehiculo.idVehiculo;";
			$vehiculos = $conexion -> ejecutarConsulta($query);
			$carros = array();

			while($respuesta=$conexion->obtenerFilas($vehiculos)){
                $carros[]=$respuesta;
            }
            return $carros;

		}
	}
?>
