<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>


		<!-- Información sobre el documento -->
	
		<title>Mi perfil</title>
		<meta charset="UTF-8">
		<meta name="keywords" content="buscar, trabajo, empleo, salario">
		<meta name="description" content="Web para la busqueda de empleo">
		<meta name="author" content="Mingda Liu Zhang, Alejando Ruiz de la Cuadra, Carlos Herrero Lozano">
		<link rel="icon" href="images/logo2.png">
		<!--Fuente Ubuntu-->
		
		<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
	
		<!--CSS de la pagina-->
		
		<link rel="stylesheet" type="text/css" href="style/perfil_usuario.css">
		
		<!--<script type = "text/javascript" src ="script/myscript.js"></script>-->
		<link href="script/jquery-ui-1.11.2.custom/jquery-ui.css" rel="stylesheet">

		<script src="script/jquery-ui-1.11.2.custom/external/jquery/jquery.js"></script>
		<script src="script/jquery-ui-1.11.2.custom/jquery-ui.js"></script>
		
		<!--Text edit-->
		
		<link type="text/css" rel="stylesheet" href="script/plugin/edit/jquery-te-1.4.0.css">

		<script type="text/javascript" src="script/plugin/edit/jquery-te-1.4.0.min.js" charset="utf-8"></script>
		
		
		
	

    
	</head>
	
	
	<body>
		
	
			<!-- CABECERA-->
			
	
				<header>
				
					<div id = "cabecera-logo">
					
						<a href = "src/index-usuario.html">	
						
							<img class = "cabecera" src="images/logo.png" alt="Error en la imagen">    
					
							<h1 class = "cabecera">LAVORO</h1>
					
						</a>
				
					</div>
					
					<nav>
						<ul>
							<li id = "menu-empresa"><a href = "src/perfil-usuario.html">MI PERFIL</a></li>
							<li id = "menu-ofertas"><a href = "src/perfil-ofertas.html">MIS OFERTAS</a></li>
							<li id = "menu-buscar"><a href = "src/usuario-buscar-ofertas.html">BUSCAR OFERTAS</a></li>
						</ul>	
					</nav>
				
					<div id = "cabecera-sesion">
				
						<img class = "cabecera-sesion" src="images/famosos/gates.jpg" alt="Error en la imagen"> 
					
						<div id = "cabecera-sesion-men">
							<p class = "cabecera-sesion">Carlos Ruiz</p>
							<a href = "src/index.html">Cerrar sesión</a>
								
						</div>
						
					</div>
				
				</header>

				<!--MENU-->
			
			
				
			

			<!--CUERPO DE LA PAGINA-->
	
			<section> 
				
				<div id = "mi-empresa">
				
					<h4>MI PERFIL</h4>
				
					<div id = "informacion-empresa">
						
						<div id= "informacion-empresa-imagen">
										
							<img id = "imagen-empresa" src = "images/famosos/gates.jpg" alt = "Error en la imagen">
							<input type="file" name="picField" id="picField"  onchange="preview_2(this);" />
							<p>Para cambiar imagen seleccione un archivo</p><br>
							
						</div>
					
						<div id = "informacion-empresa-basica">
							
						
							<h5>Mis datos personales</h5>
						
							<form name="personal">
							<ul>
								<li>Nombre completo: <span id="span1" style="color:red;"></span><br><input id = "edit-nombre" type="text" name="nombre" value="Carlos Ruiz Escudero" tabindex="1"></li>
							
								<li>Fecha de nacimiento: <span id="span2" style="color:red;"></span><br><input id = "edit-empresa" type="text" name="empresa" value="23-03-1990" tabindex="2"></li>
							
								<li>Código postal: <span id="span3" style="color:red;"></span><br><input id = "edit-direccion" type="text" name="direccion" value="28920" tabindex="3"></li>
							
								<li>Población: <span id="span4" style="color:red;"></span><br><input id = "edit-ciudad" type="text" name="ciudad" value="Las Rozas" tabindex="4"></li>
								
								<li>Provincia: <span id="span5" style="color:red;"></span><br><input id = "edit-representante" type="text" name="representante" value="Madrid" tabindex="7"></li>
								
								<li>Teléfono: <span id="span6" style="color:red;"></span><br><input id = "edit-telefono" type="text" name="telefono" value="666 66 66 66" tabindex="5"></li>
							
								<li>E-Mail: <span id="span7" style="color:red;"></span><br><input id = "edit-email" type="text" name="correo" value="carlos_ruiz@gmail.com" tabindex="6"></li>
							
								
							
							
							</ul>							
							</form>			
							
						</div>
				
					</div>
					<div id="perfil_publico">
					<p id="CV_gestionatitulo">Publicidad del perfil</p>
					<form id="form_visibilidad">
					<input type="radio" name="sex" value="male" checked="checked">Visible
					
					<input type="radio" name="sex" value="female">No visible
					</form>
					</div>
					
					<div id = "informacion-empresa-descripcion">
						<h5>Descripción general</h5>
						<p>Asesor en negociación, debate y comunicación personal. Profesional con más de 20 años de carrera en diferentes puestos dentro de la empresa, especializado en a dirección comercial, las finanzas y la contabilidad. Acostumbrado a la orientación por objetivos y a trabajar bajo presión. En mis ratos libres hago deporte y colaboro en publicaciones web.</p> 
						<br>
						<h5>Formación</h5>
						
						<h6>Máster en Banca e Inversiones 1991-1993</h6>
						<p>Universidad Carlos III 1998-2000</p>
						
						<h6>Grado en Administración y Dirección de empresas</h6>
						<p>Universidad Complutense 2003-2014</p>
						
						<h6>National Account Manager</h6>
						<p>National Accounting Institute 1991-1993</p>
						
						
						<h5>Situación laboral y preferencias</h5>
						
						<h6>Situación laboral:</h6>
						<p>Estoy buscando empleo.</p>
						<h6>Puesto preferido:</h6>
						<p>Consultor en Business Intelligence.</p>
						<h6>Categorías preferidas:</h6>
						<p>Profesiones, artes y oficios(Fontanería).</p>
						<h6>Disponibilidad para viajar:</h6>
						<p>Depende de las condiciones.</p>
						<h6>Disponibilidad para cambiar de residencia:</h6>
						<p>Depende de las condiciones.</p>
						<h6>Destinos preferidos:</h6>
						<p>Andalucía.</p>
						
					</div>
					
					
					<div id = "dialog-button"><input type = "button" name = "vista-previa" value = "Vista Previa" id = "opener"></div >
					
					<div id="dialog" title="Vista Previa">
						
						<img id = "imagen-vista-previa" src = "default" alt = "Error en la imagen">
						
						<div id = "vista-previa-datos">
							
					  		<p id = "vista-previa-nombre"></p>
							<p id = "vista-previa-empresa"></p>
							<p id = "vista-previa-direccion"></p>
							<p id = "vista-previa-ciudad"></p>
							<p id = "vista-previa-telefono"></p>
							<p id = "vista-previa-email"></p>
							<p id = "vista-previa-representante"></p>	
							
						</div>
						
						<div id = "vista-previa-descripcion"></div>					
					
					</div>
				</div>
				
				<div id = "seguidores">
				
					<h5> Empresas a las que sigo </h5>
					
					<ul>
					
						<li>
							<img class = "seguidores-foto" src = "images/empresas/accenture.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Accenture</p></li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/acciona.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Acciona</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/atmira.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Atmira</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/bbva.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">BBVA</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/carrefour.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Carrrefour</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/cepsa.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Cepsa</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/CGI.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">CGI</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/entelgy.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Entelgy</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/hp.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">HP</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/inditex.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Inditex</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/indra.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Indra</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/infojobs.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Infojobs</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/leroy.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Lerov</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/lidl.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Lidl</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/mapfre.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Mapfre</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/orange.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Orange</p>
						</li>
						<li>	
							<img class = "seguidores-foto" src = "images/empresas/repsol.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Repsol</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/roca.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Roca</p>
						</li>
						<li>
							<img class = "seguidores-foto" src = "images/empresas/signo.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Signo</p>
						</li>
					
					</ul>
				
				</div>
					

			</section>

	
			<!--PIE DE PAGINA-->

			<footer>  
				<ul id="pie">
					<li> Copyright © jooglecam.com</li>
				 	<li><a href="#">Aviso legal	</a></li>
				 	<li><a href="#">Privacidad 	 </a></li>
				 	<li><a href="#">Política de cookies	</a></li>
				 	<li><a href="#">Accesibilidad  </a></li>
				 	<li><a href="#">Contacto </a></li>
				 	<li><a href="#">Ayuda  </a></li>
				</ul>
			</footer>
		
		<script type = "text/javascript" src ="script/perfil_usuario.js"></script>
		
		
	</body>

</html>