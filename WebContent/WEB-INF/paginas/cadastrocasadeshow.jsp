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
<title>Área de Cadastro Cada de Show</title>
<spring:url value="/cadastrocasadeshow/deleta/" var="deleta"></spring:url>
<spring:url value="/cadastrocasadeshow/altera/" var="altera"></spring:url>
<spring:url value="/cadastrocasadeshow/salva" var="salva"></spring:url>
<spring:url value="/" var="volta"></spring:url>

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
					<h1>Formulário para Cadastro de Casa de Show</h1>
				</div>

				<form:form action="${salva }" modelAttribute="casadeshow"
					enctype="multipart/form-data" cssClass="mb-2">
					<form:hidden path="id" />
					<form:hidden path="imagemCasaDeShow" />

					<div class="form-group">
						<label>Nome:</label>
						<form:input path="nome" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Endereço:</label>
						<form:input path="endereco" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Capacidade:</label>
						<form:input path="capacidade" cssClass="form-control" />
					</div>

					<div class="form-group">
						<label>Imagem</label>
						<div class="custom-file">
							<input type="file" name="imagem" class="custom-file-input"
								value="${imagemCasaDeShow }" /> <label
								class="custom-file-label">Escolha uma imagem</label>
						</div>
					</div>

					<c:if test="${casaDeShow.id ne 0 }">
						<div class="mb-5">
							<img class="img-thumbnail"
								src="data:image/jpge;base64,${imagemCasaDeShow }"
								alt="imagem não encontrada" />
						</div>
					</c:if>


					<br>
					<form:button>
			${casadeshow.id == null ?'CADASTRAR': 'Alterar'} 
			</form:button>
				</form:form>
				<br>
				<h2>Todas as nossas casas de show já cadastradas:</h2>

				<table class="table">
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
							<td><a href="${altera}${casadeshow.id}">Alterar</a></td>
							<td><a href="${deleta}${casadeshow.id}"
								onclick="return confirm('Deseja realmente Deletar essa Casa de Show?')">Deletar</a>
						</tr>
					</c:forEach>

				</table>

				<br /> <br />



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