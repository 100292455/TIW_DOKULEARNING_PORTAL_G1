<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>

		<!-- InformaciÃ³n sobre el documento -->
	
		<title>Practica final: Inicio</title>
		<meta charset="UTF-8">
		<meta name="keywords" content="buscar, trabajo, empleo, salario">
		<meta name="description" content="Web para la busqueda de empleo">
		<meta name="author" content="Mingda Liu Zhang, Alejando Ruiz de la Cuadra, Carlos Herrero Lozano">
		<link rel="icon" href="images/logo.png">

		<!--Fuente Ubuntu-->
		
		<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
	
		<!--CSS de la pagina-->
		
		<link rel="stylesheet" type="text/css" href="style/busqueda.css">
		
		<!--<script type = "text/javascript" src ="script/myscript.js"></script>-->
		
		
		<!--Incluimos el custom, jquery y jquery-iu-->
			<script src="script/jquery-ui-1.11.2.custom/external/jquery/jquery.js"></script>
			<script src="script/jquery-ui-1.11.2.custom/jquery-ui.min.js"></script>
			<link rel="stylesheet" href="script/jquery-ui-1.11.2.custom/jquery-ui.min.css">
	    
		<script>
		$(function() {
			var seleccion1 = false;
			
			var flag_estrella =false;
			
			var fav =false;
			
			
			/*MODIFICANDO ESTRELLA*/
			

			
			
			
			
			
			
			$("#salario_slider").slider({
				min: 0,
				max: 150000,
				step: 250,
				slide: function (event, ui) {
					$(this).parent().find("#salNumber").val(ui.value);
					},
					create: function(event, ui){
						$(this).slider('value',$(this).parent().find("#salNumber").val());
						}
						});
			$(".desplegar").mouseout(function(){
						$("#provincias").css("display","none")
						});
			$(".desplegar").mouseover(function(){
						$("#provincias").css("display","inline")
						});
			$("#provincias").mouseout(function(){
						$("#provincias").css("display","none")
						});
			
			/*MOUSEOVER*/

			
			
			$("#boton_filtro").click(function(){
				$("#oferta2").css("display","block")
				$("#oferta6").css("display","none")
				$("#oferta5").css("display","block")
				$("#oferta7").css("display","none")
				});
			

			
			
			
			$("#boton_filtro").click(function(){
				if (seleccion1==false) {
					$("#oferta2").css("display","block")
					$("#oferta5").css("display","block")
					$("#oferta6").css("display","none")
					$("#oferta7").css("display","none")
					seleccion1=true;

				}else{
					$("#oferta2").css("display","none")
					$("#oferta5").css("display","none")
					$("#oferta6").css("display","block")
					$("#oferta7").css("display","block")
					seleccion1=false;

				}
			});
			
			
			
			});
					

		
		</script>
	

    
	</head>
	
	
	<body>
		
	
			<!-- CABECERA-->
	
			<header>
				
				<a href="src/index.html">	
					
					<img class = "cabecera" src="images/logo.png" alt="Error en la imagen">    
				
					<h1 class = "cabecera">LAVORO</h1>
				
				</a>
				
					<p class = "cabecera1" id = "cabecera-empresa">EMPRESA</p>
					
					<p class = "cabecera">|</p>
						
					<p class = "cabecera1" id = "cabecera-usuario">PARTICULAR</p>
				
					<input class = "cabecera" name='registrar' type="button" value="REGISTRAR" id="popup-boton">
					
					
					<div id="dialog-form-1" title="Inicia sesiÃ³n con tu correo">
					  <p class="validateTips">Â¡Bienvenido empresa!</p>

					  <form >
						
					 	<fieldset class = "popup" id = "popup-empresa">
							
							<p>Correo:</p>
					    	<input type="text" name="email" id="email-1" placeholder="jane@smith.com" class="text ui-widget-content ui-corner-all">
							<p>ContraseÃ±a: <a href= "#">recuperar contraseÃ±a</a></p>
					      	<input type="password" name="password" id="password-1" placeholder="ContraseÃ±a" class="text ui-widget-content ui-corner-all">
					
							<a href = "src/formulario-empresa.html">Â¿Necesitas crear una cuenta?</a>

					      <!-- Allow form submission with keyboard without duplicating the dialog button -->
					      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
					    </fieldset>
					  </form>
					</div>
					
					<div id="dialog-form-2" title="Inicia sesiÃ³n con tu correo">
					  <p class="validateTips">Â¡Bienvenido usuario!</p>

					  <form >
						
					 	<fieldset class = "popup" id = "popup-usuario">
							
							<p>Correo:</p>
					    	<input type="text" name="email" id="email-2" placeholder="jane@smith.com" class="text ui-widget-content ui-corner-all">
							<p>ContraseÃ±a: <a href= "#">recuperar contraseÃ±a</a></p>
					      	<input type="password" name="password" id="password-2" placeholder="ContraseÃ±a" class="text ui-widget-content ui-corner-all">
					
							<a href = "src/formulario-usuario.html">Â¿Necesitas crear una cuenta?</a>

					      <!-- Allow form submission with keyboard without duplicating the dialog button -->
					      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
					    </fieldset>
					  </form>
					</div>
					
					<div id= "dialog-form-3" title="Crea una cuenta">
						<p class="validateTips">Â¡Bienvenido a Lavoro!</p>
						
						<p>Elige particular para registrar una cuenta nueva como trabajador, o elige empresa para registrar una cuenta como empresa</p>
					  
					</div>
					
			
			</header>

			<!--MENU-->
	
			

			<!--CUERPO DE LA PAGINA-->
	
			<section>
				
				<!--MENU DE BUSQUEDA-->
				<div id="busqueda_basica">
					<!--<div class="busqueda1">
						<p class="texto_campo">Provincia:</p>
					<input class="campo" type="text" name="provincia">
					</div>-->
					<!--<div id="interes" class="busqueda1 texto_blanco" >
						<p class="texto_campo">Categorias de interÃ©s:</p>
					<select class="campo" >
						<option value="volvo">AdministraciÃ³n PÃºblica</option>
						<option value="saab">Profesiones, Artes y Oficios</option>
						<option value="opel">Empleo privado</option>
						</select>
					</div>-->
					<div id="estudios" class="busqueda1 texto_blanco">
						<p class="texto_campo">Palabras clave:</p>
						<input class="campo" type="text" name="categorias" placeholder="Como por ejemplo: Software, Java, Consultor..." title="Introducir palabras clave">

					</div>
					
					<div id="provincias_in" class="busqueda1 texto_blanco" >
						<p  class="texto_campo">Provincias:</p>
									<img src="images/usuario/flecha.png" id="flecha" alt="flecha">

						<div class="campo desplegar" title="Selecciona al menos una provincia">	<p id="texto_prov">- Seleciones provincias -</p></div>					

							
						
					</div>
					<div id="provincias" class="desplegar" style="display:none;" >
					<form action="demo_form.asp" method="get" style="position: relative;">
							<div   class="prov">
								<input type="checkbox" name="provincia" value="">Albacete<br>
								<input type="checkbox" name="provincia" value="">Ãlava<br>
								<input type="checkbox" name="provincia" value="">Badajoz<br>
								<input type="checkbox" name="provincia" value="">Bizkaia<br>
								<input type="checkbox" name="provincia" value="">CÃ¡diz<br>
								<input type="checkbox" name="provincia" value="">Ciudad Real<br>
								<input type="checkbox" name="provincia" value="">Cuenca<br>
								<input type="checkbox" name="provincia" value="">Granada<br>
								<input type="checkbox" name="provincia" value="">Huesca<br>
								<input type="checkbox" name="provincia" value="">Lleida<br>
								<input type="checkbox" name="provincia" value="">MÃ¡laga<br>
								<input type="checkbox" name="provincia" value="">Ourense<br>
								<input type="checkbox" name="provincia" value="">Pontevedra<br>
								<input type="checkbox" name="provincia" value="">Sta C. Tenerife<br>
								<input type="checkbox" name="provincia" value="">Soria<br>
								<input type="checkbox" name="provincia" value="">Toledo<br>
								<input type="checkbox" name="provincia" value="">Zamora<br>
								<input type="checkbox" name="provincia" value="">Ceuta<br>
							</div>
							
							<div  class="prov">
								<input type="checkbox" name="provincia" value="">Alicante<br>
								<input type="checkbox" name="provincia" value="">Asturias<br>
								<input type="checkbox" name="provincia" value="">I. Baleares<br>
								<input type="checkbox" name="provincia" value="">Burgos<br>
								<input type="checkbox" name="provincia" value="">Cantabria<br>
								<input type="checkbox" name="provincia" value="">CÃ³rdoba<br>
								<input type="checkbox" name="provincia" value="">Gipuzkoa<br>
								<input type="checkbox" name="provincia" value="">Guadalajara<br>
								<input type="checkbox" name="provincia" value="">JaÃ©n<br>
								<input type="checkbox" name="provincia" value="">Lugo<br>
								<input type="checkbox" name="provincia" value="">Murcia<br>
								<input type="checkbox" name="provincia" value="">Palencia<br>
								<input type="checkbox" name="provincia" value="">La Rioja<br>
								<input type="checkbox" name="provincia" value="">Segovia<br>
								<input type="checkbox" name="provincia" value="">Tarragona<br>
								<input type="checkbox" name="provincia" value="">Valencia<br>
								<input type="checkbox" name="provincia" value="">Melilla<br>
							</div>
							<div  class="prov">
								<input type="checkbox" name="provincia" value="">AlmerÃ­a<br>
								<input type="checkbox" name="provincia" value="">Ãvila<br>
								<input type="checkbox" name="provincia" value="">Barcelona<br>
								<input type="checkbox" name="provincia" value="">CÃ¡ceres <br>
								<input type="checkbox" name="provincia" value="">CastellÃ³n<br>
								<input type="checkbox" name="provincia" value="">A CoruÃ±a<br>
								<input type="checkbox" name="provincia" value="">Girona<br>
								<input type="checkbox" name="provincia" value="">Huelva<br>
								<input type="checkbox" name="provincia" value="">LeÃ³n<br>
								<input type="checkbox" name="provincia" value="">Madrid<br>
								<input type="checkbox" name="provincia" value="">Navarra<br>
								<input type="checkbox" name="provincia" value="">Las Palmas<br>
								<input type="checkbox" name="provincia" value="">Salamanca<br>
								<input type="checkbox" name="provincia" value="">Sevilla<br>
								<input type="checkbox" name="provincia" value="">Teruel<br>
								<input type="checkbox" name="provincia" value="">Valladolid<br>
								<input type="checkbox" name="provincia" value="">Zaragoza<br>
							</div>
					</form>
					</div>
					
					<input id = "boton_busqueda" name='busqueda' type="button" value="BUSCAR" title="Inicar bÃºsqueda">

				</div>
				
				<!--http://www.w3schools.com/tags/att_input_checked.asp-->
				<div id="filtro">
					<p class="texto_campo" style="margin-bottom:10px;" title="Seleccion al menos una categorÃ­a">CategorÃ­as de interÃ©s:</p>

					<form>
						<input class="checks" type="checkbox" name="provincia" value="" id="op1">AdministraciÃ³n PÃºblica<br>
						<input class="checks" type="checkbox" name="provincia" value="" id="op2">Profesiones, Artes y Oficios<br>
						<input class="checks" type="checkbox" name="provincia" value="" id="op3">Empleo privado<br>
						
					</form><br><hr>
					
					
					
					
					<p class="texto_campo" style="margin-bottom:10px;" title="Selecciona el nivel de estudios">Nivel de estudios:</p>

					<select  id="estudios_campo">
						<option value="otros"> Sin especificar / Otros</option>
						<option value="eso"> ESO o equivalente</option>
						<option value="bachiller">Bachillerato / MÃ³dulo</option>
						<option value="universidad">Estudios universitarios</option>
						<option value="master">MÃ¡ster / Doctorado</option>
					</select>
					
					<br><br><br><hr>

					<p class="texto_campo" style="margin-bottom:10px;" title="Tipo de puesto">Tipo de puesto:</p>
					<form>
						<input class="checks" type="checkbox" name="provincia" value="">Junior<br>
						<input class="checks" type="checkbox" name="provincia" value="">Senior<br>
						<input class="checks" type="checkbox" name="provincia" value="">Analista<br>
						<input class="checks" type="checkbox" name="provincia" value="">Director<br>
						<input class="checks" type="checkbox" name="provincia" value="">Gerente<br>
						<input class="checks" type="checkbox" name="provincia" value="">Jefe<br>
						<input class="checks" type="checkbox" name="provincia" value="">Soporte tÃ©cnico<br>
						<input class="checks" type="checkbox" name="provincia" value="">Webmaster<br>
						<input class="checks" type="checkbox" name="provincia" value="">Administrador de Sistema<br>
						<input class="checks" type="checkbox" name="provincia" value="">Otro<br>
					</form><br><hr>
					<p class="texto_campo" style="margin-bottom:10px;" title="Tipo de jornada">Jornada:</p>
					<form><input  class="checks" type="checkbox" name="provincia" value="">Jornada completa<br>
						<input class="checks" type="checkbox" name="provincia" value="">Media jornada<br>
						<input class="checks" type="checkbox" name="provincia" value="">Otros<br>
					</form><br><hr>
					
					<p class="texto_campo" style="margin-bottom:10px;" title="Tipo de contrato">Tipo de contrato:</p>
					<form><input class="checks" type="checkbox" name="provincia" value="">Fijo<br>
						<input class="checks" type="checkbox" name="provincia" value="">Temporal<br>
						<input class="checks" type="checkbox" name="provincia" value="">Freelance / Otros<br>
					</form>
					
					<br><br><hr>	
					<form action="action_page.php">
						<span class="texto_campo"  title="AÃ±os de experiencia">AÃ±os de experiencia:</span>
						<input  id="exp_campo" type="number" name="quantity" min="0" max="15" value="0">
					</form>
					
					<br><br><hr>
					<p class="texto_campo" title="Salario bruto en euros">Salario mÃ­nimo:</p>
					<input  id="salNumber" type="text" value="0">
 					<div id="salario_slider"></div>
					<span id="salario_minimo">0</span>
					
					<span id="salario_maximo">150000</span>
					
					<br><br>
					
					
				 
				 	<input id = "boton_filtro" name='busqueda' type="button" value="Filtrar" title="Filtrar ofertas">

				 </div>
				

				
				<!--SECCION DE OFERTAS-->
				
				<div id="lista_ofertas">
					
					<!--OFERTA 1-->
					<div id="oferta1" class="oferta">
						<div class="cuerpo"><br>
							<a href="#"   class="titulo"><h3 class="cabecera">Responsable informÃ¡tica</h3></a>
							<p class = "ofertas-empresa">Microsoft Inc.<span><img class="estrella" src="images/usuario/estrella1.png" alt="estrella" title="Favoritos"></span></p>
							<br>
							<p style="margin-left:20px;">Responsable IT junior, con posibilidades de promociÃ³n interna, con experiencia a nivel analista o programador
							de soluciones SAP Business One,-Conocimientos en Business Objects (Crystal reports).-Conocimientos de SAP...<a href="#" style="font-size: 12px; margin-left: 5px;" title="Saber mÃ¡s de esta oferta">Saber mÃ¡s</a>
							</p>
							
							<p class="campos_busqueda">CategorÃ­a: | Estudios requeridos: | Provincia: </p>
							<p class="campos_filtro">Puesto: | Experiencia mÃ­nima requerida: | Jornada: | Tipo de contrato: </p>
							
							
						</div>
						
						<div class="iconos">
							<a href="#" title="compartir en g+"><img src="images/usuario/google_plus.jpg" alt="gplus" class="img1"></a>
							<a href="#" title="compartir en linkedin"><img src="images/usuario/linkedin.jpg" alt="gplus" class="img2"></a><br>
							<a href="#" title="compartir por correo"><img src="images/usuario/gmail.jpg" alt="gplus" class="img3"></a>
							<a href="#" title="compartir por facebook"><img src="images/usuario/facebook.png" alt="gplus" class="img4"></a>
						</div>
						<div class="inferior">
							<form action="contenidoCursos" method="post">
								<input type="submit" value="Enviar"/>
							</form>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Seguir empresa</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Favoritos</a>

						</div>
						

					</div>
					
					<!--OFERTA 2-->
					
					<div id="oferta2" class="oferta">
						<div class="cuerpo"><br>
							<a href="#"  class="titulo"><h3 class="cabecera">TÃ©cnico informÃ¡tico</h3></a>
							<p class = "ofertas-empresa">Microsoft Inc.<span><img class="estrella" src="images/usuario/estrella1.png" alt="estrella" title="Favoritos"></span></p>
							<br>
							<p style="margin-left:20px;"> Si-Legal, consultora ubicada en Barcelona, precisa incorporar a su equipo un administrador de sistemas.
							Su funciÃ³n serÃ¡ velar por el buen funcionamiento de la infraestructura informÃ¡tica propia y la de nuestro
							clientes.Sus tareas serÃ¡n:
							GestiÃ³n de Backups.
							Soporte Nivel 1 y Nivel 2.
							AdministraciÃ³n de Pc y servidores.<a href="#" style="font-size: 12px; margin-left: 5px;" title="Saber mÃ¡s de esta oferta">Saber mÃ¡s</a>
							</p>
							<p class="campos_busqueda">CategorÃ­a: | Estudios requeridos: | Provincia: </p>
							<p class="campos_filtro">Puesto: | Experiencia mÃ­nima requerida: | Jornada: | Tipo de contrato: </p>
						</div>
						
						<div class="iconos">
							<a href="#" title="compartir en g+"><img src="images/usuario/google_plus.jpg" alt="gplus" class="img1"></a>
							<a href="#" title="compartir en linkedin"><img src="images/usuario/linkedin.jpg" alt="gplus" class="img2"></a><br>
							<a href="#" title="compartir por correo"><img src="images/usuario/gmail.jpg" alt="gplus" class="img3"></a>
							<a href="#" title="compartir por facebook"><img src="images/usuario/facebook.png" alt="gplus" class="img4"></a>
						</div>
						<div class="inferior">
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Inscribirse</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Seguir empresa</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Favoritos</a>
						</div>
					</div>
					
					<!--OFERTA 3-->
					<div id="oferta3" class="oferta">
						<div class="cuerpo"><br>
							<a href="#"  class="titulo"><h3 class="cabecera">Analista Programador Oracle PL/SQL con ingles</h3></a>
							<p class = "ofertas-empresa">Microsoft Inc.<span><img class="estrella" src="images/usuario/estrella1.png" alt="estrella" title="Favoritos"></span></p>
							<br>
							<p style="margin-left:20px;"> Precisamos incorporar un Analista Programador Oracle PL/SQL para proyecto ubicado en Boston,MA en el sector bancario.
							<a href="#" style="font-size: 12px; margin-left: 5px;" title="Saber mÃ¡s de esta oferta">Saber mÃ¡s</a>
							</p>
							
							<p class="campos_busqueda">CategorÃ­a: | Estudios requeridos: | Provincia: </p>
							<p class="campos_filtro">Puesto: | Experiencia mÃ­nima requerida: | Jornada: | Tipo de contrato: </p>
	
						</div>
						<div class="iconos">
							<a href="#" title="compartir en g+"><img src="images/usuario/google_plus.jpg" alt="gplus" class="img1"></a>
							<a href="#" title="compartir en linkedin"><img src="images/usuario/linkedin.jpg" alt="gplus" class="img2"></a><br>
							<a href="#" title="compartir por correo"><img src="images/usuario/gmail.jpg" alt="gplus" class="img3"></a>
							<a href="#" title="compartir por facebook"><img src="images/usuario/facebook.png" alt="gplus" class="img4"></a>
						</div>
						<div class="inferior">
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Inscribirse</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Seguir empresa</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Favoritos</a>
						</div>
						
						
					</div>
					
					
					<!--OFERTA 4-->
					<div id="oferta4" class="oferta">
						<div class="cuerpo"><br>
							<a href="#"  class="titulo"><h3 class="cabecera">Responsable Desarrollo SW mantenimientos internos</h3></a>
							<p class = "ofertas-empresa">Microsoft Inc.<span><img class="estrella" src="images/usuario/estrella1.png" alt="estrella" title="Favoritos"></span></p>
							<br>
							<p style="margin-left:20px;"> P Aegon selecciona para integraciÃ³n en el Ã¡rea de IT un Responsable de Desarrollo de Software (PL/ SQL y Java) de productos
							de seguros.?QUÃ BUSCAMOS?<a href="#" style="font-size: 12px; margin-left: 5px;" title="Saber mÃ¡s de esta oferta">Saber mÃ¡s</a>
							</p>
							
							<p class="campos_busqueda">CategorÃ­a: | Estudios requeridos: | Provincia: </p>
							<p class="campos_filtro">Puesto: | Experiencia mÃ­nima requerida: | Jornada: | Tipo de contrato: </p>
						</div>
						<div class="iconos">
							<a href="#" title="compartir en g+"><img src="images/usuario/google_plus.jpg" alt="gplus" class="img1"></a>
							<a href="#" title="compartir en linkedin"><img src="images/usuario/linkedin.jpg" alt="gplus" class="img2"></a><br>
							<a href="#" title="compartir por correo"><img src="images/usuario/gmail.jpg" alt="gplus" class="img3"></a>
							<a href="#" title="compartir por facebook"><img src="images/usuario/facebook.png" alt="gplus" class="img4"></a>
						</div>
						<div class="inferior">
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Inscribirse</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Seguir empresa</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Favoritos</a>
						</div>
						
						
					</div>
					
					
					<!--OFERTA 5-->
					
					<div id="oferta5" class="oferta">
						<div class="cuerpo"><br>
							<a href="#"  class="titulo"><h3 class="cabecera">
								Programador PHP (administraciÃ³n Linux)
							</h3></a>
							<p class = "ofertas-empresa">Microsoft Inc.<span><img class="estrella" src="images/usuario/estrella1.png" alt="estrella" title="Favoritos"></span></p>
							<br>
							<p style="margin-left:20px;"> Precisamos incorporar un Programador Web con conocimientos de administraciÃ³n de sistemas para nuestras Oficinas ubicadas en Girona
							capital.Sus funciones serÃ¡n las del mantenimiento, desarrollo y mejora de...
							<a href="#" style="font-size: 12px; margin-left: 5px;" title="Saber mÃ¡s de esta oferta">Saber mÃ¡s</a>
							</p>
							
							<p class="campos_busqueda">CategorÃ­a: | Estudios requeridos: | Provincia: </p>
							<p class="campos_filtro">Puesto: | Experiencia mÃ­nima requerida: | Jornada: | Tipo de contrato: </p>
	
						</div>
						<div class="iconos">
							<a href="#" title="compartir en g+"><img src="images/usuario/google_plus.jpg" alt="gplus" class="img1"></a>
							<a href="#" title="compartir en linkedin"><img src="images/usuario/linkedin.jpg" alt="gplus" class="img2"></a><br>
							<a href="#" title="compartir por correo"><img src="images/usuario/gmail.jpg" alt="gplus" class="img3"></a>
							<a href="#" title="compartir por facebook"><img src="images/usuario/facebook.png" alt="gplus" class="img4"></a>
						</div>
						<div class="inferior">
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Inscribirse</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Seguir empresa</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Favoritos</a>

						</div>
						
						
					</div>
					
					<!--OFERTA 6-->
					
					<div id="oferta6" class="oferta">
						<div class="cuerpo"><br>
							<a href="#"  class="titulo"><h3 class="cabecera">
								Ingeniero InformÃ¡tico
							</h3></a>
							<p class = "ofertas-empresa">Microsoft Inc.<span><img class="estrella" src="images/usuario/estrella1.png" alt="estrella" title="Favoritos"></span></p>
							<br>
							<p style="margin-left:20px;">  Qdem selecciona para importante proyecto de soporte un Ingeniero informÃ¡tico con conocimientos demostrables en:
							- InstalaciÃ³n y configuraciÃ³n de S.O: Windows 7, Windows 8, MS Office 2010, MS Office 2013, dispositivos
							<a href="#" style="font-size: 12px; margin-left: 5px;" title="Saber mÃ¡s de esta oferta">Saber mÃ¡s</a>
							</p>
							
							<p class="campos_busqueda">CategorÃ­a: | Estudios requeridos: | Provincia: </p>
							<p class="campos_filtro">Puesto: | Experiencia mÃ­nima requerida: | Jornada: | Tipo de contrato: </p>
	
						</div>
						<div class="iconos">
							<a href="#" title="compartir en g+"><img src="images/usuario/google_plus.jpg" alt="gplus" class="img1"></a>
							<a href="#" title="compartir en linkedin"><img src="images/usuario/linkedin.jpg" alt="gplus" class="img2"></a><br>
							<a href="#" title="compartir por correo"><img src="images/usuario/gmail.jpg" alt="gplus" class="img3"></a>
							<a href="#" title="compartir por facebook"><img src="images/usuario/facebook.png" alt="gplus" class="img4"></a>
						</div>
						<div class="inferior">
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Inscribirse</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Seguir empresa</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Favoritos</a>

						</div>
						
						
					</div>
					
					<!--OFERTA 7-->
					<div id="oferta7" class="oferta">
						<div class="cuerpo"><br>
							<a href="#"  class="titulo"><h3 class="cabecera">
								Beca Software development
							</h3></a>
							<p class = "ofertas-empresa">Microsoft Inc.<span><img class="estrella" src="images/usuario/estrella1.png" alt="estrella" title="Favoritos"></span></p>
							<br>
							<p style="margin-left:20px;"> Altran EspaÃ±a es una compaÃ±Ã­a perteneciente al grupo Altran, lÃ­der global en TecnolÃ³gica eI, con una red internacional de 21.000
							profesionales y 500 grandes clientes en todo el mundo. Altran estÃ¡ presente en Europa,...
							<a href="#" style="font-size: 12px; margin-left: 5px;" title="Saber mÃ¡s de esta oferta">Saber mÃ¡s</a>
							</p>
							
							<p class="campos_busqueda">CategorÃ­a: | Estudios requeridos: | Provincia: </p>
							<p class="campos_filtro">Puesto: | Experiencia mÃ­nima requerida: | Jornada: | Tipo de contrato: </p>
	
						</div>
						<div class="iconos">
							<a href="#" title="compartir en g+"><img src="images/usuario/google_plus.jpg" alt="gplus" class="img1"></a>
							<a href="#" title="compartir en linkedin"><img src="images/usuario/linkedin.jpg" alt="gplus" class="img2"></a><br>
							<a href="#" title="compartir por correo"><img src="images/usuario/gmail.jpg" alt="gplus" class="img3"></a>
							<a href="#" title="compartir por facebook"><img src="images/usuario/facebook.png" alt="gplus" class="img4"></a>
						</div>
						<div class="inferior">
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Inscribirse</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Seguir empresa</a>
							<a  class="opciones_inferiores" href="http://www.w3schools.com">Favoritos</a>

						</div>
						
						
					</div>
					
					<div class="paginas">
						<a href="#" class="num_paginas"> <img class="flechita" src="images/usuario/izquierda.jpg" alt="anterior">&nbsp; &nbsp;</a>
						<a href="#" class="num_paginas"> 1 &nbsp; &nbsp; </a>
						<a href="#" class="num_paginas"> 2 &nbsp; &nbsp; </a>
						<a href="#" class="num_paginas"> 3 &nbsp; &nbsp;</a>
						<a href="#" class="num_paginas"> <img class="flechita" src="images/usuario/derecha.png" alt="siguiente"></a>
					</div>
					
					
					
					
					
					
				</div>
				
				
			</section>
			<!--PIE DE PAGINA-->
			<footer style="clear:both;">  
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
		
			<script type ="text/javascript" src ="script/popup-usuario.js"></script>
			<script type ="text/javascript" src ="script/popup-empresa.js"></script>
			<script type ="text/javascript" src ="script/popup-registro.js"></script>
	</body>

</html>