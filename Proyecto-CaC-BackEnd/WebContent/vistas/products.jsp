<%@page import="modelos.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Producto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	Usuario usuario = (Usuario) session.getAttribute("usuario");
List<Producto> productos = (List<Producto>) session.getAttribute("productos");
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

	<!-- Menu Navegacion  -->
	<nav class="navbar navbar-expand-md navbar-light p-0 sticky-top">
		<a class="navbar-brand pl-2" href="Home" id="linkInicio">
			<i class="ri-sword-line d-inline-block " alt="logo"></i> TecnoTienda
		</a>
		<div class="collapse navbar-collapse justify-content-between"
			id="navbarCollapse">
			<div class="navbar-nav">
				<a href="Home" class="nav-item nav-link">Inicio</a> <a
					href="Productos" class="nav-item nav-link active">Productos</a>
				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="servicesDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Caregorias </a>
					<div class="dropdown-menu dropdown-menu"
						aria-labelledby="servicesDropdown">
						<div class="d-md-flex ">
							<div>
								<div class="dropdown-header">Celulares y telefonos</div>
								<a class="dropdown-item" href="products.jsp" id="celularesnav">Celulares</a>
								<a class="dropdown-item" href="products.jsp" id="accesoriosnav">Accesorios</a>
							</div>
							<div>
								<div class="dropdown-header">Computacion</div>
								<a class="dropdown-item" href="products.jsp" id="pcnav">PC</a> <a
									class="dropdown-item" href="products.jsp" id="notebooknav">Notebook</a>
								<a class="dropdown-item" href="products.jsp" id="componentesnav">Componentes
									de PC</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<form class="form-inline flex-fill px-1">
				<div class="input-group w-100">
					<input class="form-control mr-sm-2 " type="search"
						placeholder="Busqueda" aria-label="Busqueda">
					<button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Buscar</button>
				</div>
			</form>
			<div class="navbar-nav">
				<a href="cart.jsp" class="d-none" id="cartLocation"></a> <a
					href="javascript:void(0)" class="nav-item nav-link px-3"
					id="goToCart"> <i class="ri-shopping-cart-line ri-2x"></i> <span
					class="position-absolute top-0 start-90 translate-middle badge rounded-pill bg-light"
					id="cantCart"></span>
				</a>
			</div>
			<!-- el siguiente div con un link se modificara por uno con un dropdown donde dira el alias, con las opciones de ir a:
            Mi perfil y Cerrar Sesion
            este dropdown aparecera cuando se verifiquen los datos en la base de datos -->
			<%
				if (usuario == null) {
			%>
			<div class="navbar-nav pl-1" id="btnNoLogged">
				<a href="#a" class="nav-item nav-link pr-4" data-toggle="modal"
					data-target="#login">Iniciar Sesion</a>
			</div>
			<%
				} else {
			%>
			<div class="navbar-nav pl-1" id="btnLogged">
				<div class="nav-item dropdown">
					<a class="nav-link pr-4" href="#" id="servicesDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<div class="navbar-nav">
							<span class="align-middle" id="aliasUser"><%=usuario.getAlias()%></span>
						</div>
					</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="servicesDropdown">
						<div class="d-flex justify-content-center">
							<div>
								<a class="dropdown-item" href="Signin">Perfil</a> <a
									class="dropdown-item" href="Login" id="cerrarSesion">Cerrar
									Sesion</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</nav>
	<!-- modal login -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-labelledby="login" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<div id="msjEstado"></div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" id="closeLogIn">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<div class="modal-body">
					<div class="form-title text-center">
						<h4>Ingreso</h4>
					</div>
					<div class="d-flex flex-column text-center">
						<form>
							<div class="form-group">
								<input type="email" class="form-control" id="email"
									placeholder="Ingrese su mail">
								<div id="emailWarning"></div>
								<!-- <small class="warning" id="emailWarning">&nbsp;</small> -->
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password"
									placeholder="Ingrese su contraseña">
								<div id="passWarning"></div>
								<!-- <small class="warning" id="passWarning">&nbsp;</small> -->
							</div>
							<button type="button" class="btn btn-info btn-block btn-round"
								id="btnLogIn">Ingresar</button>
						</form>

						<div class="text-center text-muted delimiter">o ingrese con
							una red social</div>
						<div class="d-flex justify-content-center social-buttons">
							<div class="px-1">
								<button type="button" class="btn btn-secondary btn-circle"
									data-toggle="tooltip" data-placement="top" title="Twitter">
									<i class="bi bi-twitter"></i>
								</button>
							</div>
							<div class="px-1">
								<button type="button" class="btn btn-secondary btn-round"
									data-toggle="tooltip" data-placement="top" title="Facebook">
									<i class="bi bi-facebook"></i>
								</button>
							</div>
							<div class="px-1">
								<button type="button" class="btn btn-secondary btn-round"
									data-toggle="tooltip" data-placement="top" title="Linkedin">
									<i class="bi bi-linkedin"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<div class="signup-section">
						Aun no tienes cuenta? <a href="Signin" class="text-info">Registrar</a>.
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- cierre modal login -->
	<br>
	<br>
	<main class="d-flex">

		<!-- Sidebar-->
		<div class="border-end text-center text-light col-2" id="sidebar">
			<div class="sidebar-heading border-bottom ">Filtros</div>
			<div class="list-group list-group-flush">

				<h6>Celulares</h6>
				<a href="" id="celulares">Celulares</a> <a href="" id="accesorios">Accesorios</a>
				<hr>
				<h6>Computacion</h6>
				<a href="" id="pc">Pc</a> <a href="" id="notebook">Notebook</a> <a
					href="" id="componentes">Componentes</a>

			</div>
			<hr>
			<div class="list-group list-group-flush">
				<h6>Marca</h6>
				<a href="#">Lenovo</a> <a href="#">HP</a> <a href="#">Samsung</a>
			</div>
		</div>

		<div class="container-fluid" id="products">
			<div class="row">
				<%
					Producto producto;
				for (int i = 0; i < productos.size(); i++) {
					producto = productos.get(i);
				%>
				<div class="col-sm-4 p-0 mb-3">
					<div class="card bg-light mx-1 h-100">
						<img class="card-img-top"
							src="img/productos/<%=producto.getImg()%>">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title"><%=producto.getNombre()%></h5>
							<p class="card-text"><%=producto.getDescripcion()%></p>
							<div class="mt-auto text-right">
								<p class="card-text">
									$
									<%=producto.getPrecio()%></p>
								<button data-toggle="modal" data-target="#formaDePago"
									class="btnComprar btn btn-info">Comprar</button>
							</div>
						</div>
						<div class="card-footer">
							<div class="text-right">
								<a href="javascript:void(0)" data-id="1"
									class="btnAgregar text-decoration-none badge-pill badge-light py-1">Agregar
									al Carrito<i class="bi bi-cart-plus ri-xl"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</main>
	<div id="footer">
		<!-- Footer creado en js en elementosPagina.js -->
		<%@include file="footer.jsp"%>
	</div>
	<!-- Modal Forma de Pago -->
	<div class="modal fade" id="formaDePago" tabindex="-1"
		aria-hidden="true">
		<%@include file="formaDePago.jsp"%>
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