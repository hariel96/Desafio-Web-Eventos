<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Falha de acesso</title>
	
	<link href='<spring:url value="/resources/css/bootstrap.css" />' rel="stylesheet" />
    <script src='<spring:url value="/resources/js/jquery-3.5.1.min.js" />' ></script> 
    <script src='<spring:url value="/resources/js/bootstrap.js" />' ></script>
</head>
<body>
	<div class="container py-5">
		<div class="row">
			<div class="col-md-12">
				<h3>Acesso Negado!</h3>
				<p>
					Desculpe, seu acesso foi negado pelas nossas políticas de segurança.<br />
					Por favor volte a tela anterior e continue navegando.
				</p>
				<a class="btn btn-danger" href="javascript:history.back()">Voltar</a>
			</div>
		</div>
	</div>
</body>
</html>