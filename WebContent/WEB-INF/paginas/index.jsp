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
<title>Casa de Eventos</title>
<spring:url value="telainicial/" var="telainicial"></spring:url>
<spring:url value="cadastrocliente/" var="cadastrocliente"></spring:url>
<spring:url value="cadastrocasadeshow/" var="cadastrocasadeshow"></spring:url>
<spring:url value="cadastroeventos/" var="cadastroeventos"></spring:url>
<spring:url value="compraingressos/" var="compraingressos"></spring:url>
<link href='<spring:url value="/resources/css/bootstrap.css" />'
	rel="stylesheet" />
<script src='<spring:url value="/resources/js/jquery-3.5.1.min.js" />'></script>
<script src='<spring:url value="/resources/js/bootstrap.js" />'></script>
</head>
<body>
	<jsp:include page="${request.contextPath}/menu"></jsp:include>

	<!-- Page Content -->
	<div class="container mt-5">

		<div class="row">

			<!-- Menu -->
			<jsp:include page="${request.contextPath}/menuLateral"></jsp:include>

			<div class="col-lg-9 mt-5">

				<div class="row">

					<c:forEach var="casadeshow" items="${casasdeshow}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="data:image/jpge;base64,${casadeshow.imagemEncoded}" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">Casa de Show: ${casadeshow.nome}</a>
									</h4>
									<h5>Endereço: ${casadeshow.endereco}</h5>

								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>