<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>S&iaacute; escribo yo</h1>
<!-- El lenguaje de expresiones sustituye al c&oacute;digo java como:
	request.getParameter("nombre")
 -->
<h2>Saludos ${param.nombre }</h2>

<%="Seguro que no te llamas "+request.getAttribute("miAtributo")  %> <!--  esta forma de incluir codigo java es antigua aunque sigue siendo funcional es mejor usar taglibs 
y esto se podria sustituir por ${miAtributo}
 -->
</body>
</html>