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
    //Obteniendo las marcas
    $query = "SELECT idMarca, descripcion FROM tbl_Marca ORDER BY descripcion;";
    $resMarcas = $conexion->ejecutarConsulta($query);

    //Obteniendo las transmisiones
    $query = "SELECT idTransmision, descripcion FROM tbl_Transmision ORDER BY descripcion;";
    $resTransmision = $conexion->ejecutarConsulta($query);

    //Obteniendo los tipos de gasolina
    $query = "SELECT idTipoGasolina, descripcion FROM tbl_TipoGasolina ORDER BY descripcion;";
    $resGasolina = $conexion->ejecutarConsulta($query);

    //Obteniendo los tipos de cilindraje
    $query = "SELECT idCilindraje, descripcion FROM tbl_Cilindraje ORDER BY descripcion;";
    $resCilindraje = $conexion->ejecutarConsulta($query);

    //Obteniendo las sucursales
    $query = "SELECT idSucursal, descripcion FROM tbl_Sucursal ORDER BY descripcion;";
    $resSucursal = $conexion->ejecutarConsulta($query);

    //Obteniendo los clientes
    $query = "SELECT tbl_Cliente.idCliente, tbl_Persona.primerNombre, tbl_Persona.primerApellido FROM tbl_Cliente 
    INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Cliente.idPersona
    WHERE  tbl_Cliente.idCliente<>16
    ORDER BY tbl_Cliente.idCliente;";
    $resPersonas = $conexion->ejecutarConsulta($query);

    /*$msg="";
    $idVehiculo =0;
    $idFoto =0;
    if(isset($_POST['upload'])){
    $target = "uploaded/".basename($_FILES['image']['name']);
    $image = $_FILES['image']['name'];

    $query ="SELECT MAX(idVehiculo) FROM tbl_Vehiculo;";
    $idVehiculo = ($conexion -> ejecutarConsulta($query)) + 1;
    $query ="SELECT MAX(idFoto) FROM tbl_Foto;";
    $idFoto = ($conexion -> ejecutarConsulta($query)) + 1;

    if(move_uploaded_file(($_FILES['image']['tmp_name']), $target)){
    $msg = "Se subió exitosamente la imagen";
    }else{
    $msg="Se produjo un error al subir la imagen";
    }
    $query = "INSERT INTO tbl_Foto (idFoto, rutaFoto, idVehiculo) VALUES('$idFoto', '$target', '$idVehiculo');";
    $conexion->ejecutarConsulta($query);
    }*/
