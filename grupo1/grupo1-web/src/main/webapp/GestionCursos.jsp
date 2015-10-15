<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>


		<!-- Información sobre el documento -->
	
		<title>Practica TIW: Gestion de cursos</title>
		<meta charset="UTF-8">
		<meta name="keywords" content="e-learning, cursos">
		<meta name="description" content="Web de cursos en linea">
		<meta name="author" content="Miguel Solera Martin">
		<link href="<c:url value="/style/empresa-mis-ofertas.css" />" rel="stylesheet" type="text/css" >
		<link href="<c:url value="http://fonts.googleapis.com/css?family=Ubuntu" />" rel='stylesheet' type='text/css'>
		<link href="<c:url value="/script/jquery-ui-1.11.2.custom/jquery-ui.css" />" rel="stylesheet">
		<script src="<c:url value="/script/jquery-ui-1.11.2.custom/external/jquery/jquery.js" />"></script>
		<script src="<c:url value="/script/jquery-ui-1.11.2.custom/jquery-ui.js" />"></script>
		<style type="text/css">
			.error {color: red;}
		</style>
	</head>
	
			<!-- ******************** TO-DO ******************** -->
			<!-- RESCATAR ID DEL PROFESOR CORRESPONDIENTE Y PASARLO EN EL POST A AltaCursosServlet y BajaCursosServlet -->
			<!-- *********************************************** -->
	
	<body>
		
	
			<!-- CABECERA-->
			
			<header>
			
				<div id = "cabecera-logo">
				
					<a href="index-empresa.jsp">	
					
						<img class = "cabecera" src="images/logo.png" alt="Error en la imagen">    
				
						<h1 class = "cabecera">DOKULEARNING</h1>
				
					</a>
			
				</div>
				
				<nav>
					<ul>
						<li id = "menu-empresa"><a href = "mi-empresa.jsp">MI PERFIL</a></li>
						<li id = "menu-ofertas"><a href = "#">MIS CURSOS</a></li>
					</ul>	
				</nav>
			
				<div id = "cabecera-sesion">
			
					<img class = "cabecera-sesion" src="images/index/microsoft.jpg" alt="Error en la imagen"> 
				
					<div id = "cabecera-sesion-men">
						<p class = "cabecera-sesion">Microsoft Inc.</p>
						<a href = "index.jsp">Cerrar sesión</a>
							
					</div>
					
				</div>
			
			</header>
			

			<!--CUERPO DE LA PAGINA-->
	
			<section> 
				
				<div id = "mi-empresa">
				
					<input type = "button" name = "actualizar" value = "Añadir curso" id = "añadir-oferta1" class = "añadir-oferta">
				
					<h4>MIS CURSOS</h4>
					
					
					
					<div id = "ofertas">
				 		<c:if test="${empty cursos }">
							<!-- cursos es un atributo metido en el request por eso no es necesario 
							ponerle el prefijo param -->
							<p class="error">Actualmente no imparte ningun curso.</p>
						</c:if>
				
						<ul>
		<!-- 				<c:forEach items="${cursos }" var="curso"> 
						<!-- recorremos todos los objetos de la coleccion cursos 
							y cada objeto devuelto lo asignamos a la variable curso -->
						
							<li id = "oferta-ejemplo${curso.ID_curso}">
								<div class = "ofertas-descripcion">
								<!-- TO-DO
										Esto se deja para pruebas, 
										Hay que mostrar solo aquellos cursos cuyo TIPO_estado == 2 -->
									<c:choose>
										<c:when test="${curso.TIPO_estado == 2 }">
											<p class = "ofertas-titulo">${curso.DES_titulo }</p>
										</c:when>
										<c:otherwise>
											<p class = "ofertas-titulo">${curso.DES_titulo }. AUN POR VALIDAR</p>
										</c:otherwise>
									</c:choose>
									<p class = "ofertas-empresa">Impartido por: <!-- TO-DO cambiar COD_prof por nombre -->${curso.COD_profesor }</p>
									<p class = "ofertas-resumen">${curso.DES_descripcion }</p>
									<p class = "ofertas-tipo-contrato">${curso.horas } hrs.</p>
									<p class = "ofertas-jornada">${curso.precio_final } euros.</p>
									<p class = "ofertas-jornada">${curso.ID_curso } ID.</p>
									<c:choose>
										<c:when test="${curso.TIPO_dificultad == 0 }">
											<p class = "ofertas-salario">Nivel basico.</p>
										</c:when>
										<c:when test="${curso.TIPO_dificultad == 1 }">
											<p class = "ofertas-salario">Nivel intermedio.</p>
										</c:when>
										<c:otherwise>
											<p class = "ofertas-salario">Nivel avanzado.</p>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class = "ofertas-seguidores">
									<img src = "images/edicion/seguidores-icon.png" alt = "Error en la imagen">
									<p class = "numero-seguidores">Matriculados: TO-DO</p>
								</div>
								
								<div class = "ofertas-edicion">
									<form action="BajaCursos" method="post">
										<input type="hidden" name="IdCurso" value="${curso.ID_curso }">
										<button type="submit">	
											<img class="eliminar-icon" src="images/edicion/trash.png" alt="Error en la imagen">
										</button>
									</form>
								</div>
								
							</li>
		<!-- 				</c:forEach> -->
						</ul>
						
						<input type = "button" name = "actualizar" value = "Añadir curso" id = "añadir-oferta2" class = "añadir-oferta">
						
						<c:if test="${ mensaje != null }">
							<p class="error">${mensaje }</p>
						</c:if>
						
						<div id="añadir">

					        <h2> Añade un nuevo curso </h2>  
							
							<!-- ******************* TO-DO ******************* -->
					        <!-- ******* AÑADIR FOTOGRAFIA DEL CURSO ********* -->
					        <!-- http://www.tutorialspoint.com/jsp/jsp_file_uploading.htm -->
					        <!-- INCLUIR EN WEB.XML
					        <web-app>
								....
								<context-param> 
   									<description>Location to store uploaded file</description> 
    								<param-name>file-upload</param-name> 
    								<param-value>
         								c:\apache-tomcat-5.5.29\webapps\data\
     								</param-value> 
								</context-param>
								....
								
							</web-app> 
							-->
							<div id="formul">  
					        	<p class="nombre">Seleccione una imagen para el curso<span class=aster>*</span>.</p>  
					        </div>
							<form action="imageUploadServlet" method="post" enctype="multipart/form-data">
								<input type="file" name="file" size="50" /> <br />
								<input type="submit" value="Cargar Imagen" />
							</form>
							<!-- ***************************************************************** -->
			
							<form action="AltaCursos" method="post">
							
					        <!-- Titulo del curso -->

					       	<div id="formul1">  
					        	<p class="nombre">Titulo del curso<span class=aster>*</span>:</p>
						        <p  id="mens1">No ha especificado el titulo del curso*</p>
						        <input type="text" name="titulo" id="añadir-titulo"  placeholder = "Título del curso"/>
					      	</div>

					        <!-- Horas del curso -->

					        <div id="formul2">  
					        	<p class="nombre">Horas de dedicacion del curso<span class=aster>*</span>:</p>  
						        <p  id="mens2">No ha especificado el numero de horas de dedicacion del curso*</p>
						        <input  type="text" name="horas" id="añadir-horas" placeholder = "Horas de dedicacion del curso"/>
					        </div>

					        <!-- Dificultad del curso -->

					        <div id="formul3">  
						        <p class="nombre">Dificultad del curso<span class=aster>*</span>:</p> 
						        <select name="dificultad">
						        	<option value="-1" selected>Especifique dificultad del curso</option>
  									<option value="0">Basico</option>
  									<option value="1">Intermedio</option>
  									<option value="2">Avanzado</option>
								</select> 
					        </div>

					        <!-- Descripción del curso -->

					        <div id="formul4">  
					        	<p class="nombre">Descripción del curso<span class=aster>*</span>:</p>  
						        <p  id="mens4">No ha especificado la descripción del curso*</p>
								<textarea id="añadir-descripcion" name="descripcion" placeholder = "Descripcion del curso"></textarea>
					        </div>
					
							<!-- Precio de matricula -->

					        <div id="formul5">  
					        	<p class="nombre">Precio de matricula<span class=aster>*</span>:</p>  
						        <p  id="mens5">No ha especificado precio de matricula*</p>
						        <input  type="text" name="precio" id="añadir-precio" placeholder = "Precio de matricula"/>
					        </div>

							<div id="formul6">  
					        	<p class="nombre">Recuerde que usted sera el encargado de impartir este curso<span class=aster>*</span>.</p>  
					        </div>

					        <!-- Boton añadir -->

							<input type="submit" id="añadirboton" value="Añadir" />
							</form>
					   	</div>
					</div>
					
				</div>
				
				<div id = "seguidores">
				
					<h5> seguidores </h5>
					
					<ul>
					
						<li>
							<img class = "seguidores-foto" src = "images/famosos/gates.jpg" alt = "Error en la imagen">
							<p class = "seguidores-info">Bill Gates</p></li>
					
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
		
		<script src ="<c:url value="script/empresa-mis-ofertas.js" />" type = "text/javascript" ></script>
		
		
	</body>

</html>