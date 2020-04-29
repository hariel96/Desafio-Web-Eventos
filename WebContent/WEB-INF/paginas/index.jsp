<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri= "http://www.springframework.org/tags"%>
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
</head>
<body>
	<h1>Menu Inicial </h1>
	<hr />
	<a href="${telainicial }">Tela Inicial</a>
	<br/>
	<a href="${cadastrocliente }">Cadastro de Clientes</a>
	<br/>
	<a href="${cadastrocasadeshow }">Cadastro de Casa de Show</a>
	<br/>
	<a href="${cadastroeventos }">Cadastro de Eventos</a>
	<br/>
	<a href="${compraingressos }">Compra de Ingressos</a>
	<br/>
</body>
</html>