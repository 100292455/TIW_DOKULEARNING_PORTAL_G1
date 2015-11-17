<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>


		<!-- Información sobre el documento -->
	
		<title>Practica TIW: Mis Cursos</title>
		<meta charset="UTF-8">
		<meta name="keywords" content="e-learning, cursos">
		<meta name="description" content="Web de cursos matriculados">
		<meta name="author" content="Jorge Garcia de la Rosa">
		
		<!--CSS de la pagina-->
		
		<link rel="stylesheet" type="text/css" href="./style/empresa-mis-ofertas.css">
		
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
			
			<div id="tabs">
			
			  <ul>
			    <li><a href="#tabs-1">CURSOS MATRICULADOS</a></li>
			    <li><a href="#tabs-2">CURSOS CREADOS</a></li>
			    <li><a href="#tabs-3">LISTA DE DESEOS</a></li>
			  </ul>
			  
			  <!-- CURSOS MATRICULADOS -->
			  
			  <div id="tabs-1">
			 	<div class = "mi-empresa">
				<h4>CURSOS MATRICULADOS</h4>
						<ul>
							<c:forEach items="${cursosmatriculados }" var="curso">
								<li id = "oferta-ejemplo${curso.ID_curso}">
									<div class = "ofertas-descripcion">
										<!-- Descripcion de ofertas -->
										<p class = "ofertas-titulo">${curso.DES_titulo }</p>
										<p class = "ofertas-empresa">Impartido por: <!-- TO-DO cambiar COD_prof por nombre -->${curso.COD_profesor }</p>
										<p class = "ofertas-resumen">${curso.DES_descripcion }</p>
										<p class = "ofertas-tipo-contrato">${curso.horas } hrs.</p>
										<p class = "ofertas-jornada">Precio inicial: ${curso.precio_inicial } euros.</p>
										<p class = "ofertas-jornada">Precio final: ${curso.precio_final } euros.</p>
										<c:if test="${not empty curso.fechaFinDescuento }">
												<p class = "ofertas-jornada">fin descuento: ${curso.fechaFinDescuento }</p>
										</c:if>
										<c:choose>
											<c:when test="${curso.TIPO_dificultad == 0 }">
											<p class = "ofertas-salario">Basico.</p>
										</c:when>
										<c:when test="${curso.TIPO_dificultad == 1 }">
											<p class = "ofertas-salario">Intermedio.</p>
										</c:when>
										<c:otherwise>
											<p class = "ofertas-salario">Avanzado.</p>
										</c:otherwise>
										</c:choose>
									</div>
									<div class = "ofertas-seguidores">
										<img src = "images/edicion/seguidores-icon.png" alt = "Error en la imagen">
										<p class = "numero-seguidores"><a href="contenidoCurso?nombreCurso=${curso.DES_titulo }">Ver Contenidos</a></p>
									</div>
								</li>															
							</c:forEach>
						</ul>			 
					</div> 
				</div>
				
				<!-- CURSOS CREADOS -->
			  
			  <div id="tabs-2">
			 	<div id = "mi-empresa">
				<h4>CURSOS CREADOS</h4>
					<!-- Usuario con metodo de pago, puede crear curso -->

					<c:if test="${usuario.tipo_usuario == 1 }">
					
						<input type = "button" name = "actualizar" value = "Añadir curso" id = "añadir-oferta1" class = "añadir-oferta añadir-curso">
						<input type = "button"  onclick = "window.location.href='./GestionCupones.jsp'"  name = anadir_cupon" value = "Añadir cupon" id = "añadir-oferta2">
						<input type="hidden" id="selectedTabInput" value="${requestScope.selectedTab}">
					</c:if>
					
					<!-- Usuario con metodo de pago, puede crear curso -->
					
					<c:if test="${usuario.tipo_usuario == 0 }">
					
						<input type = "button" onclick = "window.location.href='./formularioPago.jsp'"  name = anadir_metodo_pago" value = "Crea tu curso" id = "añadir-oferta2">
						<p class = "ofertas-titulo">Empieza a crear cursos, solo tienes que enlazar una cuenta bancaria. </p>

					</c:if>
					
					<c:if test="${ mensaje != null }">
							<p class="error">${mensaje }</p>
					</c:if>
					
					<!-- Lista de cursos creados -->
						<ul>
							<c:forEach items="${cursoscreados }" var="curso">
								<li id = "oferta-ejemplo${curso.ID_curso}">
									<div class = "ofertas-descripcion">
										<!-- Descripcion de ofertas -->
										<p class = "ofertas-titulo">${curso.DES_titulo }</p>
										<p class = "ofertas-empresa">Impartido por: <!-- TO-DO cambiar COD_prof por nombre -->${curso.COD_profesor }</p>
										<p class = "ofertas-resumen">${curso.DES_descripcion }</p>
										<p class = "ofertas-tipo-contrato">${curso.horas } hrs.</p>
										<p class = "ofertas-jornada">Precio inicial: ${curso.precio_inicial } euros.</p>
										<p class = "ofertas-jornada">Precio final: ${curso.precio_final } euros.</p>
										<c:if test="${not empty curso.fechaFinDescuento }">
												<p class = "ofertas-jornada">fin descuento: ${curso.fechaFinDescuento }</p>
										</c:if>
										<c:choose>
											<c:when test="${curso.TIPO_dificultad == 0 }">
											<p class = "ofertas-salario">Basico.</p>
										</c:when>
										<c:when test="${curso.TIPO_dificultad == 1 }">
											<p class = "ofertas-salario">Intermedio.</p>
										</c:when>
										<c:otherwise>
											<p class = "ofertas-salario">Avanzado.</p>
										</c:otherwise>
										</c:choose>
									</div>
									<div class = "ofertas-seguidores">
										<img src = "images/edicion/seguidores-icon.png" alt = "Error en la imagen">
										<p class = "numero-seguidores"><a  href="contenidoCurso?nombreCurso=${curso.DES_titulo }">Ver Contenidos</a></p>
									</div>
									<div class = "ofertas-edicion">
										<form action="BajaCursos" method="post" onsubmit="false">
											<input type="hidden" name="IdCurso" value="${curso.ID_curso }">
											<button id ="delete-openner" type="submit">	
												<img class="eliminar-icon" src="images/edicion/trash.png" alt="Error en la imagen">
											</button>
										</form>
									</div>
								</li>
							</c:forEach>						
						</ul>
						
						<!-- Crear un curso nuevo -->
									 
						<div id="añadir">

					        <h2> Añade un nuevo curso </h2>  
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
			
							<form action="AltaCursos" method="post" enctype="multipart/form-data" id ="añadir-form" onsubmit="return validarcrearcurso();">
								
								<div> 
								<!-- Titulo del curso -->
	
							       	<div id="formul1">  
							        	<p class="nombre">Titulo del curso<span class=aster>*</span>:</p>
								        <p  id="mens1">No ha especificado el titulo del curso*</p>
								        <input type="text" name="titulo" id="añadir-titulo"  placeholder = "Titulo del curso"/>
							      	</div>		
							      	
								 <!-- Dificultad del curso -->

							        <div id="formul3">  
								        <p class="nombre">Dificultad del curso<span class=aster>*</span>:</p> 
								        <p  id="mens2">No ha especificado la dificultad del curso*</p>
								        <select name="dificultad" id="dificultad-curso">
								        	<option value="-1" selected>Especifique dificultad del curso</option>
		  									<option value="0">Basico</option>
		  									<option value="1">Intermedio</option>
		  									<option value="2">Avanzado</option>
										</select> 
							        </div>
					        	</div>
					        	
					        	<div> 
								<!-- Horas del curso -->

							        <div id="formul2">  
							        	<p class="nombre">Horas de dedicacion del curso<span class=aster>*</span>:</p>  
							        	<p  id="mens3">Falta especificar el numero de horas del curso*</p>
								        <input id="spinner" name="horas" >
							        </div>		
									      	
								<!-- Precio de matricula -->

							        <div id="formul5">  
							        	<p class="nombre">Precio de matricula<span class=aster>*</span>:</p>  
								        <p  id="mens5">No ha especificado precio de matricula*</p>
								        <input  type="text" name="precio" id="añadir-precio" placeholder = "Precio de matricula"/>
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

							<input type="submit" id="añadirboton" value="Añadir" />
							</form>
					   	</div>
					</div> 
				</div>				
				
			 
 			<!-- LISTA DE DESEOS -->
			  
			  <div id="tabs-3">
			 	<div class = "mi-empresa">
				<h4>LISTA DE DESEOS</h4>
						<ul>
							<c:forEach items="${listadeseos }" var="curso">
								<li id = "oferta-ejemplo${curso.ID_curso}">
									<div class = "ofertas-descripcion">
										<!-- Descripcion de ofertas -->
										<p class = "ofertas-titulo">${curso.DES_titulo }</p>
										<p class = "ofertas-empresa">Impartido por: <!-- TO-DO cambiar COD_prof por nombre -->${curso.COD_profesor }</p>
										<p class = "ofertas-resumen">${curso.DES_descripcion }</p>
										<p class = "ofertas-tipo-contrato">${curso.horas } hrs.</p>
										<p class = "ofertas-jornada">Precio inicial: ${curso.precio_inicial } euros.</p>
										<p class = "ofertas-jornada">Precio final: ${curso.precio_final } euros.</p>
										<c:if test="${not empty curso.fechaFinDescuento }">
												<p class = "ofertas-jornada">fin descuento: ${curso.fechaFinDescuento }</p>
										</c:if>
										<c:choose>
											<c:when test="${curso.TIPO_dificultad == 0 }">
											<p class = "ofertas-salario">Basico.</p>
										</c:when>
										<c:when test="${curso.TIPO_dificultad == 1 }">
											<p class = "ofertas-salario">Intermedio.</p>
										</c:when>
										<c:otherwise>
											<p class = "ofertas-salario">Avanzado.</p>
										</c:otherwise>
										</c:choose>
									</div>
									<div class = "ofertas-seguidores">
										<img src = "images/edicion/seguidores-icon.png" alt = "Error en la imagen">
										<p class = "numero-seguidores"><a  href="contenidoCurso?nombreCurso=${curso.DES_titulo }">Ver Contenidos</a></p>
									</div>
								</li>
							</c:forEach>
						</ul>			 
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