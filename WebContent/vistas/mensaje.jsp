<%@page import="modelos.Mensaje"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	Mensaje mensaje = (Mensaje) request.getAttribute("mensaje");
%>
<!doctype html>
<html lang="es">

<head>
<!-- Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">
<!-- link: https://remixicon.com -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<!-- https://icons.getbootstrap.com -->
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css">

<title>TecnoTienda</title>
</head>
<body>

	<div class="container mt-5">
		<div class="row py-2 justify-content-center">
			<div class="row  alert alert-<%=mensaje.getTipoMensaje()%>" role="alert">
				<p><%=mensaje.getTextoMensaje()%></p>
			</div>
		</div>
		
			<div class="d-flex  justify-content-around p-2">
	            <a href="<%=mensaje.getRegreso()%>" class="btn btn-info mb-2"> Volver </a>
	        	<a href="Home" class="btn btn-info mb-2"> Ir al Inicio </a>
	        </div>
	</div>

	<!-- Iclude jQuery and Bootstrap Bundle (includes Popper) -->

	<script src="js/jquery-3.5.1.slim.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<!--     <script src="js/elementosPagina.js"></script> -->
	<!--     <script src="js/products.js"></script> -->
	<!--     <script src="js/logIn.js"></script> -->
	<script src="js/iconoCarrito.js"></script>
</body>

</html>