<?php
  session_start();
  if(isset($_SESSION["status"])==false){
    session_destroy();
    header("Location: login.php");
  }
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
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
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
          <a class="brand logo" href="index.html"><img src="assets/img/logo.png" alt=""></a>
          <!-- end logo -->
          <!-- top menu -->
          <div class="navigation">
            <nav>
              <ul class="nav topnav">
                <li class="dropdown active">
                  <a href="index.php">Inicio</a>
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
                                


                            <form action="" id="Form_InsertarFactura" name="Form_InsertarFactura method="post" role="form" class="contactForm">
                                <div class="row">
                                   
                                                                 

  
               
               
              
                              </div>
                              
                                  </div>
                                     
                                  <p>
                                  <h3>Mantenimiento</h3>
                                  <div class="dotted_line"></div>
                                </p>
                                 <div class="span4 form-group">
 <select required type="text" id="cbx_SeleccioneMantenimiento" name="cbx_SeleccioneMantenimiento" class="form-control" placeholder="Seleccione Descuento"  data-rule="minlen:4" data-msg="Seleccione Mantenimiento">
                                  <option value='0'>Seleccione Mantenimiento</option>
                                 
                                </select>
                              </div>

                <div class="span8 form-group">
                                    <div class="text-center">
                                        <button class="btn btn-color btn-rounded" id="btn_Guardar" name="btn_Guardar" type="submit">Guardar</button>
                                        <button class="btn btn-color btn-rounded" id="btn_Cancelar" name="btn_Cancelar" type="cancel" onclick="javascript:window.location = 'index.php';">Cancelar</button>
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