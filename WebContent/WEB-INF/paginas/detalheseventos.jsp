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
<title>Detalhes do Evento</title>
<spring:url value="/telainicial/" var="volta"></spring:url>
<spring:url value="/cadastrocasadeshow/" var="listaCDS"></spring:url>
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
					<div id="divMensagemSucesso" class="alert alert-sucess"
						role="alert">${mensagemSucesso }</div>
				</c:if>

				<div class="pb-2 mt-4 mb-2 border-bottom">
					<h1>Todas as Informações do Evento!</h1>
				</div>


				<form:form action="busca" modelAttribute="evento" enctype="multipart/form-data" cssClass="mb-2">
					<form:hidden path="id" />
					<div class="form-group">
						<h6>NOME DO EVENTO:</h6>
						<label>${evento.nome }</label>
					</div>
					<div class="form-group">
						<h6>DESCRIÇÃO COMPLETA:</h6>
						<label>${evento.descricao }</label>
					</div>
					<div class="form-group">
						<h6>DATA:</h6>
						<label>${evento.data }</label>
					</div>
					<div class="form-group">
						<h6>TOTAL DE INGRESSOS:</h6>
						<label>${evento.qtd_ingressos }</label>
						<!--<textarea rows="3" name="qtd_ingressos" maxlength="200" class="form-control">${evento.qtd_ingressos }</textarea>-->
						<!--<form:input path="qtd_ingressos" cssClass="form-control" />-->
					</div>
					<div class="form-group">
						<h6>PREÇO:</h6>
						<label>${evento.preco }</label>
						<!--<form:input path="preco" cssClass="form-control" />-->
					</div>
					<div class="form-group">
						<h6>ID DA CASA DE SHOW:</h6>
						<label>${evento.casaDeshow }</label>
					</div>
					<br>
				</form:form>

				<h2>
					<a href="${listaCDS }">Lista das casas de show com ID</a>
				</h2>
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