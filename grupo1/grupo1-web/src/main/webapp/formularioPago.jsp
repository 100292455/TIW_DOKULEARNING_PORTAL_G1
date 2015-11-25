<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>


		<!-- Información sobre el documento -->
	
		<title>Practica final: Formulario Pago</title>
		
		<meta charset="UTF-8">
		<meta name="keywords" content="buscar, trabajo, empleo, salario">
		<meta name="description" content="Web para la busqueda de empleo">
		<meta name="author" content="Jorge Garcia">
	
		<!--Fuente Ubuntu-->
		
		<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
	
		<!--CSS de la pagina-->
		
		<link rel="stylesheet" type="text/css" href="style/formulario-usuario.css">
		<link rel="stylesheet" type="text/css" href="style/busqueda.css">
		
		
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
            

        	function comprobarTexto(){
        		
          		var nombre = document.getElementById("nombre");
          		var apellidos = document.getElementById("apellidos");
        		var sexo = document.getElementById("sex");
        		var correo = document.getElementById("correo");
        		var telefono = document.getElementById("telefono");
        		var cobro = document.getElementById("cobro");
        		var rol = document.getElementById("rol");
        		
        		var validacion = true; /*variable para crear la oferta*/
        	    
 
        		
        		if (cobro.value == "" || cobro.value == null || cobro.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
        	         $("#mens6").show();
        	         validacion=false;

        	     }else{
        	         $("#mens6").hide();      /* Si si lo introduce, esconde el mensaje */
        	         }

        		if (rol.value == "" || rol.value == null || rol.value == ''){   /* Si no introduce el titulo enseÃ±a el mensaje de error y pone la variable validacion a false*/
       	         $("#mens7").show();
       	         validacion=false;

       	    	 }else{
       	         $("#mens7").hide();      /* Si si lo introduce, esconde el mensaje */
       	         }
        	
        		if(document.getElementById("acepto").checked){
        		}else{
        			alert("Debe aceptar los términos y condiciones");
        			validacion=false;
        			}

        	
        		if(validacion==true){
        			alert("Pago realizado correctamente");
        		}	

					return validacion;
        		}
            
            
            </script>
	</head>
	
	
	<body>
		
	
			<header>
                
                <a href="index.jsp">    
                    
                    <img class = "cabecera" src="images/logo.png" alt="Error en la imagen">    
                
                    <h1 class = "cabecera">DOKU</h1>
                
                </a>
                
                    <a href = "misCursos.jsp"><p class = "cabecera1" id = "cabecera-empresa">MIS CURSOS</p></a>
                    
                    <p class = "cabecera">|</p>
                        
                    <a href = "miPerfilAlumno.jsp"><p class = "cabecera1" id = "cabecera-usuario">MI PERFIL</p></a>
                    
                    <p class = "cabecera">|</p>
                        
                    <a href = "listadoCursos.jsp"><p class = "cabecera1" id = "cabecera-usuario">CURSOS</p></a>
                
                    
              <p class = "cabecera">|</p>
                        
                    <a href = "sesion?accion=salir"><p class = "cabecera1" id = "cabecera-usuario">SALIR</p></a>
                    
                    
            
            </header>

			<!--MENU-->
	
			

			<!--CUERPO DE LA PAGINA-->
	
			<section> 
				
				<h4>Pago de Matricula</h4>

				<form method="POST" action="AnadirMatricula" onsubmit="return comprobarTexto();">
				
				<div id="cuestionario">
				
					
							<!--Modo de cobro-->
					<div>		
							<p><span class=obligatorio>Numero de tarjeta</span><span class=aster>*</span><span class=obligatorio>:</span></p>
							<p id="mens6" class = "mens">Te falta rellenar la casilla de numero de tarjeta*</p>
							<input  type="text" name="cobro" id="cobro" placeholder="5111-1111-2222-2269" />

					</div></div>		
							<!--CVV -->
					<div><div>		
							<p><span class=obligatorio>Cvv</span><span class=aster>*</span><span class=obligatorio>:</span></p>
							<p id="mens7" class = "mens">Te falta rellanar la casilla cvv*</p>							
							<input  type="text" name="rol" id="rol" placeholder="123" />

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
						<input class = "registrar1" name='registrar1' type="submit" value="PAGAR">					
					</div>
				</form>
							
			</div>
				
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