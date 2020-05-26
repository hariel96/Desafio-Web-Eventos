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
<title>Tela Inicial dos Eventos</title>
<spring:url value="/" var="volta"></spring:url>
<spring:url value="/telainicial/mostraevento/" var="mostraevento"></spring:url>
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
					<h1>TODOS OS EVENTOS!</h1>
				</div>

				<br />
				<table class="table">
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
							<td><a href="${mostraevento}${evento.id}">Detalhes</a></td>
							<!--<td><a href="mostraevento?id=${evento.id}">DETALHES</a></td>-->
						</tr>
					</c:forEach>

				</table>
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