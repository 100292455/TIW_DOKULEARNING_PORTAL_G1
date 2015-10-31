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
		<link href="<c:url value="/style/empresa-mis-ofertas.css" />" rel="stylesheet" type="text/css" >
		<link href="<c:url value="http://fonts.googleapis.com/css?family=Ubuntu" />" rel='stylesheet' type='text/css'>
		<link href="<c:url value="/script/jquery-ui-1.11.2.custom/jquery-ui.css" />" rel="stylesheet">
		<script src="<c:url value="/script/jquery-ui-1.11.2.custom/external/jquery/jquery.js" />"></script>
		<script src="<c:url value="/script/jquery-ui-1.11.2.custom/jquery-ui.js" />"></script>
		<style type="text/css">
			.error {color: red;}
		</style>
		<link rel="stylesheet" type="text/css" href="style/busqueda.css">
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
				
				<div id = "mi-empresa">
				
					
				
					<h4>MIS CURSOS</h4>
					
					<div id = "ofertas">
						<ul>
							<c:forEach items="${matriculas }" var="matricula">
								<c:if test="${matricula.cod_alumno == usuario.ID_usuario }">
										<c:forEach items="${cursos }" var="curso"> 
											<c:if test="${curso.ID_curso == matricula.cod_curso }">
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
									<p class = "numero-seguidores"><a  href="contenidoCursos?nombreCurso=${curso.DES_titulo }">Ver Contenidos</a></p>
								</div>
								

											</li>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
						</ul>
						<c:if test="${ mensaje != null }">
							<p class="error">${mensaje }</p>
						</c:if>
						
						
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