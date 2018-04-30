<?php
    session_start();
    if(isset($_SESSION["status"])==false){
    session_destroy();
    header("Location: login.php");
    }
?>
<!DOCTYPE html>
<?php
    include("class/class-conexion.php");
    $conexion = new Conexion();
    
     $query = "SELECT tbl_VehiculoCliente.idVehiculoCliente, tbl_Marca.descripcion, 
    tbl_Modelo.descripcion, EXTRACT(YEAR FROM tbl_Vehiculo.anio) FROM tbl_VehiculoCliente
    INNER JOIN tbl_Vehiculo ON tbl_Vehiculo.idVehiculo = tbl_VehiculoCliente.idVehiculo
    INNER JOIN tbl_Marca ON tbl_Marca.idMarca = tbl_Vehiculo.idMarca
    INNER JOIN tbl_Modelo ON tbl_Modelo.idModelo = tbl_Vehiculo.idModelo
    WHERE tbl_VehiculoCliente.idVehiculoCliente <> 16;";
    $resVehiculoCliente = $conexion->ejecutarConsulta($query);

    //Obteniendo las transmisiones
    $query = "SELECT idTipoMantenimiento, descripcion FROM tbl_TipoMantenimiento;";
    $resTipoMantenimiento = $conexion->ejecutarConsulta($query);

    //Obteniendo los tipos de gasolina
    $query = "SELECT idRepuesto, descripcion FROM tbl_Repuesto ;";
    $resRepuesto = $conexion->ejecutarConsulta($query);

    //Obteniendo los tipos de cilindraje
    $query = "SELECT idSucursal, descripcion FROM tbl_Sucursal ;";
    $resSucursal = $conexion->ejecutarConsulta($query);

    //Obteniendo las sucursales
  
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

                                    <li class="dropdown active">
                                        <a href="index.<?php  ?>">Inicio</a>
                                       </li>
                <li class="dropdown">
                  <a href="#">Vehículos</a>
                  <ul class="dropdown-menu">
                 <li><a href="VerAutos.php">Ver Todo</a></li>
                    <li><a href="VerAutosRenta.php">Renta</a></li>
                    <li><a href="VerAutosVenta.php">Venta</a></li>
                    <li><a href="VerAutosSeleccionado.php">Seleccionado</a></li>
                    
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="#">Mantenimiento</a>
                  <ul class="dropdown-menu">
                    <li><a href="about.html">Servicios</a></li>
                    <li><a href="pricingtable.html">Repuestos</a></li>
                  
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="#">Sucursales</a>
                 
                </li>
                <li class="dropdown">
                  <a href="contact.html">Contactenos</a>
                 
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
                                <h3>Solicitud Mantenimiento</h3>
                                <p>
                                    Llena la Solicitud para  su pronto mantenimiento.
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
 <div> 
                                            <select id="cbx_VehiculoCliente" name="cbx_VehiculoCliente" required>
                                                <option value='0'>Selecciona un Vehiculo</option>
                                                <?php while($rowVehiculoCliente = pg_fetch_array($resVehiculoCliente)) { ?>
                                                <option value="<?php echo $rowVehiculoCliente[0]; ?>" ><?php echo $rowVehiculoCliente[1]; ?> </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                <div> 
                                            <select id="cbx_TipoMantenimiento" name="cbx_TipoMantenimiento" required>
                                                <option value='0'>Selecciona Tipo Mantenimiento</option>
                                                <?php while($rowTipoMantenimiento = pg_fetch_array($resTipoMantenimiento)) { ?>
                                                <option value="<?php echo $rowTipoMantenimiento[0]; ?>" ><?php echo $rowTipoMantenimiento[1]; ?> </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                        <div> 
                                          <div> 
                                            <select id="cbx_Repuesto" name="cbx_Repuesto" required>
                                                <option value='0'>Selecciona un Repuesto</option>
                                                <?php while($rowRepuesto = pg_fetch_array($resRepuesto)) { ?>
                                                <option value="<?php echo $rowRepuesto[0]; ?>" ><?php echo $rowRepuesto[1]; ?> </option>
                                                <?php } ?>
                                            </select>
                                        </div>

                                 <div> 
                                            <select id="cbx_Sucursal" name="cbx_Sucursal" required>
                                                <option value='0'>Selecciona una sucursal</option>
                                                <?php while($rowSucursal = pg_fetch_array($resSucursal)) { ?>
                                                <option value="<?php echo $rowSucursal[0]; ?>" ><?php echo $rowSucursal[1]; ?> </option>
                                                <?php } ?>
                                            </select>
                                  
                                             <select id="cbx_Taller" name="cbx_Taller" required></select>
                                             
                                        </div>                            
 
                                          

                                       <input required type="Date" class="form-control" name="text_FechaEntrada" id="text_FechaEntrada" placeholder="Fecha Entrada" data-rule="minlen:4" data-msg="Campo requerido: Fecha" />
                                        <div class="validation"></div>
                                        
                                            
                                          <input required type="Date" class="form-control" name="text_FechaSalida" id="text_FechaSalida" placeholder="Fecha Salida(YYYY MM DD)" data-rule="minlen:4" data-msg="Campo requerido: Fecha" />
                                        <div class="validation"></div>
                                             
                                                

                                     
                                     
                                        

                                 
                        
                              

                                      
                                        </div>

                                        <!-- Combobox de modelos-->
                                        <div>
                                            
                                        </div>

                                        <!-- Combobox de versiones-->
                                        <div>
                                            
                                        </div>

                                        <!-- Combobox de transmisiones-->
                                        <div> 
                                           
                                        </div>

                                        <!-- Combobox de gasolinas-->
                                        <div> 
                                           
                                        </div>

                                        <!-- Combobox de cilindrajes-->
                                        <div> 
                                          
                                        </div>


                                       
                                        <div> 
                                            
                                        </div>

                                        <div>
                                          
                                    </div>

                                    <div class="span4 form-group">
                                       

                                      
                                    </div>

                                </div>
                                <div class="span4 form-group">
                                    <div class="col-md-4">
                                    </div>
                                </div>
                                <div class="span8 form-group">
                                    <div class="text-center">
                                        <button class="btn btn-color btn-rounded" id="btn_Guardar" name="btn_Guardar" type="submit">Guardar</button>
                                    </div>
                                    <div>
                                    <button class="btn btn-color btn-rounded" id="btn_Cancelar" name="btn_Cancelar" type="cancel" onclick="javascript:window.location = 'index.php';">Cancelar</button>
                                </div>
                                </div>
                        </div>
                    </div>
                </div>
                </form>
                <
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
<script src="js/insertarSolicitudMantenimiento.js"></script>

<!--Combobox dependientes-->
<script language="javascript">
                    //Combobox de modelos
                    $(document).ready(function () {
                        $("#cbx_Sucursal").change(function () {
                            $("#cbx_Sucursal option:selected").each(function () {
                                idSucursal = $(this).val();
                                $.post("includes/get-Talleres.php", {idSucursal: idSucursal}, function (data) {
                                    $("#cbx_Taller").html(data);
                                });
                            });
                        })
                    });

         
</script>

</body>
</html>