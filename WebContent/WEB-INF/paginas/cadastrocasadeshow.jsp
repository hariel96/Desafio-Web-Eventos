<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Área de Cadastro Cada de Show</title>
<spring:url value="/cadastrocasadeshow/deleta/" var="deleta"></spring:url>
<spring:url value="/cadastrocasadeshow/altera/" var="altera"></spring:url>
<spring:url value="/cadastrocasadeshow/salva" var="salva"></spring:url>
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

h2 {
	background-color: black;
	font-size: 33px;
	color: white;

}

h3 {
	font-size: 32px;
	font-family: cursive;
}

form {
	text-align: left;
	font-size: 19px;
}

form:button {
	font-size: 42px
}

table{
	font-size: 21px;
	
}
</style>


</head>
<body>
	<h1>
		<i>Formulário para Cadastro de Casa de Show</i>
	</h1>
	<hr />
	<form:form action="${salva }" modelAttribute="casadeshow">
		<form:hidden path="id" />
		<label><b>Nome:</b></label>
		<br />
		<form:input path="nome" />
		<br />

		<label><b>Endereço:</b></label>
		<br />
		<form:input path="endereco" />
		<br />

		<label><b>Capacidade:</b></label>
		<br />
		<form:input path="capacidade" />
		<br />
		<br />

		<form:button style="font-size: 21px">
			<b> ${casadeshow.id == null ?'CADASTRAR': 'Alterar'} </b>
		</form:button>
	</form:form>
	<hr />
	<h2>
		<b>Todas as nossas casas de show já cadastradas:</b>
	</h2>
	
	<table>
		<tr>
			<th>ID:</th>
			<th>Nome:</th>
			<th>Endereço:</th>
			<th>Capacidade:</th>
			<th colspan="2">Ações:</th>
		</tr>

		<c:forEach var="casadeshow" items="${casasdeshow }">
			<tr>
				<td>${casadeshow.id }</td>
				<td>${casadeshow.nome }</td>
				<td>${casadeshow.endereco }</td>
				<td>${casadeshow.capacidade }</td>
				<td><a style="color: blue" href="${altera}${casadeshow.id}"><i>Alterar</i></a></td>
				<td><a style="color: blue" href="${deleta}${casadeshow.id}"><i>Deletar</i></a>
			</tr>
		</c:forEach>

	</table>

	<br />
	<br />


	<h3>
		<a style="color: black" href="${volta }">VOLTAR PARA O MENU INICIAL</a>
	</h3>

</body>
</html>