?>

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
                                    <li class="dropdown active">
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
                                    <li class="dropdown">
                                        <a href="#">Facturacion</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="InsertarFacturaRenta.php">Renta</a></li>
                                            <li><a href="InsertarFacturaVenta.php">Venta</a></li>
                                            <li><a href="InsertarFacturaMantenimiento.php">Mantenimienro</a></li>
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
                                <h3>Registro de Vehículo</h3>
                                <p>
                                    Llena la información solicitada del vehículo del cliente, para registrar su pronto mantenimiento.
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

                            <form action="" id="Form_InsertarAutoCliente" name="Form_InsertarAutoCliente" method="post" role="form" class="contactForm">
                                <div class="row">
                                    <div class="span4 form-group">

                                        <!-- Combobox de marcas-->
                                        <div> 
                                            <select id="cbx_Marca" name="cbx_Marca" required>
                                                <option value='0' >Selecciona una marca</option>
                                                <?php while($rowMarcas = pg_fetch_array($resMarcas)) { ?>
                                                <option value="<?php echo $rowMarcas[0]; ?>" ><?php echo $rowMarcas[1]; ?> </option>
                                                <?php } ?>
                                            </select>
                                        </div>

                                        <!-- Combobox de modelos-->
                                        <div>
                                            <select id="cbx_Modelo" name="cbx_Modelo" required></select>
                                        </div>

                                        <!-- Combobox de versiones-->
                                        <div>
                                            <select id="cbx_Version" name="cbx_Version" required></select>
                                        </div>

                                        <!-- Combobox de transmisiones-->
                                        <div> 
                                            <select id="cbx_Transmisiones" name="cbx_Transmisiones" required>
                                                <option value='0'>Transmisión</option>
                                                <?php while($rowTransmision = pg_fetch_array($resTransmision)) { ?>
                                                <option value="<?php echo $rowTransmision[0]; ?>" ><?php echo $rowTransmision[1]; ?> </option>
                                                <?php } ?>
                                            </select>
                                        </div>

                                        <!-- Combobox de gasolinas-->
                                        <div> 
                                            <select id="cbx_Gasolinas" name="cbx_Gasolinas" required>
                                                <option value='0'>Combustible</option>
                                                <?php while($rowGasolina = pg_fetch_array($resGasolina)) { ?>
                                                <option value="<?php echo $rowGasolina[0]; ?>" ><?php echo $rowGasolina[1]; ?> </option>
                                                <?php } ?>
                                            </select>
                                        </div>

                                        <!-- Combobox de cilindrajes-->
                                        <div> 
                                            <select id="cbx_Cilindraje" name="cbx_Cilindraje" required>
                                                <option value='0'>Número de cilindros</option>
                                                <?php while($rowCilindros = pg_fetch_array($resCilindraje)) { ?>
                                                <option value="<?php echo $rowCilindros[0]; ?>" ><?php echo $rowCilindros[1]; ?> </option>
                                                <?php } ?>
                                            </select>
                                        </div>


                                        <!-- Combobox de sucursales-->
                                        <div> 
                                            <select id="cbx_Sucursal" name="cbx_Sucursal" required>
                                                <option value='0'>Selecciona una sucursal</option>
                                                <?php while($rowSucursal = pg_fetch_array($resSucursal)) { ?>
                                                <option value="<?php echo $rowSucursal[0]; ?>" ><?php echo $rowSucursal[1]; ?> </option>
                                                <?php } ?>
                                            </select>
                                        </div>

                                        <!-- Combobox de garages-->
                                        <div>
                                            <select id="cbx_Garage" name="cbx_Garage"></select required> 
                                        </div><!-- Combobox de Clientes-->
                                        <div> 
                                            <select id="cbx_ClientePertenece" name="cbx_ClientePertenece">
                                                <option value='0'>Selecciona un cliente</option>
                                                <?php while($rowCliente = pg_fetch_array($resPersonas)) { ?>
                                                <option value="<?php echo $rowCliente[0]; ?>" ><?php $nombre= $rowCliente[1]." ".$rowCliente[2]; echo $nombre; ?> </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="span4 form-group">
                                        <input required type="text" class="form-control" name="text_Color" id="text_Color" placeholder="Color" data-rule="minlen:4" data-msg="Campo requerido: Color" />
                                        <div class="validation"></div>

                                        <input required type="text" class="form-control" name="text_Placa" id="text_Placa" placeholder="Placa" data-rule="minlen:4" data-msg="Campo requerido: Placa" />
                                        <div class="validation"></div>

                                        <input required type="text" class="form-control" name="text_Anio" id="text_Anio" placeholder="Año (YYYY/MM/DD)" data-rule="minlen:4" data-msg="Campo requerido: Año" />
                                        <div class="validation"></div>

                                        <input required type="text" class="form-control" name="text_Generacion" id="text_Generacion" placeholder="Generación" data-rule="minlen:4" data-msg="Campo requerido: Generacion" />
                                        <div class="validation"></div>

                                        <input required type="text" class="form-control" name="text_Serie" id="text_Serie" placeholder="Número de Serie" data-rule="minlen:4" data-msg="Campo requerido: Serie" />
                                        <div class="validation"></div>

                                        <input required type="text" class="form-control" name="text_TipoMotor" id="text_TipoMotor" placeholder="Tipo de motor" data-rule="minlen:4" data-msg="Campo requerido: Tipo de Motor" />
                                        <div class="validation"></div>

                                    </div>

                                </div>
                                <div class="span4 form-group">
                                    <div class="col-md-4">
                                    </div>
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
<script src="js/insertarAutoCliente.js"></script>

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