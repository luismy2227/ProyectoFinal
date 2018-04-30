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

    //Obteniendo los tipos de estado
    $query = "SELECT idEstado, descripcion FROM tbl_Estado;";
    $resEstado = $conexion->ejecutarConsulta($query);

    $query = "SELECT idSucursal, descripcion FROM tbl_Sucursal ORDER BY descripcion;";
    $resSucursal = $conexion->ejecutarConsulta($query);

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
        <link rel="shortcut icon" href="vehiculo.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">


    </head>

    <body>

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
                                    Llena la información solicitada del vehículo adquirido, para ponerlo disponible a la venta o renta.
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
                            <form action="" id="Form_InsertarAutoEmpresa" name="Form_InsertarAutoEmpresa" method="post" role="form" class="contactForm">
                                <div class="row">
                                    <div class="span4 form-group">

                                        <!-- Combobox de marcas-->
                                        <div> 
                                            <select id="cbx_Marca" name="cbx_Marca" required>
                                                <option value='0'>Selecciona una marca</option>
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

                                        <!-- Combobox de estados-->
                                        <div> 
                                            <select id="cbx_Estado" name="cbx_Estado" required>
                                                <option value='0'>Estado</option>
                                                <?php while($rowEstado = pg_fetch_array($resEstado)) { ?>
                                                <option value="<?php echo $rowEstado[0]; ?>" ><?php echo $rowEstado[1]; ?> </option>
                                                <?php } ?>
                                            </select>
                                        </div>

                                        <div> 
                                            <!-- Combobox de si se vende-->
                                            <select id="cbx_SeVende" name="cbx_SeVende" required>
                                                <option value='0'>Venta</option>
                                                <option value='1'>Si</option>
                                                <option value='2'>No</option>
                                            </select>

                                            <input required type="text" class="form-control" name="text_PrecioVenta" id="text_PrecioVenta" placeholder="Precio de venta" data-rule="minlen:4" data-msg="Precio de venta" />

                                            <!-- Combobox de si se renta-->
                                            <select id="cbx_SeRenta" name="cbx_SeRenta" required>
                                                <option value='0'>Renta</option>
                                                <option value='1'>Si</option>
                                                <option value='2'>No</option>
                                            </select>

                                            <input required type="text" class="form-control" name="text_PrecioRenta" id="text_PrecioRenta" placeholder="Precio de renta por hora" data-rule="minlen:4" data-msg="Precio de renta" />
                                        </div>

                                        <!-- Combobox de estado de matrícula-->
                                        <select id="cbx_EstadoMatricula" name="cbx_EstadoMatricula" required>
                                            <option value='0'>Estado de matrícula</option>
                                            <option value='1'>Pagada</option>
                                            <option value='2'>No pagada</option>
                                        </select>

                                        <input required type="text" class="form-control" name="text_MontoMatricula" id="text_MontoMatricula" placeholder="Monto de matrícula" data-rule="minlen:4" data-msg="Monto de matrícula" />

                                    </div>

                                    <div class="span4 form-group">
                                        <input required type="text" class="form-control" name="text_Color" id="text_Color" placeholder="Color" data-rule="minlen:4" data-msg="Campo requerido: Color" />
                                        <div class="validation"></div>
                                    </div>

                                    <div class="span4 form-group">
                                        <input required type="text" class="form-control" name="text_Placa" id="text_Placa" placeholder="Placa" data-rule="minlen:4" data-msg="Campo requerido: Placa" />
                                        <div class="validation"></div>
                                    </div>

                                    <div class="span4 form-group">
                                        <input required type="text" class="form-control" name="text_Anio" id="text_Anio" placeholder="Año (YYYY/MM/DD)" data-rule="minlen:4" data-msg="Campo requerido: Año" />
                                        <div class="validation"></div>
                                    </div>
                                    <div class="span4 form-group">
                                        <input type="text" class="form-control" name="text_Generacion" id="text_Generacion" placeholder="Generación" data-rule="minlen:4" data-msg="Campo requerido: Generacion" />
                                        <div class="validation"></div>
                                    </div>
                                    <div class="span4 form-group">
                                        <input required type="text" class="form-control" name="text_Serie" id="text_Serie" placeholder="Número de Serie" data-rule="minlen:4" data-msg="Campo requerido: Serie" />
                                        <div class="validation"></div>
                                    </div>
                                    <div class="span4 form-group">
                                        <input required type="text" class="form-control" name="text_TipoMotor" id="text_TipoMotor" placeholder="Tipo de motor" data-rule="minlen:4" data-msg="Campo requerido: Tipo de Motor" />
                                        <div class="validation"></div>
                                    </div>
                                    <div class="container">
                                        <div class="span4 form-group">
                                            <input required type="text" class="form-control" name="text_FechaAdquisicion" id="text_FechaAdquisicion" placeholder= "Fecha de Adquisicion (YYYY/MM/DD)" data-rule="minlen:4" data-msg="Campo requerido: Fecha de adquisición" />
                                            <div class="validation"></div>

                                            <input required type="text" class="form-control" name="text_Seguro" id="text_Seguro" placeholder= "Monto Asegurado" data-rule="minlen:4" data-msg="Campo requerido: Monto asegurado" />
                                            <div class="validation"></div>

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
                                                <select id="cbx_Garage" name="cbx_Garage" required></select>
                                            </div>
                                        </div>


                                        <div class="span4 form-group">
                                            <div class="col-md-4">

                                                <!--div class="card mb-4 box-shadow">
                                                  <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22288%22%20height%3D%22226%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20288%20226%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_162e9996169%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_162e9996169%22%3E%3Crect%20width%3D%22288%22%20height%3D%22226%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2296.828125%22%20y%3D%22119.2390625%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="height: : :100px; width: -10%; display: block;">
                                                  <div class="card-body"></div>
                                                  <div>
                                                    <button type="button" class="btn btn-sm btn-outline-secondary">Agregar Foto</button>
                                                  </div>                   
                                                </div-->
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
                        <!--form method="post" enctype="multipart/form-data">
                          <input type="file" name="file"/><br/><br/>
                          <input type="submit" name="subirImagen" value="upload"/>
                        </form-->
                        <!--div id ="content">
                          <form method="post" enctype="multipart/form-data">
                            <input type="hidden" name="size" value="1000000">
                            <div>
                              <input type="file" name="image">
                            </div>
                            <div>
                              <input type="submit" name="upload" value="Subir imagen">
                            </div>
                          </form>
                        </div--> 
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




    <!-- Template Custom JavaScript File -->
    <script src="assets/js/custom.js"></script>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/insertarAutoEmpresa.js"></script>

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
