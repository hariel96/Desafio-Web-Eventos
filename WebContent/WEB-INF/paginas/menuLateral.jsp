<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url value="/compraingressos" var="compraingressos"></spring:url>
<spring:url value="/cadastrocasadeshow" var="cadastrocasadeshow"></spring:url>
<spring:url value="/cadastrocliente" var="cadastrocliente"></spring:url>
<spring:url value="/telainicial" var="telainicial"></spring:url>
<spring:url value="/cadastroeventos" var="cadastroeventos"></spring:url>
	
<div class="col-lg-3 mt-5">

	<!-- <h1 class="my-4">Loja Resource</h1> -->
	<div class="list-group">
		<a href="${telainicial }" class="list-group-item">Todos os Eventos</a>
		<a href="${compraingressos }" class="list-group-item">Compra de Ingressos</a>
		<a href="${cadastrocliente }" class="list-group-item">Cadastro de Clientes</a>
		<a href="${cadastrocasadeshow }" class="list-group-item">Cadastro de Casa de Show</a>
		<a href="${cadastroeventos }" class="list-group-item">Cadastro de Eventos</a>
	</div>

 </div>