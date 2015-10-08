<%@page contentType="text/html; charset=ISO-8859-1"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%="Formulario de Saludos" %>
<form action="saludos" method="post">
<label for="nom">Introduce tu nombre: </label>
<input type="text" id="nom" name="nombre" /></br>
<input type="submit" value="Enviar">
</form>
</body>
</html>