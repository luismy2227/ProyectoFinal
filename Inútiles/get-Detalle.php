<?php
  include("../class/class-conexion.php");
  $conexion = new Conexion();
  $idVehiculo = (int)$_POST['idVehiculo'];
  $queryCar = "SELECT tbl_VehiculoEmpresa.idVehiculoEmpresa idVehiculo, tbl_Marca.descripcion marca, tbl_Modelo.descripcion modelo,
      tbl_VehiculoEmpresa.seVende seVende, tbl_VehiculoEmpresa.precioVenta precioVenta, tbl_VehiculoEmpresa.precioRentaHora precioRenta, 
      tbl_VehiculoEmpresa.seRenta seRenta, tbl_Foto.rutaFoto foto, EXTRACT(YEAR FROM tbl_Vehiculo.anio) anio, 
      tbl_Cilindraje.descripcion cilindraje, tbl_TipoGasolina.descripcion gasolina, tbl_Vehiculo.tipoMotor tipoMotor,
      tbl_Transmision.descripcion transmision, tbl_Vehiculo.placa placa FROM tbl_VehiculoEmpresa 
      INNER JOIN tbl_Vehiculo ON tbl_Vehiculo.idVehiculo = tbl_VehiculoEmpresa.idVehiculo
      INNER JOIN tbl_Marca ON tbl_Vehiculo.idMarca = tbl_Marca.idMarca
      INNER JOIN tbl_Modelo ON tbl_Modelo.idModelo = tbl_Vehiculo.idModelo
      INNER JOIN tbl_Foto ON tbl_Foto.idVehiculo = tbl_Vehiculo.idVehiculo
      INNER JOIN tbl_Transmision ON tbl_Transmision.idTransmision = tbl_Vehiculo.idTransmision
      INNER JOIN tbl_Cilindraje ON tbl_Cilindraje.idCilindraje = tbl_Vehiculo.idCilindraje
      INNER JOIN tbl_Estado ON tbl_Estado.idEstado = tbl_VehiculoEmpresa.idEstado
      INNER JOIN tbl_TipoGasolina ON tbl_TipoGasolina.idTipoGasolina = tbl_Vehiculo.idTipoGasolina
      WHERE tbl_VehiculoEmpresa.idVehiculoEmpresa = $idVehiculo;";

    //$resultado = $conexion -> ejecutarConsulta($queryCar);
    echo '<h3>Hola Mundo</h3>';
  
    //$carros = $conexion ->obtenerFilas($resultado);
    /*$html = '<div class="dotted_line"></div>'.
            '<div class ="Cajita" id="Cajita">'.
            '   <div class="col-md-6 col-lg-4" >'.
            '   <div class="single-feature">'.
            '       <div class="card">'.
            '           <div class="card-header cards-courses-h"><h3>'.$carros[1]." ".$carros[2]." ".$carros[8].
            '           </h3></div>'.    
            '           <div class="card-body">'.
            '                   <h5 class="card-title">'.'</h5>'.
            '                   <img src="'.$carros[7].'" alt="" width="1000" height="700">'.
            //'                   <p><a class="btn btn-primary" href="verAutoSeleccionado.php?id='.$carros.idvehiculo.'" role="button" >Ver Vehículo &raquo;</a></p>'.
            '           </div>'.
            '       </div>'.
            '       </div>'.
            '   </div></div>'.
            '<br><br>'.
            '<div class="add-details">'.
            '<div class="container">'.
            '<div class="row">'.
            '<div class="col-800">'.
            '<ul><h5>IdVehiculo: '.$carros[0].'<br>Placa: '.$carros[13].'</h5>';
            if ($carros[6]==1){
                $carros = $carros .'<br><span class="info-name">Precio de renta por hora: </span>'.
                            '<span class="info-value" >Lps. '.$carros[5].'</span><br>';
            }
            $carros = $carros . '<span class="info-value" >Cilindraje: '.$carros[9].'</span><br>'.
                          '<span class="info-value" >Tipo de motor (ml): '.$carros[11].'</span><br>'.
                          '<span class="info-value" >Combustible: '.$carros[10].'</span><br>'.
                          '<span class="info-value" >Transmision: '.$carros[12].'</span><br>';
            $carros = $carros .'</ul></div></div></div></div>';*/

    //echo $carros[1]." ".$carros[2]." ".$carros[8];
  
?>