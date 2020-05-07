<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Compra de Ingressos</title>
<spring:url value="/" var="volta"></spring:url>

<style>
body {
	background-color: grey;
	text-align: center;
	font-family: cursive;
}

h1 {
	background-color: black;
	font-size: 50px;
	color: white;
	font-family: fantasy;
}

h3 {
	font-size: 32px;
	font-family: cursive;
}
</style>


</head>
<body>
	<h1>
		<i>Área de Compra de Ingressos</i>
	</h1>

	<br/>
	<br/>
	<h3>
		<a style="color: black" href="${volta }">VOLTAR PARA O MENU
			INICIAL</a>
	</h3>

</body>
</html>