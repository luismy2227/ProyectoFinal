<?php
    session_start();
    if(isset($_SESSION["status"])==false){
        session_destroy();
        header("Location: login.php");
    }

    include("class/class-conexion.php");
    $conexion = new Conexion();

    $carro = $_POST["busqueda"];
    $query = "SELECT tbl_VehiculoEmpresa.idVehiculoEmpresa idVehiculo, tbl_Marca.descripcion marca, tbl_Modelo.descripcion modelo,
            tbl_VehiculoEmpresa.precioVenta precioVenta, tbl_VehiculoEmpresa.precioVenta precioRenta, tbl_Foto.rutaFoto foto FROM tbl_VehiculoEmpresa 
            INNER JOIN tbl_Vehiculo ON tbl_Vehiculo.idVehiculo = tbl_VehiculoEmpresa.idVehiculo
            INNER JOIN tbl_Marca ON tbl_Vehiculo.idMarca = tbl_Marca.idMarca
            INNER JOIN tbl_Modelo ON tbl_Modelo.idModelo = tbl_Vehiculo.idModelo
            INNER JOIN tbl_Version ON tbl_Version.idVersion = tbl_Vehiculo.idVersion
            INNER JOIN tbl_Foto ON tbl_Foto.idVehiculo = tbl_Vehiculo.idVehiculo
            WHERE tbl_Marca.descripcion LIKE '%$carro%' OR tbl_Modelo.descripcion LIKE '%$carro%'
                    OR tbl_Version.descripcion LIKE '%$carro%';";
    $vehiculos = $conexion -> ejecutarConsulta($query);
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

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/jumbotron.css" rel="stylesheet">

        <!--Custom-->
        <link href="css/custom.css" rel="stylesheet">
    </head>
    <body data-spy="scroll" data-target=".bs-docs-sidebar">
        <!--header>
            
            <div class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                        
                        <a class="brand logo" href="index.html"><img src="assets/img/logo.png" alt=""></a>
                        
                        <div class="navigation">
                            <nav>
                                <ul class="nav topnav">
                                    <li class="dropdown active">

                                        <a href="index.php">Inicio</a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#">Vehículos</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="overview.html">Ver Todo</a></li>
                                            <li><a href="scaffolding.html">Renta</a></li>
                                            <li><a href="base-css.html">Venta</a></li>
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
                                            <li><a href="about.html">Servicios</a></li>
                                            <li><a href="pricingtable.html">Repuestos</a></li>

                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#">Sucursales</a>

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
        </header-->

        <section id="subintro">
            <div class="jumbotron subhead" id="overview">
                <div class="container">
                    <!-- Search -->
                     
                    <div class="row">
                        <div class="span12">
                            <div class="centered">
                                <h3>Vehículos</h3>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <div class="container">
            <div class="box search">
                <!-- Busqueda -->
                <h2>Buscar <span></span></h2>
                <form action="buscarAutos.php" method="post">
                    <fieldset>
                        <input type="text" name="busqueda" id="busqueda">
                        <input type="submit" value="Buscar">
                    </fieldset>
                </form>
            </div>
        </div>


        <!--section id="maincontent"-->
        <div  class="container">
            <ul>
                <p>
                    <?php
                        if ($vehiculos->num_rows > 0) {
                            while ($row = $vehiculo->fetch_assoc()) {
                                echo '<li>'.
                                        '<div class="dotted_line"></div>'.
                                        '   <div class="col-md-6 col-lg-4" >'.
                                        '   <div class="single-feature">'.
                                        '       <div class="card">'.
                                        '           <div class="card-header cards-courses-h">'.$row["marca"]." ".$row["modelo"].
                                        '           </div>'.    
                                        '           <div class="card-body">'.
                                        '                   <h5 class="card-title">'.'</h5>'.
                                        /*'                   <p class="card-text">Precio de venta: </p>'+
                                        '                   <p class="card-text">'+carros.precioventa+'</p>'+*/
                                        '                   <img src="'.$row["foto"].'" alt="" width="350" height="350">'.
                                        '                   <p><a class="btn btn-primary" href="#" role="button">Ver Vehículo &raquo;</a></p>'.
                                        '           </div>'.
                                        '       </div>'.
                                        '    </div>'.
                                        '</div></li>';
                        }
                    } else {
                        echo "0 results";
                    }
                    
                    ?>                                
                </p>
            </ul>
        </div>
<!--/section-->
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

<!--Robert-->
<script src="js/jquery-3.3.1.slim.min.js" ></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"></script>')</script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<!-- Contact Form JavaScript File -->
<script src="contactform/contactform.js"></script>

<!-- Template Custom JavaScript File -->
<script src="assets/js/custom.js"></script>

<!--Únicas cosas que yo metí-->
<script src="js/jquery-3.2.1.min.js"></script>
<!--script src="js/allCars.js"></script-->

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