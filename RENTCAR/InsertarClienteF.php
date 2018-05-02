<?php
    session_start();
    if(isset($_SESSION["status"])==false){
    session_destroy();
    header("Location: login.php");
    }
?>	


	<!DOCTYPE html>
	<html lang="en" >
	<head>
		<!-- Mobile Specific Meta -->
	
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>RENTCAR</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/nice-select.css">					
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">			
			<link rel="stylesheet" href="css/owl.carousel.css">
			<link rel="stylesheet" href="css/main.css">
		</head>
		<body>

			 
			 <header id="header" id="home">
			    <div class="container">
			    	<div class="row align-items-center justify-content-between d-flex">
				      <div id="logo">
				        <a href="index.php"><img src="img/logo.png" alt="" title="" /></a>
				      </div>
				      <nav id="nav-menu-container">
				        <ul class="nav-menu">
				          <li class="menu-active"><a href="index.php">Inicio</a></li>                                        				          <li class="menu-has-children"><a href="">Vehiculos</a>
				            <ul>
				              <li><a href="VerAutos.php">Ver Todos</a></li>
				              <li><a href="VerAutos.php">Autos Rentas</a></li>
				              <li><a href="VerAutos.php">Autos Ventas</a></li>
				            </ul>
				          <li><a href="servicios.php">Servicios</a></li>
				          <li><a href="NuestroEquipo.php">Nuestro Equipo</a></li>
				          <li><a href="sucursal.php">Sucursales</a></li>
				           <li><a href="InsertarClienteF.php">Registrarse</a></li>

				          
				          
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
				      </nav><!-- #nav-menu-container -->		    		
			    	</div>
			    </div>
			  </header><!-- #header -->




			<!-- start banner Area -->

			<section class="banner-area relative" id="home">
				<div class="overlay overlay-bg"></div>	
				<div class="container">
					<div class="row fullscreen d-flex align-items-center justify-content-center">
						<div class="banner-content col-lg-7 col-md-6 ">
							<h6 class="text-white ">Registrate para brindarte un Mejor Servicio</h6>
							<h1 class="text-white text-uppercase">
								Porque nos importa brindarte un excelente servicio		
							</h1>
							<p class="pt-20 pb-20 text-white">
								RentCar una compañia que brinda los mejores servicios de renta y venta de vehiculos a nivel nacional somos la mejor empresa de renta,venta y mantenimiento de vehiculo.
							</p>
							
						</div>	<br><br><br>

						<div class="col-lg-4  col-md-20 header-right">

						
							
							    <div class="form-group">
							       	
							<form action="" id="Form_InsertarCliente" name="Form_InsertarCliente" method="post" role="form" class="contactForm">
							    
							    
							       		<div class="form-group">
							       	
							       		<input required class="form-control" type="text" name="text_PrimerNombre" id="text_PrimerNombre" placeholder="Primer Nombre">
                                        </div>
                                        <div class="form-group">
							       	
							       		<input required class="form-control" type="text" name="text_SegundoNombre" id="text_SegundoNombre" placeholder="Segundo Nombre">
							            </div>

                                      




							       		<div class="form-group row">
							        <div class="col-md-6 wrap-left">
								       	<input required class="form-control" type="text" name="text_PrimerApellido" id="text_PrimerApellido" placeholder="Primer Apellido">
							        </div>
							        <div class="col-md-6 wrap-right">
										
							       		<input  required class="form-control" type="text" name="text_SegundoApellido" id="text_SegundoApellido" placeholder="Segundo Apellido">
							        </div>
							    </div>
							         <div class="form-group row">
							        <div class="col-md-6 wrap-left">
								       		<input required class="form-control" type="text" name="text_Correo" id="text_Correo" placeholder="Correo">
							        </div>
							        <div class="col-md-6 wrap-right">
										
							       		<input required class="form-control" type="text" name="text_Telefono" id="text_Telefono" placeholder="Numero Telefono">
							        </div>
							    </div>
							     <div class="form-group row">
							        <div class="col-md-6 wrap-left">
								       		
							    	<input required class="form-control" type="text" name="text_Identidad" id="text_Identidad" placeholder="Ingrese Identidad">
							        </div>
							        <div class="col-md-6 wrap-right">
										
							       		<input required class="form-control" type="text" name="text_Rtn" id="text_Rtn" placeholder="RTN">
							        </div>
							    </div>
							      <div class="form-group">
                                        <select required type="text" id="cbx_SeleccioneGenero" name="cbx_SeleccioneGenero" class="form-control" placeholder="Seleccione Genero"  data-rule="minlen:4" data-msg="Seleccione un Genero">
                                                <option value='0'>Seleccione un Genero</option>
                                                <option value='1'>Femenino</option>
                                                <option value='2'>Masculino</option>
                                            </select>
                                           </div>
							       		
							       	<div class="form-group row">
							        <div class="col-md-6 wrap-left">
								       		<input  required class="form-control" type="text" name="text_NombreUsuario" id="text_NombreUsuario" placeholder="Usuario">
							        </div>
							        <div class="col-md-6 wrap-right">
										<input required class="form-control" type="password" name="text_UserPassword" id="text_UserPassword" placeholder="Contraseña">
							        </div>
							    </div>
							       		
							    							          	<div class="form-group row">
							        <div class="col-md-6 wrap-left">
								       		<input class="form-control" type="text" name="text_Departamento" id="text_Departamento"  placeholder="Departamento">
							        </div>
							        <div class="col-md-6 wrap-right">
										
							    	<input required class="form-control" type="text" name="text_Municipio" id="text_Municipio"  placeholder="Municipio">
							
							        </div>
							    </div>
								      	<div class="form-group row">
							        <div class="col-md-6 wrap-left">
								       		<input required class="form-control" type="text" name="text_Colonia" id="text_Colonia" placeholder="Colonia">
							        </div>
							        <div class="col-md-6 wrap-right">
										
							    		<input required class="form-control" type="text" name="text_Sector" id="text_Sector" placeholder="Sector">
							
							        </div>
							    </div>
							    <div class="form-group row">
							        <div class="col-md-6 wrap-left">
								       		<input required class="form-control" type="text" name="text_NumeroCasa" id="text_NumeroCasa" placeholder="Numero Vivienda">
							        </div>
							        <div class="col-md-6 wrap-right">
										
							    		<input required class="form-control" type="text" name="text_Sector" id="text_Sector" placeholder="Sector">
							
							        </div>
							    </div>
                                        
                               
                                                    <div class="form-group">
                                                    <input required="" id="text_Imagenruta" name="text_Imagenruta" placeholder="Imagen" >
                                                   
                                                    </div>

							    
							    	
							    
							    
							    
							    	
							    	<button type="submit" class="btn btn-default btn-lg btn-block text-center text-uppercase" name="btn_Guardar" id=btn_Guardar>Guardar</button>
							       	</div>
							       		<div class="form-group">
							    	
							    </div>
							 <div class="form-group">
							    
										
									</div>
							    </div>
							   
							 
							    </div>
							    <div class="form-group row">
							        <div class="col-md-12">
							            
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
			<!-- End banner Area -->	
			<script language="javascript">   
    //Imagen
    $("#File-Image").change(function(){
    var form = $("#Form_InsertarCliente")[0];
    var formData = new FormData(form);
    alert("Foto1");
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

			

		

			<script src="js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="js/vendor/bootstrap.min.js"></script>			
			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>			
  			<script src="js/easing.min.js"></script>			
			<script src="js/hoverIntent.js"></script>
			<script src="js/superfish.min.js"></script>	
			<script src="js/jquery.ajaxchimp.min.js"></script>
			<script src="js/jquery.magnific-popup.min.js"></script>	
			<script src="js/owl.carousel.min.js"></script>			
			<script src="js/jquery.sticky.js"></script>
			<script src="js/jquery.nice-select.min.js"></script>	
			<script src="js/waypoints.min.js"></script>
			<script src="js/jquery.counterup.min.js"></script>					
			<script src="js/parallax.min.js"></script>		
			<script src="js/mail-script.js"></script>	
			<script src="js/main.js"></script>	


<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/insertarCliente.js"></script>
		</body>
	</html>



