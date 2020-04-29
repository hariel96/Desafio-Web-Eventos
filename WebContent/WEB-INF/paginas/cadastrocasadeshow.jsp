<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Área de Cadastro Cada de Show</title>
</head>
<body>
	<h1>Formulário para Cadastro de Casa de Show</h1>
	<hr />
	<form:form action="salva" modelAttribute="casadeshow">
		<form:hidden path="id" />
		<label>Nome:</label><br/>
		<form:input path="nome"/>
		<br />
		
		<label>Endereço:</label><br/>
		<form:input path="endereco"/>
		<br />
		
		<label>Capacidade:</label><br/>
		<form:input path="capacidade"/>
		<br />
		<br />

		<form:button>Cadastrar</form:button>

	</form:form>

</body>
</html>