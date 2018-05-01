<?php
    session_start();
    if(isset($_SESSION["status"])==false){
        session_destroy();
        header("Location: login.php");
    }

    include("class/class-conexion.php");
    $conexion = new Conexion();
    //Obteniendo los cargo
    $query = "SELECT idcargo, descripcion FROM tbl_cargo ORDER BY descripcion;";
    $rescargo = $conexion->ejecutarConsulta($query);

    //Obteniendo los Empleado Superior
    $query = "SELECT e.idEmpleado,p.primerNombre, p.primerApellido FROM tbl_Empleado e
    INNER JOIN tbl_Persona p ON e.idPersona=p.idPersona
    ORDER BY p.primerNombre;";
    $resEmpleadoSuperior = $conexion->ejecutarConsulta($query);


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

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Insertar Empleado</title>
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
                        <a class="brand logo" href="index.html"><img src="assets/img/logo.png" alt=""></a>
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
                                    <li class="dropdown active">
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
                                <h3>Registro de Cliente</h3>
                                <p>
                                    Llena la información solicitada del empleado
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

                            <form action="" id="Form_InsertarEmpleado" name="Form_InsertarEmpleado" method="post" role="form" class="contactForm">
                                <div class="row">
                                    <div class="span4 form-group">
                                        <div class="span4 form-group">
                                            <input required type="text" class="form-control" name="text_PrimerNombre" id="text_PrimerNombre"  data-rule="minlen:4" placeholder="Primer Nombre" data-msg="PrimerNombre" />
                                            <input required type="text" class="form-control" name="text_SegundoNombre" id="text_SegundoNombre"  data-rule="minlen:4" placeholder="Segundo Nombre" data-msg="SegundoNombre" />
                                        </div>
                                        <div class="span4 form-group">
                                            <!--input type="text" class="form-control" name="text_Correo" id="text_Correo" placeholder="Ingrese Correo" data-rule="minlen:4" data-msg="Porfavor ingrese Correo"/>
                           <div class="validation"></div-->
                                            <div class="wrap-input100 validate-input m-b-16" data-validate = "Correo Requerido">
                                                <input required class="input100" type="email" name="text_Correo" id="text_Correo" placeholder="Correo" required autofocus>
                                                <span class="focus-input100"></span>
                                            </div>

                                            <input required type="text" class="form-control" name="text_Telefono" id="text_Telefono" placeholder="Ingrese Telefono" data-rule="minlen:4" data-msg="Porfavor ingrese Telefono" />
                                            <div class="validation"></div>


                                        </div>
                                        <div class="span4 form-group">
                                            <input required type="text" class="form-control" name="text_NombreUsuario" id="text_NombreUsuario" placeholder="Ingrese el Usuario"  data-rule="minlen:4" data-msg="Porfavor ingrese Identidad" />
                                            <div class="validation"></div>
                                            <input required type="password" class="form-control" name="text_UserPassword" id="text_UserPassword" placeholder="Ingrese el Password"  data-rule="minlen:4" data-msg="Porfavor ingrese Identidad" />

                                            <input required type="text" class="form-control" name="text_Departamento" id="text_Departamento" placeholder="Ingrese el Departamento"  data-rule="minlen:4" data-msg="Porfavor ingrese Telefono" />
                                            <div class="validation"></div>

                                            <input required type="text" class="form-control" name="text_Municipio" id="text_Municipio" placeholder="Ingrese el Municipio" data-rule="minlen:4" data-msg="Porfavor ingrese Telefono" />
                                            <div class="validation"></div>
                                        </div>
                                        <div class="span4 form-group">
                                            <div> 
                                                <select required id="cbx_Idcargo" name="cbx_Idcargo">
                                                    <option value='0'>Cargo</option>
                                                    <?php while($rowcargo = pg_fetch_array($rescargo)) { ?>
                                                    <option value="<?php echo $rowcargo[0]; ?>" ><?php echo $rowcargo[1]; ?> </option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                            <div> 
                                                <select required id="cbx_EmpleadoSuperior" name="cbx_EmpleadoSuperior">
                                                    <option value='0'>Empleado Superior</option>
                                                    <?php while($rowempleadosuperior = pg_fetch_array($resEmpleadoSuperior)) { ?>
                                                    <option value="<?php echo $rowempleadosuperior[0]; ?>" ><?php echo $rowempleadosuperior[1]." ".$rowempleadosuperior[2]; ?> </option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                            <select required type="text" id="cbx_SeleccioneGenero" name="cbx_SeleccioneGenero" class="form-control" placeholder="Seleccione Genero"  data-rule="minlen:4" data-msg="Seleccione un Genero">
                                                <option value='0'>Seleccione un Genero</option>
                                                <option value='1'>Femenino</option>
                                                <option value='2'>Masculino</option>
                                            </select>

                                        </div>

                                    </div>

                                    <div class="span4 form-group">

                                        <div class="span4 form-group">
                                            <input required type="text" class="form-control" name="text_PrimerApellido" id="text_PrimerApellido" placeholder="Primer Apellido" data-rule="minlen:4" data-msg="PrimerApellido" />
                                            <input required type="text" class="form-control" name="text_SegundoApellido" id="text_SegundoApellido" placeholder="Segundo Apellido" data-rule="minlen:4" data-msg="SegundoApellido" />
                                            <input required type="text" class="form-control" name="text_Identidad" id="text_Identidad" placeholder="Ingrese el Identidad"  data-rule="minlen:4" data-msg="Porfavor ingrese Identidad" />
                                            <div class="validation"></div>
                                            <input required type="date" class="form-control" name="text_FechaContratacion" id="text_FechaContratacion" placeholder="Ingrese Fecha Contratacion"  data-rule="minlen:4" data-msg="Porfavor ingrese Fecha Contratacion" />
                                            <div class="validation"></div>
                                            <input required type="date" class="form-control" name="text_FechaPromocion" id="text_FechaPromocion" placeholder="Ingrese Fecha Promocion"  data-rule="minlen:4" data-msg="Porfavor ingrese Fecha Promocion" />
                                            <div class="validation"></div>
                                            <!--input required type="text" class="form-control" name="text_Imagenruta" id="text_Imagenruta" placeholder="Ingrese la imagen"  data-rule="minlen:4" data-msg="Porfavor ingrese Identidad" />
                                            <div class="validation"></div-->

                                            <div class="form-group">
                                                <input  type="hidden" id="text_Imagenruta" name="text_Imagenruta">
                                                <label for="File-Image">Ingrese su imagen</label>
                                                <input type="file" class="form-control-file" id="File-Image" name="file" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span4 form-group">
                                        <div class="span4 form-group">


                                            <input required type="text" class="form-control" name="text_Colonia" id="text_Colonia" placeholder="Ingrese la Colonia" data-rule="minlen:4" data-msg="Porfavor ingrese Telefono" />
                                            <div class="validation"></div>

                                            <input required type="text" class="form-control" name="text_Sector" id="text_Sector" placeholder="Ingrese el Sector"  data-rule="minlen:4" data-msg="Porfavor ingrese Telefono" />
                                            <div class="validation"></div>

                                            <input required type="text" class="form-control" name="text_NumeroCasa" id="text_NumeroCasa"  placeholder="Ingrese numero de Vivienda" data-rule="minlen:4" data-msg="Porfavor ingrese Telefono" />
                                            <div class="validation"></div>
                                        </div>
                                    </div>
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
                                <div class="validation"></div>
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
<script src="js/insertarEmpleado.js"></script>

<script language="javascript">   
    //Imagen
    $("#File-Image").change(function(){
    var form = $("#Form_InsertarEmpleado")[0];
    var formData = new FormData(form);
    $.ajax({
        url:"ajax/gestionar-imagen.php",
        type:"POST",
        dataType:"JSON",
        contentType: false,
        processData: false,
        data: formData,
        success:function(respuesta){
            if(respuesta.status){
                $("#text_Imagenruta").val("uploaded/profile/"+respuesta.ruta);
            }
            else
            {
                alert(respuesta.mensaje);
            }
        },
        error: function(error){
            console.log(error);
        }
    });
});
</script>

</body>
</html>