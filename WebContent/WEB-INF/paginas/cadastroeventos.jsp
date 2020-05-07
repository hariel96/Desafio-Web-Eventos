<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Área de Cadastro de Eventos</title>
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

h3 {
	font-size: 32px;
	font-family: cursive;
	text-align: left;
}

label {
	font-size: 20px;
}
</style>


</head>
<body>
	<h1>
		<i>Formulário para Cadastro de Eventos</i>
	</h1>
	<hr />
	<form:form action="salva" modelAttribute="evento">
		<form:hidden path="id" />
		<label><b>Nome:</b></label>
		<br />
		<form:input path="nome" />
		<br />

		<label><b>Descrição:</b></label>
		<br />
		<form:input path="descricao" />
		<br />

		<label><b>Data:</b></label>
		<br />
		<form:input path="data" />

		<br />
		<label><b>Quantidade de Ingressos:</b></label>
		<br />
		<form:input path="qtd_ingressos" />
		<br />
		<label><b>Preço:</b></label>
		<br />
		<form:input path="preco" />
		<br />
		<label><b>ID da Casa de Show:</b></label>
		<br />
		<form:input path="casaDeshow" />
		<br />
		<br />

		<form:button style="font-size: 31px">
			<b> ${evento.id == null ?'CADASTRAR' : 'ALTERAR' }</b>
		</form:button>

	</form:form>


	<br />
	<br />
	<h3>
		<a style="color: black" href="${volta }">VOLTAR PARA O MENU
			INICIAL</a>
	</h3>
</body>
</html>