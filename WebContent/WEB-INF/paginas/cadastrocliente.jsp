<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Área de Cadastro do Cliente</title>
</head>
<body>
	<h1>Formulário para Cadastro de Clientes</h1>
	<hr />
	<form:form action="salva" modelAttribute="cliente">
		<form:hidden path="id" />
		<label>Nome:</label><br/>
		<form:input path="nome"/>
		<br />
		
		<label>CPF:</label><br/>
		<form:input path="cpf"/>
		<br />
		
		<label>E-mail:</label><br/>
		<form:input path="email"/>
		<br />
		
		<label>Telefone:</label><br/>
		<form:input path="telefone"/>
		<br />
		<br />
		

		<form:button>Cadastrar</form:button>

	</form:form>
</body>
</html>