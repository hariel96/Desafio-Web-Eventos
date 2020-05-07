<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Área de Cadastro do Cliente</title>
<spring:url value="/" var="volta"></spring:url>
<style>
body {
	background-color: grey;
	text-align: left;
	font-family: cursive;
}

h1 {
	text-align: center;
	background-color: black;
	font-size: 50px;
	color: white;
	font-family: fantasy;
}

label {
	font-size: 20px;
}

h3 {
	text-align: left;
	font-family: cursive;
	font-size: 26px;
}
</style>

</head>
<body>
	<h1>
		<i>Formulário para Cadastro de Clientes</i>
	</h1>
	<hr />

	<form:form action="salva" modelAttribute="cliente">
		<form:hidden path="id" />
		<label><b>Nome:</b></label>
		<br />
		<form:input path="nome" />
		<br />

		<label><b>CPF:</b></label>
		<br />
		<form:input path="cpf" />
		<br />

		<label><b>E-mail:</b></label>
		<br />
		<form:input path="email" />
		<br />

		<label><b>Telefone:</b></label>
		<br />
		<form:input path="telefone" />
		<br />
		<br />

		<form:button style="font-size: 31px">
			<b>CADASTRAR</b>
		</form:button>

	</form:form>
	<br />
	<br />
	<br />

	<h3>
		<a style="color: black" href="${volta }">VOLTAR PARA O MENU
			INICIAL</a>
	</h3>

</body>
</html>