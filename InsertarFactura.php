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
                  <a href="index.html">Inicio</a>
                </li>
                <li class="dropdown">
                  <a href="#">Vehículos</a>
                  <ul class="dropdown-menu">
                    <li><a href="overview.html">Ver Todo</a></li>
                    <li><a href="scaffolding.html">Renta</a></li>
                    <li><a href="base-css.html">Venta</a></li>
                    <li><a href="components.html">Promociones</a></li>
                    
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
  <p>
                                  Modulo Factura Renta
                                </p>
                            <form action="" id="Form_InsertarFactura" name="Form_InsertarFactura method="post" role="form" class="contactForm">
                                <div class="row">
                                    <div class="span4 form-group">
                                         <div class="span4 form-group">
                               <input type="text" class="form-control" name="text_Idfactura" id="text_Idfactura" placeholder="Id Factura" data-rule="minlen:4" data-msg="Campo requerido: Id Factura" />
                                        <div class="validation"></div>

                                        <input type="text" class="form-control" name="text_Fechafactura" id="text_Fechafactura" placeholder="Fecha Facturacion (YYYY/MM/DD)" data-rule="minlen:4" data-msg="Campo requerido: Fecha Facturacion" />
                                        <div class="validation"></div>

                                        <input type="text" class="form-control" name="text_Cantidad" id="text_Cantidad" placeholder="Cantidad" data-rule="minlen:4" data-msg="Campo requerido: Cantidad" />
                                        <div class="validation"></div>
               
                <input type="text" class="form-control" name="text_Descuento" id="text_Descuento" placeholder="Ingrese Descuento" data-rule="minlen:4" data-msg="Porfavor ingrese Descuento" />
                <div class="validation"></div>
   
              
                              </div>
                              <div class="span4 form-group">
                                <input type="text" class="form-control" name="text_Impuesto" id="text_Impuesto" placeholder="Ingrese el Impuesto"  data-rule="minlen:4" data-msg="Porfavor ingrese Impuesto" />
                <div class="validation"></div>
                 <input type="password" class="form-control" name="text_Monto" id="text_Monto" placeholder="Ingrese el Monto"  data-rule="minlen:4" data-msg="Porfavor ingrese Monto" />
                                
                                <input type="text" class="form-control" name="text_FormaPago" id="text_FormaPago" placeholder="Ingrese la Forma de Pago"data-rule="minlen:4" data-msg="Porfavor ingrese Forma Pago" />
                                       <div class="validation"></div>

                <input type="text" class="form-control" name="text_FechaReserva" id="text_FechaReserva" placeholder="Ingrese la Fecha Reserva" data-rule="minlen:4" data-msg="Porfavor ingrese Fecha Reserva" />
                <div class="validation"></div>
                <input type="text" class="form-control" name="text_FechaEntrega" id="text_FechaEntrega" placeholder="Ingrese la Fecha Entrega" data-rule="minlen:4" data-msg="Porfavor ingrese Fecha Entrega" />

             
                <div class="validation"></div>
                   <input type="text" class="form-control" name="text_FechaDevolucion" id="text_FechaDevolucion" placeholder="Ingrese la Fecha Devolucion" data-rule="minlen:4" data-msg="Porfavor ingrese Fecha Devolucion" />
                <div class="validation"></div>
                              </div>
                            
                
                                    </div>
                         
                                    <div class="span4 form-group">
                                      
              <div class="span4 form-group">
                                <input type="text" class="form-control" name="text_Mora" id="text_Mora" placeholder="Valor Mora" data-rule="minlen:4" data-msg="Campo requerido: Mora" />
                                        <div class="validation"></div>

                                        <input type="text" class="form-control" name="text_Total" id="text_Total" placeholder="Total Factura" data-rule="minlen:4" data-msg="Campo requerido: Total" />
                                        <div class="validation"></div>

                                        <input type="text" class="form-control" name="text_Anticipo" id="text_Anticipo" placeholder="Anticipo" data-rule="minlen:4" data-msg="Campo requerido: Anticipo" />
                                        <div class="validation"></div>
                                      <select type="text" id="cbx_SeleccioneDescuento" name="cbx_SeleccioneDescuento" class="form-control" placeholder="Seleccione Descuento"  data-rule="minlen:4" data-msg="Seleccione un Descuento">
                                  <option value='0'>Seleccione un Descuento</option>
                                 
                                </select>


                <input type="text" class="form-control" name="text_FechaDescuento" id="text_FechaDescuento" placeholder="Ingrese Fecha Descuento"  data-rule="minlen:4" data-msg="Porfavor ingrese Fecha Descuento (YYYYMMDD)" />
                <div class="validation"></div>

                <input type="text" class="form-control" name="text_EstadoDescuento" id="text_EstadoDescuento"  placeholder="Ingrese Estado del Descuento" data-rule="minlen:4" data-msg="Porfavor ingrese Estado Descuento " />
                <div class="validation"></div>

                <input type="text" class="form-control" name="text_DescripcionDescuento" id="text_DescripcionDescuento"  placeholder="Ingrese Descripcion Descuento" data-rule="minlen:4" data-msg="Porfavor ingrese Descripcion Descuento " />
                <div class="validation"></div>
                 <input type="text" class="form-control" name="text_HoraEntrega" id="text_HoraEntrega" placeholder="Ingrese la Hora Entrega"  data-rule="minlen:4" data-msg="Porfavor ingrese Hora Entrega" />
                <div class="validation"></div>
                              </div>
                            </div>
                            <div class="span4 form-group">
    <div class="span4 form-group">
                

                <input type="text" class="form-control" name="text_HoraDevolucion" id="text_HoraDevolucion" placeholder="Ingrese la Hora Devolucion" data-rule="minlen:4" data-msg="Porfavor ingrese Hora Devolucion" />
                <div class="validation"></div>
                 <input type="text" class="form-control" name="text_Observaciones" id="text_Observaciones" placeholder="Ingrese la Observacion" data-rule="minlen:4" data-msg="Porfavor ingrese Observacion" />
                <div class="validation"></div>


                                    </div>
