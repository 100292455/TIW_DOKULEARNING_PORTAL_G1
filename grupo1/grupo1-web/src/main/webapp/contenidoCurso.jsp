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
					
					<div id = "ofertas">
						<ul>
							<c:forEach items="${cursos }" var="curso">
								<c:if test="${curso.ID_curso == idCurso }">
										<h4>${curso.DES_titulo }</h4>
										<c:forEach items="${secciones }" var="seccion"> 
											<c:if test="${seccion.id_curso == idCurso }">
												<p class = "ofertas-titulo">${seccion.nombre }</p>
												<c:forEach items="${lecciones }" var="leccion">
												<c:if test="${seccion.id_seccion == leccion.id_seccion }"> 
												<li id = "oferta-ejemplo">
													<div class = "ofertas-descripcion">
														<p class = "ofertas-jornada">Leccion: ${leccion.titulo }.</p>
														<p class = "ofertas-jornada">Descripcion leccion: ${leccion.des }</p>
													</div>
												</li>
												</c:if>
												</c:forEach>
											</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
						</ul>

						
						
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