<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>


		<!-- Información sobre el documento -->
	
		<title>Practica final: Formulario usuario</title>
		
		<meta charset="UTF-8">
		<meta name="keywords" content="buscar, trabajo, empleo, salario">
		<meta name="description" content="Web para la busqueda de empleo">
		<meta name="author" content="Mingda Liu Zhang, Alejando Ruiz de la Cuadra, Carlos Herrero Lozano">
	
		<!--Fuente Ubuntu-->
		
		<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
	
		<!--CSS de la pagina-->
		
		<link rel="stylesheet" type="text/css" href="style/formulario-usuario.css">
		
		
		<!--SCRIPT de la pagina-->
		<link href="script/jquery-ui-1.11.2.custom/jquery-ui.css" rel="stylesheet">
		
		<!--JQUERY-->

		<script src="script/jquery-ui-1.11.2.custom/external/jquery/jquery.js"></script>
		<script src="script/jquery-ui-1.11.2.custom/jquery-ui.js"></script>
		
		
		<!--CSS del menu en forma de carousel-->
		
		<link rel="stylesheet" type="text/css" href="script/plugin/slick/slick.css"/>
		
		<!--CSS redes sociales-->
		
			<link rel="stylesheet" type="text/css" href="script/plugin/circle/css/common.css" />
	        <link rel="stylesheet" type="text/css" href="script/plugin/circle/css/style6.css" />
			<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700' rel='stylesheet' type='text/css' />
			<script type="text/javascript" src="script/plugin/circle/js/modernizr.custom.79639.js"></script>
			
			
	        <link rel="stylesheet" type="text/css" href="style/formacion/style_common.css" />
	        <link rel="stylesheet" type="text/css" href="style/formacion/style10.css" />
	        <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
			
            <script>
            

        	function validar(){
        		
          		var nombre = document.getElementById("nombre");
          		var apellidos = document.getElementById("apellidos");
        		var sexo = document.getElementById("sex");
        		var correo = document.getElementById("correo");
        		var telefono = document.getElementById("telefono");
        		var cobro = document.getElementById("cobro");
        		var rol = document.getElementById("rol");
        		var contraseña1 = document.getElementById("password1");
        		var contraseña2 = document.getElementById("password2");
        		
        		var validacion = true; /*variable para crear la oferta*/
        	    
        	    
        		
        		if (nombre.value == "" || nombre.value == null || nombre.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
        			  $("#mens1").show();
        	         validacion=false;
        	     }
        			

        		if (apellidos.value == "" || apellidos.value == null || apellidos.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
        	         $("#mens2").show();
        	         validacion=false;

        	     }else{
        	         $("#mens2").hide();      /* Si si lo introduce, esconde el mensaje */
        	         }
        		
        		if (sexo.value == "" || sexo.value == null || sexo.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
        	         $("#mens3").show();
        	         validacion=false;

        	     }else{
        	         $("#mens3").hide();      /* Si si lo introduce, esconde el mensaje */
        	         }
        		if(sexo.value !="M" && sexo.value !="H"){
        			alert("Tienes que introducir M o H en el campo de sexo");
        			validacion=false;
        		}
              
        		if (correo.value == "" || correo.value == null || correo.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
        	         $("#mens4").show();
        	         validacion=false;

        	     }else{
        	         $("#mens4").hide();      /* Si si lo introduce, esconde el mensaje */
        	         }
        		
        		if (telefono.value == "" || telefono.value == null || telefono.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
        	         $("#mens5").show();
        	         validacion=false;

        	     }else{
        	         $("#mens5").hide();      /* Si si lo introduce, esconde el mensaje */
        	         }

        		
        		if (cobro.value == "" || cobro.value == null || cobro.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
        	         $("#mens6").show();
        	         validacion=false;

        	     }else{
        	         $("#mens6").hide();      /* Si si lo introduce, esconde el mensaje */
        	         }

        		if (rol.value == "" || rol.value == null || rol.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
        	         $("#mens7").show();
        	         validacion=false;

        	     }else{
        	         $("#mens7").hide();      /* Si si lo introduce, esconde el mensaje */
        	         }
        			 
        		if(rol.value !="Profesor" && rol.value !="Alumno"){
        			alert("Tienes que introducir Profesor o Alumno en el campo de rol");
        			validacion=false;
        		}
        			 
        		if (contraseña2.value == "" || contraseña2.value == null || contraseña2.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
        	         $("#mens10").show();
        	         validacion=false;

        	     }else{
        	         $("#mens10").hide();      /* Si si lo introduce, esconde el mensaje */
        	         }

        		if (contraseña1.value == "" || contraseña1.value == null || contraseña1.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
        	         $("#mens9").show();
        	         validacion=false;

        	     }else{
        	         $("#mens9").hide();      /* Si si lo introduce, esconde el mensaje */
        	         }
        	
        			if(document.getElementById("acepto").checked){
        			}else{
        				alert("Debe aceptar los términos y condiciones");
        				validacion=false;
        				}
        	if(contraseña2.value != contraseña1.value){
        		alert("Contraseñas diferentes");
        		validacion=false;
        	}
        	
        	if(validacion==true){
        		alert("Usuario creado correctamente");
        	}	

				return validacion;
        	}
            
            
            </script>
	</head>
	
	
	<body>
		
	
			<!-- CABECERA-->
	
				<header>

					<a href="src/main/webapp/index.jsp">	

						<img class = "cabecera" src="images/logo.png" alt="Error en la imagen">    

						<h1 class = "cabecera">DOKU</h1>

					</a>

						

					


						  <form >

						 	<fieldset class = "popup" id = "popup-empresa">

								<p>Correo:</p>
						    	<input type="text" name="email" id="email-1" placeholder="jane@smith.com" class="text ui-widget-content ui-corner-all">
								<p>Contraseña: <a href= "#">recuperar contraseña</a></p>
						      	<input type="password" name="password" id="password-1" placeholder="Contraseña" class="text ui-widget-content ui-corner-all">

								<a href = "#">¿Necesitas crear una cuenta?</a>

						      <!-- Allow form submission with keyboard without duplicating the dialog button -->
						      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
						    </fieldset>
						  </form>
						</div>

						<div id="dialog-form-2" title="Inicia sesión con tu correo">
						  <p class="validateTips">¡Bienvenido usuario!</p>

						  <form >

						 	<fieldset class = "popup" id = "popup-usuario">

								<p>Correo:</p>
						    	<input type="text" name="email" id="email-2" placeholder="jane@smith.com" class="text ui-widget-content ui-corner-all">
								<p>Contraseña: <a href= "#">recuperar contraseña</a></p>
						      	<input type="password" name="password" id="password-2" placeholder="Contraseña" class="text ui-widget-content ui-corner-all">

								<a href = "#">¿Necesitas crear una cuenta?</a>

						      <!-- Allow form submission with keyboard without duplicating the dialog button -->
						      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
						    </fieldset>
						  </form>
						</div>

						<div id= "dialog-form-3" title="Crea una cuenta">
							<p class="validateTips">¡Bienvenido a Lavoro!</p>

							<p>Elige particular para registrar una cuenta nueva como trabajador, o elige empresa para registrar una cuenta como empresa</p>

						</div>


				</header>			

			<!--MENU-->
	
			

			<!--CUERPO DE LA PAGINA-->
	
			<section> 
				
				<h4>EMPIEZA A CREAR TU NUEVO PERFIL (PARTICULAR)</h4>

				<form method="POST" action="FormularioUsuario" onsubmit="return validar();">
				
				<div id="cuestionario">
				
				
				
					<div><div>
							<!--Nombre-->
							<p><span class=obligatorio>Nombre</span><span class=aster>*</span><span class=obligatorio>:</span></p>
							<p id="mens1" class = "mens">Te falta rellenar la casilla nombre*</p>							
							<input  type="text" id="nombre" name="nombre" placeholder="Carlos" />							

					</div>		
							<!--Apellido-->
					<div>		
							<p><span class=obligatorio>Apellidos</span><span class=aster>*</span><span class=obligatorio>:</span></p>
							<p id="mens2" class = "mens">Te falta rellenar la casilla apellido*</p>							
							<input  type="text" name="apellidos" id="apellidos" placeholder="Ruiz" />

							
					</div></div>
							<!--sexo-->
					<div><div>
							<p><span class=obligatorio>Sexo (H/M)</span><span class=aster>*</span><span class=obligatorio>:</span></p>	
							<p id="mens3" class = "mens">No has rellenado el sexo</p>
							<input type="text" name="sex" id="sex" placeholder="H" />
							
					</div>		
							<!--Email-->
					<div>		
							<p><span class=obligatorio>Email</span><span class=aster>*</span><span class=obligatorio>:</span></p>	
							<p id="mens4" class = "mens">Te falta rellenar la casilla correo*</p>							
							<input type="email" name="correo" id="correo"placeholder="carlos_ruiz@gmail.com" />

					</div></div>		
							<!--Telefono-->
					<div><div>		
							<p><span class=obligatorio>Telefono</span><span class=aster>*</span><span class=obligatorio>:</span></p>	
							<p id="mens5" class = "mens">Has rellenado mal el teléfono</p>
							<input  type="text" name="telefono" id="telefono" placeholder="666666666" />
					</div>		
							<!--Modo de cobro-->
					<div>		
							<p><span class=obligatorio>Modo de cobro</span><span class=aster>*</span><span class=obligatorio>:</span></p>
							<p id="mens6" class = "mens">Te falta rellenar la casilla de modo de cobro*</p>
							<input  type="text" name="cobro" id="cobro" placeholder="Contrato indefinido" />

					</div></div>		
							<!--Rol -->
					<div><div>		
							<p><span class=obligatorio>Rol(Profesor/Alumno)</span><span class=aster>*</span><span class=obligatorio>:</span></p>
							<p id="mens7" class = "mens">Te falta rellanar la casilla tu rol: Profesor/Alumno*</p>							
							<input  type="text" name="rol" id="rol" placeholder="Profesor" />

					</div>		
							<!--Intereses-->
					<div>		
							<p><span class=obligatorio>Intereses</span><span class=aster></span><span class=obligatorio>:</span></p>
							<input  type="text" name="int" id="int" placeholder="Ciencias Sociales" />

					</div></div>		
							<!--Contraseña 1-->
					<div><div>
							
							<p><span class=obligatorio>Contraseña</span><span class=aster>*</span><span class=obligatorio>:</span></p>
							<p id="mens9" class = "mens">Tienes que rellenar el campo de la contraseña*</p>							
							<input type="password" name="contraseña1" id="password1" placeholder="max. 8 caracteres a-z, 0-9" />

					</div>
							<!--Contraseña 2-->
					<div>
							<p><span class=obligatorio>Confirmar contraseña</span><span class=aster>*</span><span class=obligatorio>:</span></p>
							<p id="mens10" class = "mens">Tienes que rellenar el campo de confirmar contraseña*</p>
							<input type="password" name="contraseña2" id="password2"  placeholder="max. 8 caracteres a-z, 0-9" />
					</div></div>
							<!--Código Postal-->
					<div id = "subir-imagen">
							<p>Subir imagen perfil:</p>
							<input type="file" name="imagen"/>
					</div>
					
					<div id = "condiciones"> 
						<p> He leído  y acepto los términos y condiciones de uso<span class=aster>*</span>
						<input  id="acepto"  type="checkbox" name="condiciones" value="condiciones_uso"></p>
						
						<p id= "condiciones-texto">Condiciones generales:<br>1. Su relación con Lavoro TV<br>
					1.1 Su utilización del sitio web de Lavoro TV (el "Sitio Web") y de todos los productos, canales, software, alimentación de datos y servicios de Lavoro TV, incluyendo el reproductor de video de Lavoro TV incorporado
					(el "Reproductor de Video de Infojobs TV") que Lavoro TV le facilite en, desde o a través del Sitio Web (conjuntamente, el "Servicio") estará sujeto a las condiciones de un acuerdo legal entre Ud. y Lavoro SL. "Lavoro
					TV" es titularidad de  Lavoro, S.A. con domicilio en Barcelona, España, en la Calle Numancia 46, 4ª planta; provista de CIF: A-62134309 E Inscrita en el RMB T.32517, F.15, H.210876 (en adelante "Lavoro") es la titular
					y propietaria de los Sitios Web www.lavoro.net, formacion.lavoro.net yblog.lavoro.net (en adelante "Lavoro" o "Sitio/s Web").<br>1.2 Su acuerdo legal con Lavoro TV se compone de (A) los términos y condiciones establecidos
					en este documento, (B) las condiciones legales de Infojobs (https://www.lavoro.net/lex.xhtml?dgv=2771209485035851227)  (conjuntamente, los "Términos y Condiciones").<br>1.3 Los Términos y Condiciones constituyen un contrato
					legalmente vinculante para Ud. y para Lavoro TV en relación con su utilización de los Servicios, por lo que es importante que los lea detenidamente.<br>1.4 Los Términos y Condiciones son de aplicación a todos los usuarios del
					Servicio, incluyendo aquellos usuarios que aporten igualmente Contenido en el Servicio.<br>Entendemos por “Contenido” todo aquel texto, software, guiones, gráficos, fotos, sonidos, música, videos, combinaciones audiovisuales,
					funcionalidades interactivas y otros materiales que Ud. pueda visualizar en, o acceder a través de, o aportar a, el Servicio.<br>2. Aceptación de los Términos y Condiciones<br>2.1 Para poder utilizar los Servicios, deberá
					aceptar previamente los Términos y Condiciones. Ud. no podrá utilizar los Servicios si no acepta los Términos y Condiciones.<br>2.2 Puede aceptar los Términos y Condiciones mediante la simple utilización de los Servicios.
						</p>
					</div>
					
					<div id = "registrar-boton">
						<input class = "registrar1" name='registrar1' type="submit" value="CREAR USUARIO">					
					</div>	
				
						
			</div>
				</form>	
				<div id = "redes-sociales">
						
					<h4>SÍGUENOS EN LAS REDES SOCIALES</h4>
						
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
					<li> Copyright © jooglecam.com</li>
				 	<li><a href="#">Aviso legal	</a></li>
				 	<li><a href="#">Privacidad 	 </a></li>
				 	<li><a href="#">Política de cookies	</a></li>
				 	<li><a href="#">Accesibilidad  </a></li>
				 	<li><a href="#">Contacto </a></li>
				 	<li><a href="#">Ayuda  </a></li>
				</ul>
			</footer>
		
		<script type = "text/javascript" src ="script/formulario-usuario.js"></script>
		<script type="text/javascript" src="script/plugin/slick/slick.min.js"></script>
		<script type ="text/javascript" src ="script/popup-usuario.js"></script>
		<script type ="text/javascript" src ="script/popup-empresa.js"></script>
		<script type ="text/javascript" src ="script/popup-registro.js"></script>
		
		
	</body>

</html>