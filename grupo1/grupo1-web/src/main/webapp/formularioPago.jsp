<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>


		<!-- Información sobre el documento -->
	
		<title>Practica final: Formulario Pago</title>
		
		<meta name="keywords" content="buscar, trabajo, empleo, salario">
		<meta name="description" content="Web para la busqueda de empleo">
		<meta name="author" content="Jorge Garcia">
	
		<!--Fuente Ubuntu-->
		
		<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
	
		<!--CSS de la pagina-->
		
		<link rel="stylesheet" type="text/css" href="style/formulario-pago.css">
		
		
		<!--SCRIPT de la pagina-->
		<link href="script/jquery-ui-1.11.2.custom/jquery-ui.css" rel="stylesheet">
		
		<!--JQUERY-->

		<script src="script/jquery-ui-1.11.2.custom/external/jquery/jquery.js"></script>
		<script src="script/jquery-ui-1.11.2.custom/jquery-ui.js"></script>
		

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
			
			<div id = "formulario-pago">
				
				<h4>Pago de Matricula</h4>

				<form method="POST" action="AñadirMatricula" onsubmit="return comprobarTexto();">
								
					<div id="form-name" class="form-pago-class">
							<!--Nombre-->
							<p><span class=obligatorio>Nombre (como aparece en tu tarjeta)</span><span class=aster>*</span><span class=obligatorio>:</span></p>
							<input  type="text" id="nombre" name="nombre" placeholder="Alejandro Ruiz" />							
							<p id="mens1" class = "mens">Te falta rellenar el nombre de la tarjeta*</p>							
					</div>		
							<!--Tarjeta-->
					<div id="form-number" class="form-pago-class">		
							<p><span class=obligatorio>Numero de tarjeta (sin guiones o espacios)</span><span class=aster>*</span><span class=obligatorio>:</span></p>
							<input  type="text" name="numero" id="numero" placeholder="1234123412341234" />					
							<p id="mens2" class = "mens">Te falta rellenar el numero de la tarjeta*</p>							
					</div>
						
							<!--Fecha tarjeta-->
					<div id="form-fecha">		
							<p><span class=obligatorio>Fecha de caducidad</span><span class=aster>*</span><span class=obligatorio>:</span></p>
									<select id="mes-tarjeta" name="mes">
										<option value="0">Mes</option>
										<option value="1">01</option>
										<option value="2">02</option>
										<option value="3">03</option>
										<option value="4">04</option>
										<option value="5">05</option>
										<option value="6">06</option>
										<option value="7">07</option>
										<option value="8">08</option>
										<option value="9">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>
									<select id="anio-tarjeta" name="anio">
										<option value="0">Año</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="10">20</option>
									</select>													
							<p id="mens3" class = "mens">Te falta rellenar la fecha de caducidad de tarjeta*</p>
					</div>	
					<div id="form-codigo">
							<!--CVV2/CVC2-->
							<p><span class=obligatorio>CVV2/CVC2</span><span class=aster>*</span><span class=obligatorio>:</span></p>
							<input  type="text" id="codigo" name="codigo" placeholder=052 />							
							<p id="mens4" class = "mens">Te falta rellenar el codigo de seguridad de la tarjeta*</p>							
					</div>							
					
					<div id = "registrar-boton">
						<input class = "registrar1" name='registrar1' type="submit" value="REALIZAR PAGO">					
					</div>
				</form>
							
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
		
		<script type = "text/javascript" src ="script/formulario-pago.js"></script>
		<script type="text/javascript" src="script/plugin/slick/slick.min.js"></script>
		<script type ="text/javascript" src ="script/popup-usuario.js"></script>
		<script type ="text/javascript" src ="script/popup-empresa.js"></script>
		<script type ="text/javascript" src ="script/popup-registro.js"></script>
		
		
	</body>

</html>