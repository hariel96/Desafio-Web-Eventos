<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Área de Cadastro do Cliente</title>
<spring:url value="/cadastrocliente/deleta/" var="deleta"></spring:url>
<spring:url value="/cadastrocliente/altera/" var="altera"></spring:url>
<spring:url value="/cadastrocliente/salva" var="salva"></spring:url>
<link href='<spring:url value="/resources/css/bootstrap.css" />'
	rel="stylesheet" />
<script src='<spring:url value="/resources/js/jquery-3.5.1.min.js" />'></script>
<script src='<spring:url value="/resources/js/bootstrap.js" />'></script>
</head>
<body>
	<jsp:include page="${request.contextPath}/menu"></jsp:include>

	<div class="container mt-5">
		<div class="row">


			<jsp:include page="${request.contextPath}/menuLateral"></jsp:include>

			<div class="col-lg-9">
				<c:if test="${not empty mensagemErro }">
					<div id="divMensagemErro" class="alert alert-danger" role="alert">
						${mensagemErro }</div>
				</c:if>

				<c:if test="${not empty mensagemSucesso }">
					<div id="divMensagemSucesso" class="alert alert-success"
						role="alert">${mensagemSucesso }</div>
				</c:if>

				<div class="pb-2 mt-4 mb-2 border-bottom">
					<h2>Formulário para Cadastro de Clientes</h2>
				</div>

				<form:form action="${salva }" modelAttribute="cliente">
					<form:hidden path="id" />
					<div class="form-group">
						<label>Nome:</label>
						<form:input path="nome" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>CPF:</label>
						<form:input path="cpf" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>E-mail:</label>
						<form:input path="email" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Telefone:</label>
						<form:input path="telefone" cssClass="form-control" />
					</div>


					<form:button>
			${cliente.id == null ?'CADASTRAR': 'Alterar'} 
			</form:button>
				</form:form>



				<c:if test="${not empty cliente }">

					<table class="table table-striped">
						<thead>
							<tr>
								<th>Código</th>
								<th>Nome</th>
								<th>E-mail</th>
								<th>Telefone</th>
								<th colspan="2">Ações</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cliente" items="${clientes }">
								<tr>
									<td>${cliente.id }</td>
									<td>${cliente.nome }</td>
									<td>${cliente.email }</td>
									<td>${cliente.telefone }</td>
									<td><a href="${altera}${cliente.id}">Alterar</a></td>
									<td><a href="${deleta}${cliente.id}"
										onclick="return confirm('Deseja realmente Deletar essa Casa de Show?')">Deletar</a>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</c:if>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#divMensagemErro').delay(5000).fadeOut('slow');
			$('#divMensagemSucesso').delay(5000).fadeOut('slow');
		});
	</script>
</body>
</html>