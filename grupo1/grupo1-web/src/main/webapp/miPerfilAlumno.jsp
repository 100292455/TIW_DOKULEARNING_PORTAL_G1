<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Información sobre el documento -->
	
		<title>Perfil Alumno</title>
		<meta name="keywords" content="buscar, trabajo, empleo, salario">
		<meta name="description" content="Web para la busqueda de empleo">
		<meta name="author" content="Mingda Liu Zhang, Alejando Ruiz de la Cuadra, Carlos Herrero Lozano">
	
		<!--Fuente Ubuntu-->
		
		<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
	
		<!--CSS de la pagina-->
		
		<link rel="stylesheet" type="text/css" href="./style/mi-empresa.css">
				
		<!--<script type = "text/javascript" src ="script/myscript.js"></script>-->
		<link href="./script/jquery-ui-1.11.2.custom/jquery-ui.css" rel="stylesheet">

		<script src="./script/jquery-ui-1.11.2.custom/external/jquery/jquery.js"></script>
		<script src="./script/jquery-ui-1.11.2.custom/jquery-ui.js"></script>

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
	            
	        <a href = "listadoCursos.jsp"><p class = "cabecera1" id = "cabecera-usuario">BUSCAR CURSOS</p></a>
	    
	  	  	<p class = "cabecera">|</p>
	            
	        <a href = "sesion?accion=salir"><p class = "cabecera1" id = "cabecera-usuario">SALIR</p></a>
	        
            
	</header>

				<!--MENU-->
			
			
				
			

			<!--CUERPO DE LA PAGINA-->
	
			<section> 
			
				
				<div id = "mi-empresa">
				
					<h4>MI PERFIL</h4>
					
					<form method="post" action="UploadServlet" enctype="multipart/form-data" onsubmit="return actualizarUsuario();">
					
					<div id = "informacion-empresa">
							<div id= "informacion-empresa-imagen">
											
								<img id = "imagen-empresa" src = "./images/famosos/bernard.jpg" alt = "Error en la imagen">
								<p>Para cambiar imagen seleccione un archivo</p>
	       						<input type="file" name="imagen" id="edit-imagen" value="Upload" size ="60"/>
								
								
							</div>
						
							<div id = "informacion-empresa-basica">
								
							
								<h5>Información básica empresa</h5>
							
								<ul>
									<li>Nombre: <br><input id = "edit-nombre" type="text" name="nombre" value="${sessionScope.usuario.nombre}" tabindex="1"></li>
								
									<li>Apellido: <br><input id = "edit-empresa" type="text" name="empresa" value="${sessionScope.usuario.apellido}" tabindex="2"></li>
								
									<li>Teléfono: <br><input id = "edit-telefono" type="text" name="telefono" value="${sessionScope.usuario.telefono}" tabindex="5"></li>
								
									<li>E-Mail: <br><input id = "edit-email" type="text" name="correo" value="${sessionScope.usuario.email}" tabindex="6"></li>

									<li>Intereses: <br><input id = "edit-intereses" type="text" name="intereses" value="${sessionScope.usuario.intereses}" tabindex="7"></li>
														
									<li>Descripcion: <br><textarea name="descripcion" id= "edit-descripcion" >${sessionScope.usuario.descripcion}</textarea></li>
									
								</ul>							
								
							</div>
													
						
				
					</div>
					
					<div id = "dialog-button">
							<input type="submit" id="añadirboton" value="Guardar cambios" />
					</div >	
					
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
		
		<script type = "text/javascript" src ="./script/mi-empresa.js"></script>
</body>
</html>