</div>
</div>
                                </div>
                                <div class="span4 form-group">
                                  <p>
                                  Modulo Factura Venta
                                </p>
<input type="text" class="form-control" name="text_IdfacturaV" id="text_IdfacturaV" placeholder="Id Factura Venta" data-rule="minlen:4" data-msg="Campo requerido: Id Factura Venta" />
                                        <div class="validation"></div>
                                    <input type="text" class="form-control" name="text_ValorVenta" id="text_ValorVenta" placeholder="Ingrese el Valor Venta"  data-rule="minlen:4" data-msg="Porfavor ingrese Valor" />
                <div class="validation"></div>
                 <input type="password" class="form-control" name="text_Impuesto" id="text_Impuesto" placeholder="Ingrese el Impuesto Venta"  data-rule="minlen:4" data-msg="Porfavor ingrese Impuesto Venta" />
               
                                      
  <select type="text" id="cbx_SeleccioneDescuento" name="cbx_SeleccioneDescuento" class="form-control" placeholder="Seleccione Descuento"  data-rule="minlen:4" data-msg="Seleccione un Descuento">
                                  <option value='0'>Seleccione un Descuento</option>
                                 
                                </select>
                                   <input type="text" class="form-control" name="text_ValorDescuento" id="text_ValorDescuento" placeholder="Valor Descuento" data-rule="minlen:4" data-msg="Campo requerido: Valor" />
                                        <div class="validation"></div>

                   <input type="text" class="form-control" name="text_FechaVenta" id="text_FechaVenta" placeholder="Fecha Venta (YYYY/MM/DD)" data-rule="minlen:4" data-msg="Campo requerido: Fecha Venta" />
                                        <div class="validation"></div>

                                        <input type="text" class="form-control" name="text_CantidadV" id="text_CantidadV" placeholder="Cantidad" data-rule="minlen:4" data-msg="Campo requerido: Cantidad" />
                                        <div class="validation"></div>
                                 <input type="text" class="form-control" name="text_Observaciones" id="text_Observaciones" placeholder="Ingrese la Observacion" data-rule="minlen:4" data-msg="Porfavor ingrese Observacion" />
                <div class="validation"></div>
                                    </div>
                                     <div class="span4 form-group">
                                  <p>
                                  Modulo Factura Mantenimiento
                                </p>
<input type="text" class="form-control" name="text_IdfacturaM" id="text_IdfacturaM" placeholder="Id Factura Mantenimiento" data-rule="minlen:4" data-msg="Campo requerido: Id Factura Mantenimiento" />
                                        <div class="validation"></div>
                                    <input type="text" class="form-control" name="text_ValorMantenimiento" id="text_ValorMantenimiento" placeholder="Ingrese el Valor Mantenimiento"  data-rule="minlen:4" data-msg="Porfavor ingrese Valor " />
                <div class="validation"></div>
                 <input type="text" class="form-control" name="text_ImpuestoM" id="text_ImpuestoM" placeholder="Ingrese el Impuesto Mantenimiento"  data-rule="minlen:4" data-msg="Porfavor ingrese Impuesto Mantenimiento" />
               
                                      
  <select type="text" id="cbx_SeleccioneDescuento" name="cbx_SeleccioneDescuento" class="form-control" placeholder="Seleccione Descuento"  data-rule="minlen:4" data-msg="Seleccione un Descuento">
                                  <option value='0'>Seleccione un Descuento</option>
                                 
                                </select>
                                 
  <input type="text" class="form-control" name="text_ValorDescuento" id="text_ValorDescuento" placeholder="Valor Descuento" data-rule="minlen:4" data-msg="Campo requerido: Valor" />
                                        <div class="validation"></div>
                   <input type="text" class="form-control" name="text_FechaIngresoMantenimiento" id="text_FechaIngresoMantenimiento" placeholder="Fecha Ingreso Mantenimiento (YYYY/MM/DD)" data-rule="minlen:4" data-msg="Campo requerido: Fecha Ingreso Mantenimiento" />
                                        <div class="validation"></div>

                                         <input type="text" class="form-control" name="text_FechaSalidaMantenimiento" id="text_FechaSalidaMantenimiento" placeholder="Fecha Salida Mantenimiento (YYYY/MM/DD)" data-rule="minlen:4" data-msg="Campo requerido: Fecha Salida Mantenimiento" />
                                        <div class="validation"></div>


                                      
                                 <input type="text" class="form-control" name="text_Observaciones" id="text_Observaciones" placeholder="Ingrese la Observacion" data-rule="minlen:4" data-msg="Porfavor ingrese Observacion" />
                <div class="validation"></div>

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