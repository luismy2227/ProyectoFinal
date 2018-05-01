<?php
  session_start();
  if(isset($_SESSION["status"])==false){
    session_destroy();
    header("Location: login.php");
  }
    include("class/class-conexion.php");
    $conexion = new Conexion();
  //Obteniendo los vehículos
    $query = "SELECT tbl_VehiculoEmpresa.idVehiculoEmpresa, tbl_Marca.descripcion, 
    tbl_Modelo.descripcion, EXTRACT(YEAR FROM tbl_Vehiculo.anio) FROM tbl_VehiculoEmpresa
    INNER JOIN tbl_Vehiculo ON tbl_Vehiculo.idVehiculo = tbl_VehiculoEmpresa.idVehiculo
    INNER JOIN tbl_Marca ON tbl_Marca.idMarca = tbl_Vehiculo.idMarca
    INNER JOIN tbl_Modelo ON tbl_Modelo.idModelo = tbl_Vehiculo.idModelo
    WHERE tbl_VehiculoEmpresa.seVende = TRUE AND tbl_VehiculoEmpresa.vendido = FALSE
    ORDER BY tbl_VehiculoEmpresa.idVehiculoEmpresa;";
    $resVehiculos = $conexion->ejecutarConsulta($query);

    //Obteniendo los clientes
    $query = "SELECT tbl_Cliente.idCliente, tbl_Persona.primerNombre, tbl_Persona.primerApellido FROM tbl_Cliente
    INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Cliente.idPersona
    WHERE tbl_Cliente.idCliente <> 16
    ORDER BY tbl_Cliente.idCliente;";
    $resClientes = $conexion->ejecutarConsulta($query);

    //Obteniendo descuentos activos
    $query = "SELECT idDescuento, descripcion, valor FROM tbl_Descuento
            WHERE estado ='A' OR estado ='a'
            ORDER BY descripcion;";
    $resDescuentos = $conexion->ejecutarConsulta($query);

    //Obteniendo las formas de pago
    $query = "SELECT idFormaPago, descripcion FROM tbl_FormaPago
            ORDER BY descripcion;";
    $resFormaPago = $conexion->ejecutarConsulta($query);
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>RENTCAR</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- styles -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="assets/css/docs.css" rel="stylesheet">
        <link href="assets/css/prettyPhoto.css" rel="stylesheet">
        <link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/color/default.css" rel="stylesheet">
        <link rel="shortcut icon" href="vehiculo.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
 


    </head>
    <body data-spy="scroll" data-target=".bs-docs-sidebar">
          <header>
            <!-- Navbar
            ================================================== -->
            <div class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                        <!-- logo -->
                        <a class="brand logo" href="index.php"><img src="assets/img/logo.png" alt=""></a>
                        <!-- end logo -->
                        <!-- top menu -->
                        <div class="navigation">
                            <nav>
                                <ul class="nav topnav">
                                    <li class="dropdown ">

                                        <a href="index.php">Inicio</a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#">Vehículos</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="verAutos.php">Ver Todo</a></li>
                                            <li><a href="verAutosRenta.php">Renta</a></li>
                                            <li><a href="verAutosVenta.php">Venta</a></li>
                                            <li class="dropdown"><a href="#">Agregar</a>
                                                <ul class="dropdown-menu sub-menu">
                                                    <li><a href="InsertarAutoCliente.php">Agregar Auto Cliente</a></li>
                                                    <li><a href="InsertarAutoEmpresa.php">Agregar Auto Empresa</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#">Personas</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="verPerfil.php">Perfil</a></li>
                                            <li class="dropdown"><a href="#">Clientes</a>
                                                <ul class="dropdown-menu sub-menu">
                                                    <li><a href="InsertarCliente.php">Agregar Cliente</a></li>
                                                    <li><a href="verClientes.php">Ver Todos</a></li>
                                                </ul>
                                            </li>
                                            <li class="dropdown"><a href="#">Empleados</a>
                                                <ul class="dropdown-menu sub-menu">
                                                    <li><a href="InsertarEmpleado.php">Agregar Empleado</a></li>
                                                    <li><a href="verEmpleados.php">Ver Todos</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                      <a href="#">Mantenimiento</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="SolicitudMantenimiento.php">Solicitud</a></li>

                                        </ul>
                                    </li>
                                    <li class="dropdown active">
                                        <a href="#">Facturación</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="InsertarFacturaRenta.php">Renta</a></li>
                                            <li><a href="InsertarFacturaVenta.php">Venta</a></li>
                                            <li><a href="InsertarFacturaMantenimiento.php">Mantenimiento</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="Sucursales.php">Sucursales</a>

                                    </li>

                                    <?php
                                    if(isset($_SESSION["status"])==true){
                                    $boton ="<li><a  id=\"btn_Logout\" name=\"btn_Logout\" href=\"includes/logout.php\">Cerrar Sesión</a></li>";
                                    echo $boton;
                                    }
                                    else{
                                    $boton1 ="<li><a  id=\"btn_Log\" name=\"btn_Log\" href=\"login.php\">Iniciar Sesión</a></li>";
                                    echo $boton1;
                                    }
                                    ?>

                                </ul>
                            </nav>
                        </div>
                        <!-- end menu -->
                    </div>
                </div>
            </div>
        </header>

        <section id="subintro">
            <div class="jumbotron subhead" id="overview">
                <div class="container">
                    <div class="row">
                        <div class="span12">
                            <div class="centered">
                                <h3>Módulo De Factura</h3>
                                <p>
                                    Llena la información solicitada 
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


                                        

        <section id="maincontent">
            <div class="container">
                <div class="row">
                    <div class="span4">
                        <div class="span8">
                            <div class="spacer30"></div>
                                


                            <form action="" id="Form_Venta" name="Form_Venta" method="post" role="form" class="contactForm">
                                <div class="row">
                                    <div class="span4 form-group">
                                        <div class="span4 form-group">              
                                        </div>
                                    <div class="span4 form-group">
                                        <div class="dotted_line"></div>
                                        <p><h3> Venta</h3></p>
                                        <div class="dotted_line"></div>
                                            <div class="span4 form-group">
                                                  <label>Vehículo:</label>
                                            <select required type="text" id="cbx_VehiculoEmpresa" name="cbx_VehiculoEmpresa" class="form-control" placeholder="Seleccione vehículo"  data-rule="minlen:4" data-msg="Seleccione un vehículo">
                                                <option value='0'>Seleccione un Vehículo</option>
                                                <?php while($rowVehiculo = pg_fetch_array($resVehiculos)) { ?>
                                                        <option value="<?php echo $rowVehiculo[0]; ?>" >
                                                            <?php echo $rowVehiculo[0]." | ". $rowVehiculo[1]." | ".$rowVehiculo[2]." | ".$rowVehiculo[3]; ?> 
                                                        </option>
                                                <?php } ?>
                                            </select>
                                              <label>Clientes:</label>
                                            <select required type="text" id="cbx_Clientes" name="cbx_Clientes" class="form-control" placeholder="Seleccione cliente"  data-rule="minlen:4" data-msg="Seleccione un cliente">
                                                <option value='0'>Seleccione un Cliente</option>
                                                <?php while($rowCliente = pg_fetch_array($resClientes)) { ?>
                                                        <option value="<?php echo $rowCliente[0]; ?>" >
                                                            <?php echo $rowCliente[0]." | ". $rowCliente[1]." ".$rowCliente[2]; ?> 
                                                        </option>
                                                <?php } ?>
                                            </select>
                                              <label>Forma de Pago:</label>
                                            <select required type="text" id="cbx_FormaPago" name="cbx_FormaPago" class="form-control" placeholder="Seleccione forma de pago"  data-rule="minlen:4" data-msg="Seleccione una forma de pago">
                                                <option value='0'>Seleccione una forma de pago</option>
                                                <?php while($rowFormaPago = pg_fetch_array($resFormaPago)) { ?>
                                                        <option value="<?php echo $rowFormaPago[0]; ?>" >
                                                            <?php echo $rowFormaPago[1]; ?> 
                                                        </option>
                                                <?php } ?>
                                            </select>
                                              <label>Descuento:</label>
                                            <select required type="text" id="cbx_Descuento" name="cbx_Descuento" class="form-control" placeholder="Seleccione descuento"  data-rule="minlen:4" data-msg="Seleccione un descuento">
                                                <option value='0'>Seleccione un descuento</option>
                                                <?php while($rowDescuento = pg_fetch_array($resDescuentos)) { ?>
                                                        <option value="<?php echo $rowDescuento[0]; ?>" >
                                                            <?php echo $rowDescuento[1]." ".$rowDescuento[2]."%"; ?> 
                                                        </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                     

                                <div class="span8 form-group">
                                    <div class="text-center">
                                        <button class="btn btn-color btn-rounded" id="btn_Guardar" name="btn_Guardar" type="submit">Guardar</button>
                                        <button class="btn btn-color btn-rounded" id="btn_Cancelar" name="btn_Cancelar" type="cancel" href="index.php" onclick="javascript:window.location = 'index.php';">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>

</section>
<footer class="footer">
    <div class="container">
      <div class="row">
        <div class="span4">
          <div class="widget">
           
          </div>
        </div>
        <div class="span4">
          <div class="widget">
            
          </div>
        </div>
        <div class="span4">
          <div class="widget">
                   

          </div>
        </div>
      </div>
    </div>
    <div class="verybottom">
      <div class="container">
        <div class="row">
          <div class="span6">
            <p>
             
            </p>
          </div>
          <div class="span6">
            <div class="credits">

              <p> 
                <?php  
                  if(isset($_SESSION["status"])==true){
                    $mensaje = "Usted se ha identificado como ".$_SESSION["nombre"];
                    echo $mensaje;
                  } ?> 
              </p>
              <p class="right">
                  &copy; 2018 RENTCAR. 
                </p>
          </div>
        </div>
      </div>
    </div>
  </footer>


<!-- JavaScript Library Files -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.easing.js"></script>
<script src="assets/js/google-code-prettify/prettify.js"></script>
<script src="assets/js/modernizr.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/jquery.elastislide.js"></script>
<script src="assets/js/sequence/sequence.jquery-min.js"></script>
<script src="assets/js/sequence/setting.js"></script>
<script src="assets/js/jquery.prettyPhoto.js"></script>
<script src="assets/js/application.js"></script>
<script src="assets/js/jquery.flexslider.js"></script>
<script src="assets/js/hover/jquery-hover-effect.js"></script>
<script src="assets/js/hover/setting.js"></script>


<!-- Contact Form JavaScript File -->
<script src="contactform/contactform.js"></script>

<!-- Template Custom JavaScript File -->
<script src="assets/js/custom.js"></script>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/facturarVenta.js"></script>

<!--Combobox dependientes-->
<!--script language="javascript">
                    //Combobox de modelos
                    $(document).ready(function () {
                        $("#cbx_Marca").change(function () {
                            $('#cbx_Version').find('option').remove().end().append('<option value="whatever"></option>').val('whatever');
                            $("#cbx_Marca option:selected").each(function () {
                                idMarca = $(this).val();
                                $.post("includes/get-Modelos.php", {idMarca: idMarca}, function (data) {
                                    $("#cbx_Modelo").html(data);
                                });
                            });
                        })
                    });

                    //Combobox de versiones
                    $(document).ready(function () {
                        $("#cbx_Modelo").change(function () {
                            $("#cbx_Modelo option:selected").each(function () {
                                idModelo = $(this).val();
                                $.post("includes/get-Versiones.php", {idModelo: idModelo}, function (data) {
                                    $("#cbx_Version").html(data);
                                });
                            });
                        })
                    });

                    //Combobox de garages
                    $(document).ready(function () {
                        $("#cbx_Sucursal").change(function () {
                            $("#cbx_Sucursal option:selected").each(function () {
                                idSucursal = $(this).val();
                                $.post("includes/get-Sucursales.php", {idSucursal: idSucursal}, function (data) {
                                    $("#cbx_Garage").html(data);
                                });
                            });
                        })
                    });
</script-->

</body>
</html>