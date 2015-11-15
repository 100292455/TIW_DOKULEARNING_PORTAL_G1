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
		
		<script src ="<c:url value="script/empresa-mis-ofertas2.js" />" type = "text/javascript" ></script>
		
	</head>
	
			<!-- ******************** TO-DO ******************** -->
			<!-- RESCATAR ID DEL PROFESOR CORRESPONDIENTE Y PASARLO EN EL POST A AltaCursosServlet y BajaCursosServlet -->
			<!-- *********************************************** -->
	
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
			

			<!--CUERPO DE LA PAGINA-->
	
			<section> 
			
			<div id="tabs">
			  <ul>
			    <li><a href="#tabs-1">CURSOS MATRICULADOS</a></li>
			    <li><a href="#tabs-2">CURSOS CREADOS</a></li>
			    <li><a href="#tabs-3">LISTA DE DESEOS</a></li>
			  </ul>
			  <div id="tabs-1">
			  
			  <div class = "mi-empresa">
				
					
				
					<h4>MIS CURSOS</h4>
					
						<ul>
							<c:forEach items="${matriculas }" var="matricula">
								<c:if test="${matricula.cod_alumno.equals(usuario.ID_usuario) }">
										<c:forEach items="${cursos }" var="curso"> 
										
										<!-- El usuario esta inscrito en el curso -->
										
											<c:if test="${curso.ID_curso.equals(matricula.cod_curso) }">
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
																<p class = "ofertas-titulo">${curso.DES_titulo }. </p>
															</c:otherwise>
														</c:choose>
														<p class = "ofertas-empresa">Impartido por: <!-- TO-DO cambiar COD_prof por nombre -->${curso.COD_profesor }</p>
														<p class = "ofertas-resumen">${curso.DES_descripcion }</p>
														<p class = "ofertas-tipo-contrato">${curso.horas } hrs.</p>
														<p class = "ofertas-jornada">Precio inicial: ${curso.precio_inicial } euros.</p>
														<p class = "ofertas-jornada">Precio final: ${curso.precio_final } euros.</p>
														<c:choose>
															<c:when test="${empty curso.fechaFinDescuento }">
															</c:when>
															<c:otherwise>
																<p class = "ofertas-jornada">fin descuento: ${curso.fechaFinDescuento }</p>
															</c:otherwise>
															</c:choose>
									
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
										</c:if>
										
										
									</c:forEach>
									
								</c:if>
							</c:forEach>
							
									<!-- El usuario ha creado el curso -->
					<c:if test="${usuario.tipo_usuario == 1}">
									
									<c:forEach items="${cursos }" var="curso"> 				
										<c:if test="${curso.COD_profesor.equals(usuario.ID_usuario) }">
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
																<p class = "ofertas-titulo">${curso.DES_titulo }. </p>
															</c:otherwise>
														</c:choose>
														<p class = "ofertas-empresa">Impartido por: <!-- TO-DO cambiar COD_prof por nombre -->${curso.COD_profesor }</p>
														<p class = "ofertas-resumen">${curso.DES_descripcion }</p>
														<p class = "ofertas-tipo-contrato">${curso.horas } hrs.</p>
														<p class = "ofertas-jornada">Precio inicial: ${curso.precio_inicial } euros.</p>
														<p class = "ofertas-jornada">Precio final: ${curso.precio_final } euros.</p>
														<c:choose>
															<c:when test="${empty curso.fechaFinDescuento }">
															</c:when>
															<c:otherwise>
																<p class = "ofertas-jornada">fin descuento: ${curso.fechaFinDescuento }</p>
															</c:otherwise>
															</c:choose>
									
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
													<form action="BajaCursos" method="post">
														<input type="hidden" name="IdCurso" value="${curso.ID_curso }">
														<button type="submit">	
															<img class="eliminar-icon" src="images/edicion/trash.png" alt="Error en la imagen">
														</button>
													</form>
												</div>
								

											</li>
										</c:if>
									</c:forEach>	
								</c:if>
						</ul>			  </div> </div>
			  <div id="tabs-2">
						<ul>
							
									<!-- El usuario ha creado el curso -->
					<c:if test="${usuario.tipo_usuario == 1}">
									
									<c:forEach items="${cursos }" var="curso"> 				
										<c:if test="${curso.COD_profesor.equals(usuario.ID_usuario) }">
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
																<p class = "ofertas-titulo">${curso.DES_titulo }. </p>
															</c:otherwise>
														</c:choose>
														<p class = "ofertas-empresa">Impartido por: <!-- TO-DO cambiar COD_prof por nombre -->${curso.COD_profesor }</p>
														<p class = "ofertas-resumen">${curso.DES_descripcion }</p>
														<p class = "ofertas-tipo-contrato">${curso.horas } hrs.</p>
														<p class = "ofertas-jornada">Precio inicial: ${curso.precio_inicial } euros.</p>
														<p class = "ofertas-jornada">Precio final: ${curso.precio_final } euros.</p>
														<c:choose>
															<c:when test="${empty curso.fechaFinDescuento }">
															</c:when>
															<c:otherwise>
																<p class = "ofertas-jornada">fin descuento: ${curso.fechaFinDescuento }</p>
															</c:otherwise>
															</c:choose>
									
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
													<form action="BajaCursos" method="post">
														<input type="hidden" name="IdCurso" value="${curso.ID_curso }">
														<button type="submit">	
															<img class="eliminar-icon" src="images/edicion/trash.png" alt="Error en la imagen">
														</button>
													</form>
												</div>
								

											</li>
										</c:if>
									</c:forEach>	
								</c:if>
						</ul>			  </div>
			  <div id="tabs-3">
			  
			  <!-- Faltan poner los cursos deseados -->
			  <!-- IMPORTANTE -->
			  <!-- 

					---------------------
			  
			   -->
			  
			  </div>
			</div>
				
				<div id = "mi-empresa">
				
					
				
					<h4>MIS CURSOS</h4>
					
					<!-- Usuario con metodo de pago, puede crear curso -->
					<c:if test="${usuario.tipo_usuario == 1 }">
					
						<input type = "button" name = "actualizar" value = "Añadir curso" id = "añadir-oferta1" class = "añadir-oferta añadir-curso">
						<input type = "button"  onclick = "window.location.href='./GestionCupones.jsp'"  name = anadir_cupon" value = "Añadir cupon" id = "añadir-oferta2">
					
					</c:if>
					
					<!-- Usuario con metodo de pago, puede crear curso -->
					
					<c:if test="${usuario.tipo_usuario == 0 }">
					
						<input type = "button" onclick = "window.location.href='./formularioPago.jsp'"  name = anadir_metodo_pago" value = "Crea tu curso" id = "añadir-oferta2">
						<p class = "ofertas-titulo">Empieza a crear cursos, solo tienes que enlazar una cuenta bancaria. </p>

					</c:if>
					
					<div id = "ofertas">
					
					<c:if test="${empty matriculas }">
							<!-- cursos es un atributo metido en el request por eso no es necesario 
							ponerle el prefijo param -->
							<p class="error">No estas registrado en ningun curso.</p>
						</c:if>
						
						<!-- Cursos en los que el usuario se ha matriculado -->
					

						<c:if test="${ mensaje != null }">
							<p class="error">${mensaje }</p>
						</c:if>
						
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
			
							<form action="AltaCursos" method="post" enctype="multipart/form-data">
							
							<div id="formul">  
					        	<p class="nombre">Seleccione una imagen para el curso<span class=aster>*</span>.</p>  
					        </div>
							
							<input type="hidden" name="Curso" size="60" />
							<input type="file" name="file" size="60" /> <br />
							
					        <!-- Titulo del curso -->

					       	<div id="formul1">  
					        	<p class="nombre">Titulo del curso<span class=aster>*</span>:</p>
						        <p  id="mens1">No ha especificado el titulo del curso*</p>
						        <input type="text" name="titulo" id="añadir-titulo"  placeholder = "TÃ­tulo del curso"/>
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

					        <!-- DescripciÃ³n del curso -->

					        <div id="formul4">  
					        	<p class="nombre">DescripciÃ³n del curso<span class=aster>*</span>:</p>  
						        <p  id="mens4">No ha especificado la descripciÃ³n del curso*</p>
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