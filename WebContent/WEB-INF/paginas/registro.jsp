<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Show mania - Login</title>
	
	<spring:url value="/registra" var="registra"></spring:url>
	
	<link href='<spring:url value="/resources/css/bootstrap.css" />' rel="stylesheet" />
    <script src='<spring:url value="/resources/js/jquery-3.5.1.min.js" />' ></script> 
    <script src='<spring:url value="/resources/js/bootstrap.js" />' ></script>
</head>
<body>
	<div class="container">
		<div id="formContent">
			<!-- Tabs Titles -->
			<c:if test="${not empty mensagemErro }">
				<div id="divMensagemErro" class="alert alert-danger" role="alert">
					${mensagemErro }
				</div>
			</c:if>
			<!-- Icon -->
			<div class="fadeIn first">
				<h2>Show mania - Novo cliente</h2>
			</div>

			<!-- Login Form -->
			<form:form action="${registra}" modelAttribute="cliente">
				<div class="form-group">
					<label>Nome</label> 
					<input type="text" class="form-control"
						name="nome" value="${cliente.nome }" />
				</div>

				<div class="form-group">
					<label>E-mail</label> 
					<input type="email" class="form-control"
						name="email" value="${cliente.email }" />
				</div>

				<div class="form-group">
					<label>Senha</label> 
					<input type="text" class="form-control"
						maxlength="20" name="senha" value="${cliente.senha }" />
				</div>

				<input type="submit" class="btn btn-success" value="Cadastrar">
				
			</form:form>
		</div>
	</div>
</body>
</html>