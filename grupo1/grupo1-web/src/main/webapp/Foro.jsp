<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<!-- Información sobre el documento -->
	
		<title>Practica TIW: Foro</title>
		<meta name="keywords" content="e-learning, cursos">
		<meta name="description" content="Foro para curso">
		<meta name="author" content="Alejandro Ruiz">
		
		<!--CSS de la pagina-->
		
		<link rel="stylesheet" type="text/css" href="./style/foro.css">
		
		<link href="<c:url value="http://fonts.googleapis.com/css?family=Ubuntu" />" rel='stylesheet' type='text/css'>
		<link href="<c:url value="/script/jquery-ui-1.11.2.custom/jquery-ui.css" />" rel="stylesheet">
		<script src="<c:url value="/script/jquery-ui-1.11.2.custom/external/jquery/jquery.js" />"></script>
		<script src="<c:url value="/script/jquery-ui-1.11.2.custom/jquery-ui.js" />"></script>
</head>
<body>

			<header>

 			<!--CABECERA-->
                
                <a href="miPerfilAlumno.jsp">    
                    
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
            
	<!--CUERPO DE LA PAGINA-->
            
           <section> 
            
            	<div id = "contenedor-foro">
            		
            		<h3>Bellas Artes</h3>
            		
            		<div id = "contenedor-mensaje">
            		
            			<div id= "contenedor-participantes">
            				<ul>
            					<li>
            						<img  src="images/famosos/alice.jpg" alt="Error en la imagen">  
            						 <p>Alice Gould</p>
            					</li>
             					<li>
            						<img  src="images/famosos/amancio.jpg" alt="Error en la imagen">  
            						 <p>Amancio Ortega</p>
            					</li>
             					<li>
            						<img  src="images/famosos/bernard.jpg" alt="Error en la imagen">  
            						 <p>Bernard Sanz</p>
            					</li>
             					<li>
            						<img  src="images/famosos/carlos.jpg" alt="Error en la imagen">  
            						 <p>Carlos Sainz</p>
            					</li>
             					<li>
            						<img  src="images/famosos/charles.jpg" alt="Error en la imagen">  
            						 <p>Principe Charles</p>
            					</li>
             					<li>
            						<img  src="images/famosos/gates.jpg" alt="Error en la imagen">  
            						 <p>Bill Gates</p>
            					</li>
             					<li>
            						<img  src="images/famosos/jim.jpg" alt="Error en la imagen">  
            						 <p>Jimmy Falon</p>
            					</li>
             					<li>
            						<img  src="images/famosos/larry.jpg" alt="Error en la imagen">  
            						 <p>Larry Perry</p>
            					</li>
             					<li>
            						<img  src="images/famosos/michael.jpg" alt="Error en la imagen">  
            						 <p>Micheal Jackson</p>
            					</li>
                				</ul>
            			</div>
            			
            			<div id = "contenedor-conversacion">
            				
            				<div id = conversacion>
            					
            					<ul>
            						<li>
            							<div class="remitente">
	            							<p>Bill Gates</p>
	            							<p>¿Alguien sabe cuando es el primer parcial?</p>
       							     	</div>
            							
            						</li>
            						<li>
            							<div class="emisor">
            								<p>Yo</p>
            								<p>Que yo recuerde es el martes por la mañana, pero no estoy seguro.</p>
       							     	</div>
            						</li>
            						<li>
            							<div class="remitente">
            								<p>Alice Gould</p>
            								<p>Es el martes a las 10:30 en la clase de siempre.</p>
       							     	</div>
            						</li>
            						<li>
            							<div class="remitente">
            								<p>Bill Gates</p>
            								<p>Mucgas gracias chicos :)</p>
       							     	</div>
            						</li>
            						<li>
            							<div class="remitente">
            								<p>Larry Perry</p>
            								<p>Bill tienes que atender mas en clase cuando hablamos de los examenes o por lo menos apuntarlo bien. No os olvideis que entran los 3 primeros temas y se puede liberar temario. Suete.</p>
       							     	</div>
            						</li>
            						<li>
            							<div class="emisor">
            								<p>Yo</p>
           									<p>Jajajajaja</p>
       							     	</div>
            						</li>
            						<li>
            							<div class="remitente">
            								<p>Michael Jackson</p>
        	    							<p>Zass en toda la boca.</p>
       							     	</div>
            						</li>
            						<li>
            							<div class="remitente">
    	        							<p>Bill Gates</p>
	            							<p>Jajajaja si es que no estaba seguro.</p>
       							     	</div>
            						</li>
            						<li>
            							<div class="emisor">
            								<p>Yo</p>
            								<p>Eso mismo dicen todos, ¿os apetece quedar mañana para estudiar en la biblio?</p>
       							     	</div>
            						</li>
            					</ul>
            				
            				</div>
            				
            				<div id="contenedor-enviar"> 
 								<input type="text" name="mensaje">
  								<input type="submit" value="Enviar">
              				</div>
            				
            			</div>
            		
            		</div>
            		
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
		
		<script src ="<c:url value="script/empresa-mis-ofertas.js" />" type = "text/javascript" ></script>
		

</body>
</html>