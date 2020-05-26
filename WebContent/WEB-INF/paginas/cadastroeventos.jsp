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
<title>Área de Cadastro de Eventos</title>
<spring:url value="/cadastroeventos/salva" var="salva"></spring:url>

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
					<h1>Formulário para Cadastro de Eventos</h1>
				</div>


				<form:form action="${salva }" modelAttribute="evento">
					<form:hidden path="id" />
					<div class="form-group">
						<label>Nome:</label>
						<form:input path="nome" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Descrição:</label>
						<form:input path="descricao" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Data:</label>
						<!--<form:input path="data" cssClass="form-control" />-->
						<input type="date" class="form-control" name="data" value="${evento.data }"/>
					</div>
					<div class="form-group">
						<label>Quantidade de Ingressos:</label>
						<form:input path="qtd_ingressos" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Preço:</label>
						<form:input path="preco" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>ID da Casa de Show:</label>
						<input id="id" name="id" class="form-control" />
					</div>

					<!--<div class="form-group">
				<label>Imagem</label>
				<div class="custom-file">
					<input type="file" name="imagem" class="custom-file-input"
						value="${imagemEvento }" /> <label class="custom-file-label">Escolha
						uma imagem</label>
				</div>
			</div> -->

					<br>
					<form:button>
			 ${evento.id == null ?'CADASTRAR' : 'ALTERAR' }
		</form:button>

				</form:form>

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