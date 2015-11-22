<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>


		<!-- Información sobre el documento -->
	
		<title>Practica TIW: Contenido Curso</title>
		<meta charset="UTF-8">
		<meta name="keywords" content="e-learning, cursos">
		<meta name="description" content="Web de cursos en linea">
		<meta name="author" content="Jorge Garcia de la Rosa">
		<link href="<c:url value="/style/usuario-contenido-curso.css" />" rel="stylesheet" type="text/css" >
		<link href="<c:url value="http://fonts.googleapis.com/css?family=Ubuntu" />" rel='stylesheet' type='text/css'>
		<link href="<c:url value="/script/jquery-ui-1.11.2.custom/jquery-ui.css" />" rel="stylesheet">
		<script src="<c:url value="/script/jquery-ui-1.11.2.custom/external/jquery/jquery.js" />"></script>
		<script src="<c:url value="/script/jquery-ui-1.11.2.custom/jquery-ui.js" />"></script>
		<style type="text/css">
			.error {color: red;}
		</style>
	</head>
	

	
	<body>
		
	<header>
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
				
				<div id = "mi-empresa">
					
					<h4>MIS CURSOS - ${nombreCurso}</h4>
					<div id = "crear-curso">
						<input type = "button"  value = "Anadir cupon"  class = "anadir-cupon" id="boton-anadir-cupon">
						<input type = "button"  value = "Anadir seccion"  class = "anadir-cupon" id="boton-anadir-seccion">
					</div>
					<div id = "descripcion-curso">
						<p>Profesor: Javier</p>
						<p>4 alumnos</p>
						<p>Actualmente, todas las ciencias aportan problemas que son estudiados por matemáticos, al mismo tiempo que aparecen nuevos problemas dentro de las propias matemáticas. Por ejemplo, el físico Richard Feynman propuso la integral de caminos como fundamento de la mecánica cuántica, combinando el razonamiento matemático y el enfoque de la física, pero todavía no se ha logrado una definición plenamente satisfactoria en términos matemáticos. Similarmente, la teoría de cuerdas, una teoría científica en desarrollo que trata de unificar las cuatro fuerzas fundamentales de la física, sigue inspirando a las más modernas matemáticas.</p>
					</div>
					<c:forEach items="${secciones }" var="seccion">
						<ul class ="lista-seccion">
							<p>${seccion.nombre }</p>
							<input type = "button"  value = "Añadir leccion"  class = "añadir-leccion">
							<c:forEach items="${lecciones }" var="leccion">
								<c:if test="${leccion.id_seccion.equals(seccion.id_seccion)}">
									<li>
										<img class = "leccion" src="images/formatos/${leccion.formato}.png" alt="Error en la imagen"> 
										<p class = "leccion">${leccion.titulo }</p>
										<input type = "button"  value = "Borrar"  class = "borrar-leccion">
									</li>	
								</c:if>			
							</c:forEach>
						</ul>
					</c:forEach>
				</div>
				
				<!-- Crear un leccion nuevo -->
									 
						<div id="añadir-leccion">

					        <h2> Añade una nueva leccion </h2>  
							<!-- 				
							<div id="formul">  
					        	<p class="nombre">Seleccione una imagen para el curso<span class=aster>*</span>.</p>  
					        </div>
							<form action="UploadCursoImagesServlet" method="post" enctype="multipart/form-data">
								<input type="hidden" name="Curso" size="60" />
								<input type="file" name="file" size="60" /> <br />
								<input type="submit" value="Cargar Imagen" />
							</form>
							<!-- ***************************************************************** -->
			
							<form action="AltaLeccion" method="post" enctype="multipart/form-data" id ="añadir-leccion-form" onsubmit="return validarcrearleccion();">
								
								<div> 
								<!-- Titulo del curso -->
	
							       	<div id="formul1">  
							        	<p class="nombre">Titulo de la leccion<span class=aster>*</span>:</p>
								        <p  id="mens1">No ha especificado el titulo de la leccion*</p>
								        <input type="text" name="titulo" id="titulo-leccion"  placeholder = "Titulo de la leccion"/>
							      	</div>		
							      	
								 <!-- Formato de la leccion -->

							        <div id="formul3">  
								        <p class="nombre">Formato de la leccion<span class=aster>*</span>:</p> 
								        <p  id="mens2">No ha especificado el formato de la leccion*</p>
								        <select name="formato" id="formato-leccion">
								        	<option value="otro" selected>Especifique el formato de la leccion</option>
		  									<option value="txt">Archivo txt</option>
		  									<option value="doc">Archivo doc</option>
		  									<option value="docx">Archivo docx</option>
		  									<option value="xls">Archivo excel</option>
		  									<option value="ppt">Archivo pdf</option>
		  									<option value="mp4">Video en mp4</option>
		  									<option value="m4v">Video en m4v</option>
											<option value="mp3">Audio en mp3</option>
										</select> 
							        </div>
					        	</div>
					        	
								
								
								<!-- Importar imagen -->
								
								
								<div id="formul">  
						        	<p class="nombre">Seleccione una imagen para el curso<span class=aster>*</span>.</p>  
									<input type="hidden" name="Curso" size="60" />
									<input type="file" name="file" size="60" /> <br />
								 </div>
								 

					        <!-- Descripcion del curso -->

					        <div id="formul4">  
					        	<p class="nombre">Descipcion del curso<span class=aster>*</span>:</p>  
						        <p  id="mens4">No ha especificado la descripcion del curso*</p>
								<textarea id="añadir-descripcion" name="descripcion" placeholder = "Descripcion del curso"></textarea>
					        </div>
					
							

							<div id="formul6">  
					        	<p class="nombre">Recuerde que usted sera el encargado de impartir este curso<span class=aster></span>.</p>  
					        </div>

					        <!-- Boton añadir -->

							<input type="submit" id="añadir-leccion-button" value="Añadir" />
							</form>
					   	</div>
					   	
					   		<!-- Crear un leccion nuevo -->
									 
						<div id="anadir-cupon">

					        <h2> Añade un nuevo cupon </h2>  

							<form action="AltaCupon" method="post" enctype="multipart/form-data" id ="anadir-cupon-form" onsubmit="return validarcrearcupon();">
								
								<div> 
								<!-- Precio cupon -->
	
							       	<div id="formul7">  
							        	<p class="nombre">Precio de descuento<span class=aster>*</span>:</p>  
								        <p  id="mens7">No ha especificado precio de descuento*</p>
								        <input  type="text" name="precio-descuento" id="cupon-precio-descuento" value ="0">
							        </div>		
							      	
								 <!-- Formato del cupon -->

							        <div id="formul8">  
								        <p class="nombre">Formato cupon<span class=aster>*</span>:</p> 
								        <p  id="mens8">No ha especificado el formato del cupon*</p>
								        <select name="formato-cupon" id="formato-cupon">
								        	<option value="otro" selected>Sin especificar</option>
		  									<option value="fijo">Fijo</option>
		  									<option value="porcentaje">Porcentaje</option>
										</select> 
							        </div>
					        	</div>
					        	
								
								
								<!-- Fecha fin de cupon -->
								
								
								<div id="formul9">
						        	<p class="nombre">Fecha fin de cupon<span class=aster>*</span>.</p>  
							        <p  id="mens9">No ha especificado el formato de la leccion*</p>  
									<input type="text" id="datepicker">
								 </div>
								 
					        <!-- Boton añadir -->

							<input type="submit" id="crear-cupon-boton" value="Anadir" />
							</form>
					   	</div>
					   	
					   	<div id="anadir-seccion">

					        <h2> Añade una nueva seccion </h2>  

							<form action="AltaCupon" method="post" enctype="multipart/form-data" id ="anadir-seccion-form" onsubmit="return validarcrearseccion();">
								
								<!-- Nombre seccion -->
	
							       	<div id="formul10">  
							        	<p class="nombre">Nombre de la seccion<span class=aster>*</span>:</p>  
								        <p  id="mens10">No ha especificado el nombre de la seccion*</p>
								        <input  type="text" name="nombre-seccion" id="nombre-seccion" placeholder="Seccion 1">
							        </div>		
								 
					        <!-- Boton añadir -->

							<input type="submit" id="crear-seccion-boton" value="Anadir" />
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
		
		<script src ="<c:url value="script/empresa-mis-ofertas2.js" />" type = "text/javascript" ></script>
		
		
	</body>

</html>