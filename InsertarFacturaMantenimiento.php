<?php
  session_start();
  if(isset($_SESSION["status"])==false){
    session_destroy();
    header("Location: login.php");
  }
  include("class/class-conexion.php");
    $conexion = new Conexion();
  //Obteniendo los vehículos
    $query = "SELECT tbl_SolicitudMantenimiento.idSolicitudMantenimiento, tbl_Marca.descripcion, 
    tbl_Modelo.descripcion, EXTRACT(YEAR FROM tbl_Vehiculo.anio) FROM tbl_VehiculoCliente
    INNER JOIN tbl_Vehiculo ON tbl_Vehiculo.idVehiculo = tbl_VehiculoCliente.idVehiculo
    INNER JOIN tbl_Marca ON tbl_Marca.idMarca = tbl_Vehiculo.idMarca
    INNER JOIN tbl_Modelo ON tbl_Modelo.idModelo = tbl_Vehiculo.idModelo
    INNER JOIN tbl_SolicitudMantenimiento ON tbl_SolicitudMantenimiento.idVehiculoCliente = tbl_VehiculoCliente.idVehiculoCliente
    INNER JOIN tbl_Mantenimiento ON tbl_Mantenimiento.idSolicitudMantenimiento = tbl_SolicitudMantenimiento.idSolicitudMantenimiento
    WHERE tbl_SolicitudMantenimiento.idSolicitudMantenimiento <> 31
    ORDER BY tbl_SolicitudMantenimiento.idSolicitudMantenimiento;";
    $resVehiculos = $conexion->ejecutarConsulta($query);
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
            
            <div class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">

                        <a class="brand logo" href="index.php"><img src="assets/img/logo.png" alt=""></a>

                        <div class="navigation">
                            <nav>
                                <ul class="nav topnav">
                                    <li class="dropdown">

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
                                            <li class="dropdown"><a href="#">Clientes</a>
                                                <ul class="dropdown-menu sub-menu">
                                                    <li><a href="InsertarCliente.php">Agregar Cliente</a></li>
                                                </ul>
                                            </li>
                                            <li class="dropdown"><a href="#">Empleados</a>
                                                <ul class="dropdown-menu sub-menu">
                                                    <li><a href="InsertarEmpleado.php">Agregar Empleado</a></li>
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
                                <h3>Modulo Factura</h3>
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
                        <form action="" id="Form_Mantenimiento" name="Form_Mantenimiento" method="post" role="form" class="contactForm">
                            <div class="row">
                                <div class="span4 form-group">
                                    <div class="span4 form-group"></div>
                                    <div class="span4 form-group">
                                        <p><h3> Mantenimiento</h3></p>
                                        <div class="dotted_line"></div>
                                            <div class="span4 form-group">
                                                <select required type="text" id="cbx_VehiculoEmpresa" name="cbx_VehiculoEmpresa" class="form-control" placeholder="Seleccione Descuento"  data-rule="minlen:4" data-msg="Seleccione un Descuento">
                                                    <option value='0'>Seleccione un vehículo en mantenimiento</option>
                                                    <?php while($rowVehiculo = pg_fetch_array($resVehiculos)) { ?>
                                                            <option value="<?php echo $rowVehiculo[0]; ?>" >
                                                                <?php echo $rowVehiculo[0]." | ". $rowVehiculo[1]." | ".$rowVehiculo[2]." | ".$rowVehiculo[3]; ?> 
                                                            </option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="span8 form-group">
                                            <div class="text-center">
                                                <button class="btn btn-color btn-rounded" id="btn_Guardar" name="btn_Guardar" type="submit">Guardar</button>
                                                <button class="btn btn-color btn-rounded" href="index.php">Cancelar</button>
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
<script src="js/insertarCliente.js"></script>

<!--Combobox dependientes-->
<script language="javascript">
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
</script>

</body>
</html>