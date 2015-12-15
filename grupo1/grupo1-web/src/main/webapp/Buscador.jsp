<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
		<head>
		
		<!-- Informacion sobre el documento -->
		
		<title>Practica final: Busqueda</title>
		<meta name="description" content="Buscador">
		<meta name="author" content="Miguel Solera">
		<link rel="icon" href="images/logo.png">
		
		<!--Fuente Ubuntu-->
		
		<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
		
		<!--CSS de la pagina-->
		
		<link rel="stylesheet" type="text/css" href="./style/busqueda.css">
		<link href="http://fonts.googleapis.com/css?family=Ubuntu" rel='stylesheet' type='text/css'>
		<link href="/script/jquery-ui-1.11.2.custom/jquery-ui.css" rel="stylesheet">
		<script src="/script/jquery-ui-1.11.2.custom/external/jquery/jquery.js"></script>
		<script src="/script/jquery-ui-1.11.2.custom/jquery-ui.js"></script>
		
		<style type="text/css">
		.error {
			color: red;
		}
		</style>
		
		</head>


	<body>
	
		<jsp:include page="cabecera.jsp" flush="true"/>
	
		<!--MENU-->
	
		<!--CUERPO DE LA PAGINA-->
		<div class="buscador">
			
			<!-- Titulo -->
			
			<div class="buscador_cabecera">
				<h3 id="buscador_cabecera_texto">Buscador de Cursos</h1>
			</div>
			
			<!-- Formulario -->
			
			<form action="BuscarCursos" method="post">
				<ul>
					<li class="buscador_elemento">
						<p>Tematica:</p>
						<input type="text" name="filtroTematica" id="filtroPuesto" size="20" />
					</li>
					<li class="buscador_elemento">
						<p>Dificultad:</p>
						<select name="filtroDificultad" id="filtroCategoria" class="select_menu">
							<option value="-1" class="drop">-- Seleccione tipo de
								Dificultad --</option>
							<option value="0" class="drop">Basico</option>
							<option value="1" class="drop">Intermedio</option>
							<option value="2" class="drop">Avanzado</option>
						</select>
					</li>
					<li class="buscador_elemento">
						<p>Precio:</p>
						<input type="text" name="filtroPrecio" id="filtroExperiencia" size="20" value="0"/> 
					</li>
				</ul>
				
				<input type="submit" id="buscador_boton" value="Filtrar" />
				
			</form>
			
			
			<c:choose>
				<c:when test="${empty cursos}">
					<p class="error">No se encontraron coincidencias.</p>
				</c:when>
				<c:otherwise>
					<p class="error">${mensaje }</p>
					<ul id="cursos-bucador">
						<c:forEach items="${cursos }" var="curso">
						
							<!-- recorremos todos los objetos de la coleccion cursos 
								y cada objeto devuelto lo asignamos a la variable curso -->
	
							<li id="oferta-ejemplo${curso.ID_curso}">
									<c:choose>
										<c:when test="${curso.TIPO_estado == 2 }">
											<div class="ofertas-descripcion">
												<p class="ofertas-titulo">${curso.DES_titulo }</p>
												<p class="ofertas-empresa">Impartido por: ${curso.profesor.nombre }</p>
												<p class="ofertas-resumen">${curso.DES_descripcion }</p>
												<p class="ofertas-tipo-contrato">${curso.horas }hrs.</p>
												<p class="ofertas-jornada">Precio inicial: ${curso.precio_inicial } €.</p>
												<p class="ofertas-jornada">Precio final: ${curso.precio_final } €.</p>
												<c:choose>
													<c:when test="${empty curso.fechaFinDescuento }">
													</c:when>
													<c:otherwise>
														<p class="ofertas-jornada">fin descuento: ${curso.fechaFinDescuento }</p>
													</c:otherwise>
												</c:choose>
		
												<c:choose>
													<c:when test="${curso.TIPO_dificultad == 0 }">
														<p class="ofertas-salario">Basico.</p>
													</c:when>
													<c:when test="${curso.TIPO_dificultad == 1 }">
														<p class="ofertas-salario">Intermedio.</p>
													</c:when>
													<c:otherwise>
														<p class="ofertas-salario">Avanzado.</p>
													</c:otherwise>
												</c:choose>
											</div>
											
											<div class = "ofertas-seguidores">
													<img src = "images/edicion/seguidores-icon.png" alt = "Error en la imagen">
													<p class = "numero-seguidores"><a href="contenidoCursos?nombreCurso=${curso.DES_titulo }">Ver Contenidos</a></p>
											</div>											
	
											<c:choose>
												<c:when test="${empty sessionScope.listadeseos }">
													<div class="ofertas-edicion">
														<a href="GestionDeseados?IdCurso=${curso.ID_curso }&Pagina=Buscador&Tipo=Alta">
															<img src="images/deseado.png" alt="Error en la imagen">
															<p>Añadir a deseados</p>
														</a>
													</div>
												</c:when>
												<c:otherwise>
													<c:set var="encontrado" value="0" />
														<c:forEach items="${sessionScope.listadeseos }" var="deseo">
															<c:choose>
																<c:when test="${curso.ID_curso == deseo.cursoDeseado.ID_curso}">
																 </c:when>
																 <c:otherwise> </c:otherwise>
															</c:choose>	
														</c:forEach>
														<c:choose>
															<c:when test="${encontrado == 1}">
															</c:when>
															<c:otherwise>
																<div class="ofertas-edicion">
																	<a href="GestionDeseados?IdCurso=${curso.ID_curso }&Pagina=Buscador&Tipo=Alta">
																		<img src="images/deseado.png" alt="Error en la imagen">
																		<p>Añadir a deseados</p>
																	</a>
																</div>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
										</c:when>
	
										<c:otherwise>
											<p class="error">El curso ${curso.DES_titulo } esta
												pendiente de validacion</p>
										</c:otherwise>
	
									</c:choose>
							</li>
	
						</c:forEach>
					</ul>
				</c:otherwise> 
			</c:choose>
		</div>
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
				
		<script src="script/empresa-mis-ofertas2.js"  type="text/javascript"></script>
		
	</body>

</html>