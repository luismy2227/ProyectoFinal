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
			$query = "SELECT suc.idSucursal idSucursal, suc.descripcion descripcion, suc.rutaFoto foto, dir.departamento departamento, 
			dir.municipio municipio, dir.colonia, colonia, dir.sector sector, dir.numeroCasa numeroCasa FROM tbl_Sucursal suc
			INNER JOIN tbl_Direccion dir ON dir.idDireccion = suc.idDireccion;";
			$sucursales = $conexion -> ejecutarConsulta($query);
			$res = array();

			while($respuesta=$conexion->obtenerFilas($sucursales)){
                $res[]=$respuesta;
            }
            return $res;

		}
	}
?>
