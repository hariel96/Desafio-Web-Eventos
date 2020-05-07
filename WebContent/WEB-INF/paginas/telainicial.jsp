<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tela Inicial dos Eventos</title>
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
	text-align: left;
	font-family: cursive;
	font-size: 26px;
}

table {
	text-align: left;
	font-size: 23px;
}

th { 
	font-size: 35px;
	font-family: serif;
}
</style>

</head>
<body>
	<h1>TODOS OS EVENTOS!</h1>
	<hr />
	<br />
	<table>
		<tr>
			<th>NOME:<br />
			</th>
			<th>PREÇO:<br />
			</th>
			<th>MAIORES INFORMAÇÕES:<br /> 
			</th>
		</tr>

		<c:forEach var="evento" items="${eventos }">
			<tr>
				<td>${evento.nome }</td>
				<td>${evento.preco }</td>
				<td><a style="color: blue" href="mostraevento?id=${evento.id}"><i>Detalhes</i></a></td>
			</tr>
		</c:forEach>

	</table>

	<br />
	<br />
	<h3>
		<a style="color: black" href="${volta }">VOLTAR PARA O MENU
			INICIAL</a>
	</h3>


</body>
</html>