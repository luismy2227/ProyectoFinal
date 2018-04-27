<?php
	class Conexion{
		private $usuario="postgres";
		private $contrasena="Super97*";
		private $host="localhost";
		private $baseDatos="Vehiculos3.0";
		private $puerto=5432;
		private $link;

		public function __construct(){
			$this->establecerConexion();
		}

		public function establecerConexion(){
			//$this->link = pg_connect('host='.$this->host.' port='.$this->puerto.' dbname='. $this->baseDatos.' user='. $this->usuario.' password='.$this->contrasena);
			$this->link = pg_connect("host=$this->host port=$this->puerto dbname=$this->baseDatos user=$this->usuario password=$this->contrasena");
		}

		public function cerrarConexion(){
			pg_close($this->link);
		}

		public function ejecutarConsulta($sql){
			return pg_query($this->link, $sql);
		}

		public function getUsuario(){
			return $this->usuario;
		}
		public function setUsuario($usuario){
			$this->usuario = $usuario;
		}
		public function getContrasena(){
			return $this->contrasena;
		}
		public function setContrasena($contrasena){
			$this->contrasena = $contrasena;
		}
		public function getHost(){
			return $this->host;
		}
		public function setHost($host){
			$this->host = $host;
		}
		public function getBaseDatos(){
			return $this->baseDatos;
		}
		public function setBaseDatos($baseDatos){
			$this->baseDatos = $baseDatos;
		}
		public function getPuerto(){
			return $this->puerto;
		}
		public function setPuerto($puerto){
			$this->puerto = $puerto;
		}
		public function getLink(){
			return $this->link;
		}
		public function setLink($link){
			$this->link = $link;
		}

		public function obtenerFila($resultado){
            return pg_fetch_array($resultado, 0,PGSQL_BOTH);
        }

        public function obtenerFilas($resultado){
            return pg_fetch_array($resultado, NULL, PGSQL_ASSOC);
        }

	}

  /*$conexion= new Conexion();
  $query_call = "SELECT  * FROM Funcion_Login('user1', 'password1');";
  $resultados_call=$conexion->ejecutarConsulta($query_call);
  $respuesta=$conexion->obtenerFila($resultados_call);
  $conexion->cerrarConexion();
  var_dump($respuesta);
  echo $respuesta[0];
  echo $respuesta[1];*/
?>
