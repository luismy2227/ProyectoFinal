	
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
								Vehiculos				
							</h1>	
							<p class="text-white link-nav"><a href="inicio.php">Inico </a>  <span class="lnr lnr-arrow-right"></span>  <a href="VerAutos.php"> Vehiculos</a></p>
						</div>											
					</div>
				</div>
			</section>
			<!-- End banner Area -->	

			<!-- Start home-about Area -->
			<section class="home-about-area" id="about">
				<div class="container-fluid">				
					<div class="row justify-content-center align-items-center">
						<div class="col-lg-6 no-padding home-about-left">
							
						</div>
						<div class="col-lg-6 no-padding home-about-right">
							<h1> <br>
							</h1>
							<p>
								<span></span>
							</p>
							<p>
								
							</p>
							
						</div>
					</div>
				</div>	
			</section>
			<!-- End home-about Area -->	
  <div  class="container">
            <?php
              echo '<input type="hidden" id="txt_idVehiculo" value="'.$_GET['id'].'">';
              //echo $_GET['id'];
            ?>
            <ul>
                <div id="carros" name="carros" class="row"></div>
            </ul>
        </div>
			<!-- Start feature Area -->
			<section class="feature-area section-gap" id="service">
				<div class="container">
					<div class="row d-flex justify-content-center">
						
			

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
<script src="js/verAutoSeleccionado.js"></script>

		</body>
	</html>
