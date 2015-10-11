<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>


		<!-- InformaciÃ³n sobre el documento -->
	
		<title>Practica final: Inicio empresa</title>
		
		<meta charset="UTF-8">
		<meta name="keywords" content="buscar, trabajo, empleo, salario">
		<meta name="description" content="Web para la busqueda de empleo">
		<meta name="author" content="Mingda Liu Zhang, Alejando Ruiz de la Cuadra, Carlos Herrero Lozano">
	
		<!--Fuente Ubuntu-->
		
		<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
	
		<!--CSS de la pagina-->
		<style type="text/css" >
		<%@include file="style/index-empresa.css"%>
		</style>
		
		
		<!--SCRIPT de la pagina-->
		<link href="../script/jquery-ui-1.11.2.custom/jquery-ui.css" rel="stylesheet">
		
		<!--JQUERY-->

		<script src="../script/jquery-ui-1.11.2.custom/external/jquery/jquery.js"></script>
		<script src="../script/jquery-ui-1.11.2.custom/jquery-ui.js"></script>
		
		
		<!--CSS del menu en forma de carousel-->
		
		<link rel="stylesheet" type="text/css" href="../script/plugin/slick/slick.css"/>
		
		<!--CSS redes sociales-->
		
			<link rel="stylesheet" type="text/css" href="../script/plugin/circle/css/common.css" />
	        <link rel="stylesheet" type="text/css" href="../script/plugin/circle/css/style6.css" />
			<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700' rel='stylesheet' type='text/css' />
			<script type="text/javascript" src="../script/plugin/circle/js/modernizr.custom.79639.js"></script>
			
			
	        <link rel="stylesheet" type="text/css" href="../style/formacion/style_common.css" />
	        <link rel="stylesheet" type="text/css" href="../style/formacion/style10.css" />
	        <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
			
    
	</head>
	
	
	<body>
		
	
			<!-- CABECERA-->
	
			<header>
				
					<div id = "cabecera-logo">
					
						<a href="#">	
						
							<img class = "cabecera" src="images/logo.png" alt="Error en la imagen">    
					
							<h1 class = "cabecera">LAVORO</h1>
					
						</a>
				
					</div>
					
					<nav>
						<ul>
							<li id = "menu-empresa"><a href = "mi-empresa.jsp">MI EMPRESA</a></li>
							<li id = "menu-ofertas"><a href = "empresa-mis-ofertas.jsp">MIS OFERTAS</a></li>
						</ul>	
					</nav>
				
					<div id = "cabecera-sesion">
				
						<img class = "cabecera-sesion" src="images/index/microsoft.jpg" alt="Error en la imagen"> 
					
						<div id = "cabecera-sesion-men">
							<p class = "cabecera-sesion">Microsoft Inc.</p>
							<a href = "index.jsp">Cerrar sesiÃ³n</a>
								
						</div>
						
					</div>
				
				</header>

			<!--MENU-->
	
			

			<!--CUERPO DE LA PAGINA-->
	
				<section> 

					<div id = "buscar">

						<div id = "buscar-empleo">

							<p>Busco trabajo en...</p>
							<input type="text" name="empleo" placeholder = "Ingeniero informatico, Enfermera, Profesor, ..." tabindex="1">

						</div>

						<div id = "buscar-provincia">

							<p>Provincia:</p>

							<select name="provincia" id = "provincia" tabindex ="3">
								<option value='0'>(Seleccionar)</option>
								<option value='2'>Ãlava</option>
								<option value='3'>Albacete</option>
								<option value='4'>Alicante/Alacant</option>
								<option value='5'>AlmerÃ­a</option>
								<option value='6'>Asturias</option>
								<option value='7'>Ãvila</option>
								<option value='8'>Badajoz</option>
								<option value='9'>Barcelona</option>
								<option value='10'>Burgos</option>
								<option value='11'>CÃ¡ceres</option>
								<option value='12'>CÃ¡diz</option>
								<option value='13'>Cantabria</option>
								<option value='14'>CastellÃ³n/CastellÃ³</option>
								<option value='15'>Ceuta</option>
								<option value='16'>Ciudad Real</option>
								<option value='17'>CÃ³rdoba</option>
								<option value='18'>Cuenca</option>
								<option value='19'>Girona</option>
								<option value='20'>Las Palmas</option>
								<option value='21'>Granada</option>
								<option value='22'>Guadalajara</option>
								<option value='23'>GuipÃºzcoa</option>
								<option value='24'>Huelva</option>
								<option value='25'>Huesca</option>
								<option value='26'>Illes Balears</option>
								<option value='27'>JaÃ©n</option>
								<option value='28'>A CoruÃ±a</option>
								<option value='29'>La Rioja</option>
								<option value='30'>LeÃ³n</option>
								<option value='31'>Lleida</option>
								<option value='32'>Lugo</option>
								<option value='33'>Madrid</option>
								<option value='34'>MÃ¡laga</option>
								<option value='35'>Melilla</option>
								<option value='36'>Murcia</option>
								<option value='37'>Navarra</option>
								<option value='38'>Ourense</option>
								<option value='39'>Palencia</option>
								<option value='40'>Pontevedra</option>
								<option value='41'>Salamanca</option>
								<option value='42'>Segovia</option>
								<option value='43'>Sevilla</option>
								<option value='44'>Soria</option>
								<option value='45'>Tarragona</option>
								<option value='46'>Santa Cruz de Tenerife</option>
								<option value='47'>Teruel</option>
								<option value='48'>Toledo</option>
								<option value='49'>Valencia/ValÃ©ncia</option>
								<option value='50'>Valladolid</option>
								<option value='51'>Vizcaya</option>
								<option value='52'>Zamora</option>
								<option value='53'>Zaragoza</option>
							</select>

						</div>

						<div id = "buscar-botones">

							<input class = "buscar" name='buscar' type="button" value="BUSCAR">
							<br>
							<a href = "busqueda-empresa.jsp">BUSQUEDA AVANZADA</a>

						</div>



					</div>	

					<div id = "descripcion">

						<video controls id = "descripcion-video" width = "740px" poster = "../images/index/video-poster.jpg">
							<source src="../images/index/motivacion.mp4" type="video/mp4">
							Your browser does not support HTML5 video.
						</video>

						<div id = "descripcion-img">

							<div class="main"> 
				                <!-- TENTH EXAMPLE -->
				                <div class="view view-tenth">
				                    <img src="../images/index/formacion.jpg" alt = "Error en la imagen">
				                    <div class="mask">
				                        <h2>Cursos de formaciÃ³n</h2>
				                        <p>Adquieren nuevos conocimientos, destrezas y habilidades. Con una disponibilidad diversa de formaciones, elige la que mejor se adapte y alcanza el trabajo deseado. </p>
				                        <a href="http://www.lectiva.com/" class="info">MÃ¡s informaciÃ³n</a>
				                    </div>
				                </div>
							</div>
							<a href = "#"><p class = "descripcion-img">Entra en el Lavoro para encontrar tu prÃ³ximo trabajo o Ãºnicamente para darte a conocer en el mercado laboral. Para cualquier consulta telefÃ³nica, llama al 900 150 503. AtenciÃ³n telefÃ³nica de lunes a viernes, de 09:00 a 21:00.</p></a>

						</div>




					</div>

					<div id = "topvisited">

						<div id = "topvisited-tit">

							<h4>EMPRESAS MAS VISITADAS ESTA SEMANA</h4>

							<p id = "tit-slick">General</p>

						</div>

						<div class="your-class">
						  	<div><img class = "top-visited" src="../images/index/elcorteingles.jpg" alt="Error en la imagen"><p class = "top-visited">El Corte InglÃ©s</p></div>
						  	<div><img class = "top-visited" src="../images/index/bankia.jpg" alt="Error en la imagen"><p class = "top-visited">Bankia</p></div>
						  	<div><img class = "top-visited" src="../images/index/microsoft.jpg" alt="Error en la imagen"><p class = "top-visited">Microsoft</p></div>
							<div><img class = "top-visited" src="../images/index/repsol.jpg" alt="Error en la imagen"><p class = "top-visited">Repsol</p></div>
							<div><img class = "top-visited" src="../images/index/inditex.jpg" alt="Error en la imagen"><p class = "top-visited">Inditex</p></div>
						 	<div><img class = "top-visited" src="../images/index/bankia.jpg" alt="Error en la imagen"><p class = "top-visited">Bankia</p></div>
							<div><img class = "top-visited" src="../images/index/bankinter.jpg" alt="Error en la imagen"><p class = "top-visited">Bankinter</p></div>
						  	<div><img class = "top-visited" src="../images/index/sabadell.jpg" alt="Error en la imagen"><p class = "top-visited">Sabadell</p></div>
						  	<div><img class = "top-visited" src="../images/index/santander.jpg" alt="Error en la imagen"><p class = "top-visited">Santander</p></div>
							<div><img class = "top-visited" src="../images/index/caixa.jpg" alt="Error en la imagen"><p class = "top-visited">Caixa</p></div>
							<div><img class = "top-visited" src="../images/index/bq.jpg" alt="Error en la imagen"><p class = "top-visited">BQ</p></div>
						 	<div><img class = "top-visited" src="../images/index/microsoft.jpg" alt="Error en la imagen"><p class = "top-visited">Microsoft</p></div>
							<div><img class = "top-visited" src="../images/index/lg.jpg" alt="Error en la imagen"><p class = "top-visited">LG</p></div>
							<div><img class = "top-visited" src="../images/index/oracle.jpg" alt="Error en la imagen"><p class = "top-visited">Oracle</p></div>
							<div><img class = "top-visited" src="../images/index/ibm.jpg" alt="Error en la imagen"><p class = "top-visited">IBM</p></div>
						</div>



					</div>

					<div id = "redes-sociales">

						<h4>SÃGUENOS EN LAS REDES SOCIALES</h4>

						<ul class="ch-grid">
							<li>
								<div class="ch-item ch-img-1">				
									<a href= "https://www.facebook.com/"><div class="ch-info-wrap">
										<div class="ch-info">
											<div class="ch-info-front ch-img-1"></div>
											<div class="ch-info-back" id = "facebook">
												<h3>Facebook</h3>
												<p>Ya somos 17.8K</p>
											</div>	
										</div>
									</div>
									</a>
								</div>
							</li>
							<li>
								<div class="ch-item ch-img-2">
									<a href = "https://www.twitter.com/"><div class="ch-info-wrap">
										<div class="ch-info">
											<div class="ch-info-front ch-img-2"></div>
											<div class="ch-info-back" id = "twitter">
												<h3>Twitter</h3>
												<p>Ya somos 34.3K</p>
											</div>
										</div>
									</div>
									</a>
								</div>
							</li>
							<li>
								<div class="ch-item ch-img-3">
									<a href="https://www.facebook.com/">
									<div class="ch-info-wrap">
										<div class="ch-info">
											<div class="ch-info-front ch-img-3"></div>
											<div class="ch-info-back" id = "google">
												<h3>Google+</h3>
												<p>Ya somos 4.1K</p>
											</div>
										</div>
									</div>
									</a>
								</div>
							</li>
						</ul>

					</div>


				</section>


				<!--PIE DE PAGINA-->

				<footer>  
					<ul id="pie">
						<li> Copyright Â© jooglecam.com</li>
					 	<li><a href="#">Aviso legal	</a></li>
					 	<li><a href="#">Privacidad 	 </a></li>
					 	<li><a href="#">PolÃ­tica de cookies	</a></li>
					 	<li><a href="#">Accesibilidad  </a></li>
					 	<li><a href="#">Contacto </a></li>
					 	<li><a href="#">Ayuda  </a></li>
					</ul>
				</footer>

			<script type = "text/javascript" src ="../script/index-empresa.js"></script>
			<script type="text/javascript" src="../script/plugin/slick/slick.min.js"></script>
			<script type ="text/javascript" src ="../script/popup-usuario.js"></script>
			<script type ="text/javascript" src ="../script/popup-empresa.js"></script>
			<script type ="text/javascript" src ="../script/popup-registro.js"></script>



			</body>

		</html>