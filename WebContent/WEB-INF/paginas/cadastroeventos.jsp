<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Área de Cadastro de Eventos</title>
</head>
<body>
	<h1>Formulário para Cadastro de Eventos</h1>
	<hr />
	<form:form action="salva" modelAttribute="evento">
		<form:hidden path="id" />
		<label>Nome:</label>
		<br />
		<form:input path="nome" />
		<br />

		<label>Descrição::</label>
		<br />
		<form:input path="descricao" />
		<br />

		<label>Data:</label>
		<br />
		<form:input path="data" />

		<br />
		<label>Quantidade de Ingressos:</label>
		<br />
		<form:input path="qtd_ingressos" />
		<br />
		<label>Preço:</label>
		<br />
		<form:input path="preco" />
		<br />
		<label for="casaDeshow">ID da Casa de Show:</label>
		<br />
		<input type="number" id="casaDeshow" name="quantity"/>
		<br />
		<br />

		<form:button>Cadastrar</form:button>

	</form:form>
</body>
</html>