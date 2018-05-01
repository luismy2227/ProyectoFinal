
	<?php
    session_start();
    if(isset($_SESSION["status"])==false){
        session_destroy();
        header("Location: login.php");
    }
    ?>



	<!DOCTYPE html>
	<html lang="zxx" class="no-js">
	<head>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="codepixer">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
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
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								Nuestro Equipo			
							</h1>	
							<p class="text-white link-nav"><a href="index.php">Inicio </a>  <span class="lnr lnr-arrow-right"></span>  <a href="team.html"> Equipo</a></p>
						</div>											
					</div>
				</div>
			</section>
			<!-- End banner Area -->	

			<!-- Start team Area -->
			<section class="team-area section-gap team-page-teams" id="team">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-70 col-lg-8">
							<div class="title text-center">
								<h1 class="mb-10">Equipo con la Mejor Experiencia</h1>
								<p>Contamos con el mejor personal altamente capacitado.</p>
							</div>
						</div>
					</div>						
					<div class="row justify-content-center d-flex align-items-center">
						<div class="col-md-3 single-team">
						    <div class="thumb">
						        <img class="img-fluid" src="img/pages/t1.jpg" alt="">
						        <div class="align-items-center justify-content-center d-flex">
									<a href="www.facebook.com"><i class="fa fa-facebook"></i></a>
									<a href="#"><i class="fa fa-twitter"></i></a>
									<a href="#"><i class="fa fa-linkedin"></i></a>
						        </div>
						    </div>
						    <div class="meta-text mt-30 text-center">
							    <h4>Cristian Joel</h4>
							    <p>Gerente general</p>									    	
						    </div>
						</div>
						<div class="col-md-3 single-team">
						    <div class="thumb">
						        <img class="img-fluid" src="img/pages/t2.jpg" alt="">
						        <div class="align-items-center justify-content-center d-flex">
									<a href="#"><i class="fa fa-facebook"></i></a>
									<a href="#"><i class="fa fa-twitter"></i></a>
									<a href="#"><i class="fa fa-linkedin"></i></a>
						        </div>
						    </div>
						    <div class="meta-text mt-30 text-center">
							    <h4>Bradley Cooper</h4>
							    <p>Mecanico</p>			    	
						    </div>
						</div>	
						<div class="col-md-3 single-team">
						    <div class="thumb">
						        <img class="img-fluid" src="img/pages/t3.jpg" alt="">
						        <div class="align-items-center justify-content-center d-flex">
									<a href="#"><i class="fa fa-facebook"></i></a>
									<a href="#"><i class="fa fa-twitter"></i></a>
									<a href="#"><i class="fa fa-linkedin"></i></a>
						        </div>
						    </div>
						    <div class="meta-text mt-30 text-center">
							    <h4>Alejandro Lopez</h4>
							    <p>Recursos Humanos</p>			    	
						    </div>
						</div>	
						<div class="col-md-3 single-team">
						    <div class="thumb">
						        <img class="img-fluid" src="img/pages/t4.jpg" alt="">
						        <div class="align-items-center justify-content-center d-flex">
									<a href="#"><i class="fa fa-facebook"></i></a>
									<a href="#"><i class="fa fa-twitter"></i></a>
									<a href="#"><i class="fa fa-linkedin"></i></a>
						        </div>
						    </div>
						    <div class="meta-text mt-30 text-center">
							    <h4>Lena Amador</h4>
							    <p>TeleMercadeo</p>			    	
						    </div>
						</div>		
						<div class="col-md-3 single-team">
						    <div class="thumb">
						        <img class="img-fluid" src="img/pages/t8.png" alt="">
						        <div class="align-items-center justify-content-center d-flex">
									<a href="#"><i class="fa fa-facebook"></i></a>
									<a href="#"><i class="fa fa-twitter"></i></a>
									<a href="#"><i class="fa fa-linkedin"></i></a>
						        </div>
						    </div>
						    <div class="meta-text mt-30 text-center">
							    <h4>Roberto Ezpinoza</h4>
							    <p>Ejecutivo en Ventas</p>									    	
						    </div>
						</div>
						<div class="col-md-3 single-team">
						    <div class="thumb">
						        <img class="img-fluid" src="img/pages/t5.jpg" alt="">
						        <div class="align-items-center justify-content-center d-flex">
									<a href="#"><i class="fa fa-facebook"></i></a>
									<a href="#"><i class="fa fa-twitter"></i></a>
									<a href="#"><i class="fa fa-linkedin"></i></a>
						        </div>
						    </div>
						    <div class="meta-text mt-30 text-center">
							    <h4>Fabricio Ismael</h4>
							    <p>Programador</p>			    	
						    </div>
						</div>	
						<div class="col-md-3 single-team">
						    <div class="thumb">
						        <img class="img-fluid" src="img/pages/t6.jpg" alt="">
						        <div class="align-items-center justify-content-center d-flex">
									<a href="#"><i class="fa fa-facebook"></i></a>
									<a href="#"><i class="fa fa-twitter"></i></a>
									<a href="#"><i class="fa fa-linkedin"></i></a>
						        </div>
						    </div>
						    <div class="meta-text mt-30 text-center">
							    <h4>Juan Carlos</h4>
							    <p>Vendedor Automotriz</p>			    	
						    </div>
						</div>	
						<div class="col-md-3 single-team">
						    <div class="thumb">
						        <img class="img-fluid" src="img/pages/t7.png" alt="">
						        <div class="align-items-center justify-content-center d-flex">
									<a href="#"><i class="fa fa-facebook"></i></a>
									<a href="#"><i class="fa fa-twitter"></i></a>
									<a href="#"><i class="fa fa-linkedin"></i></a>
						        </div>
						    </div>
						    <div class="meta-text mt-30 text-center">
							    <h4>David Figueroa</h4>
							    <p>Marketing</p>			    	
						    </div>
						</div>															
					</div>
				</div>	
			</section>
			<!-- End team Area -->					


			<!-- End footer Area -->		

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
		</body>
	</html>
