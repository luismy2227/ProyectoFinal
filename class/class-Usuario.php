<?php

	class Usuario{

		private $idUsuario;
		private $nombreUsuario;
		private $imagenRuta;

		public function __construct($idUsuario,
					$nombreUsuario,
					$imagenRuta){
			$this->idUsuario = $idUsuario;
			$this->nombreUsuario = $nombreUsuario;
			$this->imagenRuta = $imagenRuta;
		}
		public function getIdUsuario(){
			return $this->idUsuario;
		}
		public function setIdUsuario($idUsuario){
			$this->idUsuario = $idUsuario;
		}
		public function getNombreUsuario(){
			return $this->nombreUsuario;
		}
		public function setNombreUsuario($nombreUsuario){
			$this->nombreUsuario = $nombreUsuario;
		}
		public function getImagenRuta(){
			return $this->imagenRuta;
		}
		public function setImagenRuta($imagenRuta){
			$this->imagenRuta = $imagenRuta;
		}
		public function __toString(){
			return "IdUsuario: " . $this->idUsuario .
				" NombreUsuario: " . $this->nombreUsuario .
				" ImagenRuta: " . $this->imagenRuta;
		}

		public static function verPerfil($conexion, $idUsuario){
			$query = "SELECT idUsuario, idEmpleado, primerNombre, segundoNombre, primerApellido,segundoApellido, 
			rutaFoto, fechaContratacion, cargo, fechaPromocion, nombreUsuario, telefono, correoElectronico FROM vv_Informacion_Empleado  
			WHERE idUsuario=$idUsuario;";
			$registro = $conexion -> ejecutarConsulta($query);
			$res = array();

			while($respuesta=$conexion->obtenerFilas($registro)){
                $res[]=$respuesta;
            }
            return $res;
		}

		public static function verPerfiles($conexion, $idUsuario){
			$query = "SELECT idUsuario, idEmpleado, primerNombre, segundoNombre, primerApellido,segundoApellido, 
			rutaFoto, fechaContratacion, cargo, fechaPromocion, nombreUsuario, telefono, correoElectronico 
			FROM vv_Informacion_Empleado
			ORDER BY idEmpleado;";
			$registro = $conexion -> ejecutarConsulta($query);
			$res = array();

			while($respuesta=$conexion->obtenerFilas($registro)){
                $res[]=$respuesta;
            }
            return $res;
		}

		public static function verPerfilesClientes($conexion, $idUsuario){
			$query = "SELECT idUsuario, idCliente, primerNombre, segundoNombre, primerApellido,segundoApellido, 
			rutaFoto, nombreUsuario, telefono, correoElectronico 
			FROM vv_Informacion_Cliente
			ORDER BY idCliente;";
			$registro = $conexion -> ejecutarConsulta($query);
			$res = array();

			while($respuesta=$conexion->obtenerFilas($registro)){
                $res[]=$respuesta;
            }
            return $res;
		}

		public static function cargarInfo($conexion, $idUsuario){
			$query = "SELECT vv_Informacion_Empleado.idUsuario, vv_Informacion_Empleado.idEmpleado, tbl_Persona.identidad, vv_Informacion_Empleado.primerNombre, 
			vv_Informacion_Empleado.segundoNombre, vv_Informacion_Empleado.primerApellido, vv_Informacion_Empleado.segundoApellido, 
			vv_Informacion_Empleado.rutaFoto, vv_Informacion_Empleado.fechaContratacion, tbl_Empleado.idCargo, vv_Informacion_Empleado.fechaPromocion, 
			vv_Informacion_Empleado.nombreUsuario,  vv_Informacion_Empleado.telefono, vv_Informacion_Empleado.correoElectronico, tbl_Direccion.departamento,
			tbl_Direccion.municipio, tbl_Direccion.colonia, tbl_Direccion.sector, tbl_Direccion.numeroCasa FROM vv_Informacion_Empleado  
			INNER JOIN tbl_Empleado ON tbl_Empleado.idEmpleado = vv_Informacion_Empleado.idEmpleado
			INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Empleado.idPersona
			INNER JOIN tbl_Direccion ON tbl_Direccion.idDireccion = tbl_Persona.idDireccion
			WHERE vv_Informacion_Empleado.idUsuario=$idUsuario;";
			$registro = $conexion -> ejecutarConsulta($query);
			$res = array();

			while($respuesta=$conexion->obtenerFilas($registro)){
                $res[]=$respuesta;
            }
            return $res;
		}
	}
?>
