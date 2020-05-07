<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Casa de Eventos</title>
<spring:url value="telainicial/" var="telainicial"></spring:url>
<spring:url value="cadastrocliente/" var="cadastrocliente"></spring:url>
<spring:url value="cadastrocasadeshow/" var="cadastrocasadeshow"></spring:url>
<spring:url value="cadastroeventos/" var="cadastroeventos"></spring:url>
<spring:url value="compraingressos/" var="compraingressos"></spring:url>
<!--<link rel="stylesheet" href="C:\Users\harie\eclipse-workspace\meu-comercio-desafiostyle.css"> -->

<style>
body {
	background-color: grey;
}

h1 {
	background-color: black;
	font-size: 60px;
	text-align: center;
	color: white;
}

h3 {
	font-size: 28px;
	text-align: left;
	font-family: cursive;
}

a {
	color: black;
}
</style>

</head>
<body>
	<h1>
		<i>Show Mania</i>
	</h1>
	<hr />

	<h3 style="font-size: 35px;">
		<a href="${telainicial }"><strong>Tela de Eventos</strong></a>
	</h3>

	<h3>
		<a href="${cadastrocliente }">Cadastro de Clientes</a>
	</h3>
	<h3>
		<a href="${cadastrocasadeshow }">Cadastro de Casa de Show</a>
	</h3>
	<h3>
		<a href="${cadastroeventos }">Cadastro de Eventos</a>
	</h3>

	<h3>
		<a href="${compraingressos }">Compra de Ingressos</a>
	</h3>

</body>
</html>