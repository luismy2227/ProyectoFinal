<?php
  session_start();
  if(isset($_SESSION["status"])==false){
    session_destroy();
    header("Location: login.php");
  }
    include("class/class-conexion.php");
    $conexion = new Conexion();
?>
<?php 
    $query = "SELECT MAX(idFactura) FROM vv_Detalle_Factura;";
    $idFact = $conexion->ejecutarConsulta($query);

    $rowidFact = pg_fetch_array($idFact);
    $idFact2 = $rowidFact[0];

    $query = "SELECT * FROM vv_Detalle_Factura WHERE idFactura = $idFact2;";
    $detalle = $conexion->ejecutarConsulta($query);

    $rowDetalle = pg_fetch_array($detalle);
    $target = $rowDetalle;
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
                                <h3>Detalle de Factura</h3>
                                <p>
                                    Información de la última transacción realizada. 
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
                                 <div class="container" id="Tabla" name="Tabla">
                    <table class="table table-dark">
                      <thead>
                        <tr>
                          <th scope="col">No. Factura</th>
                          <th scope="col">Subtotal</th>
                          <th scope="col">Impuesto</th>
                          <th scope="col">Descuento</th>
                          <th scope="col">Total</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row"><?php echo $target[0]; ?></th>
                          <td><?php echo $target[1]; ?></td>
                          <td><?php echo $target[2]; ?></td>
                          <td><?php echo $target[3]; ?></td>
                          <td><?php echo $target[4]; ?></td>
                        </tr>
                      </tbody>
                    </table>
                </div>
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
<script src="js/facturarRenta.js"></script>

<!--Combobox dependientes>
<script language="javascript">
    $(document).ready(function () {
        $("#cbx_VehiculoEmpresa").change(function () {
            $("#cbx_VehiculoEmpresa option:selected").each(function () {
                var idVehiculo = $(this).val();
                alert(idVehiculo);
                $.post("includes/get-Detalle.php", {idVehiculo: idVehiculo}, function (data) {
                    $("#detalle").append(data);
                });alert(idVehiculo);
            });
        })
    });

</script-->

</body>
</html>