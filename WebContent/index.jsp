<%@page import="modelos.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Producto"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	Usuario usuario = (Usuario) session.getAttribute("usuario");
	List<Producto> productosDestacados = (List<Producto>) request.getAttribute("productosDestacados");
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

<link rel="stylesheet" href="./css/styles.css">

<title>TecnoTienda</title>

</head>

<body>

	<!-- Menu Navegacion  -->
	<nav class="navbar navbar-expand-md navbar-light p-0 sticky-top">
		<a class="navbar-brand pl-2" href="Home" id="linkInicio"> <i
			class="ri-sword-line d-inline-block " alt="logo"></i> TecnoTienda
		</a>
		<button class="navbar-toggler p-2" type="button"
			data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-between"
			id="navbarCollapse">
			<div class="navbar-nav">
				<a href="Home" class="nav-item nav-link active">Inicio</a> <a
					href="Productos" class="nav-item nav-link">Productos</a>
				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="servicesDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Caregorias </a>
					<div class="dropdown-menu dropdown-menu"
						aria-labelledby="servicesDropdown">
						<div class="d-md-flex ">
							<div>
								<div class="dropdown-header">Celulares y telefonos</div>
								<a class="dropdown-item" href="vistas/products.jsp"
									id="celularesnav">Celulares</a> <a class="dropdown-item"
									href="vistas/products.jsp" id="accesoriosnav">Accesorios</a>
							</div>
							<div>
								<div class="dropdown-header">Computacion</div>
								<a class="dropdown-item" href="vistas/products.jsp" id="pcnav">PC</a>
								<a class="dropdown-item" href="vistas/products.jsp"
									id="notebooknav">Notebook</a> <a class="dropdown-item"
									href="vistas/products.jsp" id="componentesnav">Componentes
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
				<a href="vistas/cart.jsp" class="d-none" id="cartLocation"></a> <a
					href="javascript:void(0)" class="nav-item nav-link px-3"
					id="goToCart"> <!-- <a href="vistas/cart.jsp" class="nav-item nav-link px-3"> -->
					<i class="ri-shopping-cart-line ri-2x"></i> <span
					class="position-absolute top-0 start-90 translate-middle badge rounded-pill bg-light"
					id="cantCart"></span>
				</a>
			</div>
            <%if(usuario == null){%>
			<div class="navbar-nav pl-1" id="btnNoLogged">
				<a href="#a" class="nav-item nav-link pr-4" data-toggle="modal"
					data-target="#login">Iniciar Sesion</a>
			</div>
            <%} else {%>
			<div class="navbar-nav pl-1" id="btnLogged">
				<div class="nav-item dropdown">
					<a class="nav-link pr-4" href="#" id="servicesDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<div class="navbar-nav">
							<span class="align-middle" id="aliasUser"><%=usuario.getAlias() %></span>
						</div>
					</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="servicesDropdown">
						<div class="d-flex justify-content-center">
							<div>
								<a class="dropdown-item" href="Signin">Perfil</a> 
								<a class="dropdown-item" href="Login" id="cerrarSesion">Cerrar Sesion</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<% } %>
		</div>
	</nav>

	<!-- Cierra Menu Navegacion  -->
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
						<form action="Login" method = "POST">
							<div class="form-group">
								<input type="email" class="form-control" id="email" name="email"
									placeholder="Ingrese su mail">
								<div id="emailWarning"></div>
								<!-- <small class="warning" id="emailWarning">&nbsp;</small> -->
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password" name="password"
									placeholder="Ingrese su contraseña">
								<div id="passWarning"></div>
								<!-- <small class="warning" id="passWarning">&nbsp;</small> -->
							</div>
							<button type="submit" class="btn btn-info btn-block btn-round"
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
						Aun no tienes cuenta? <a href="Signin"
							class="text-info"> Registrar</a>.
					</div>
				</div>
			</div>

		</div>

	</div>
	</div>
	<!-- cierre modal login -->

	<!-- Carrusel -->
	<main class="container-fluid pt-5">
		<div class="row justify-content-md-center">
			<div id="carouselExampleIndicators" class="carousel slide col-12"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-1 img-carrousel"
							src="img\productos\imagen_1200x700.jpg" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-1 img-carrousel"
							src="img\productos\Pc Completa Intel I5 + Monitor 19 Led +8gb +hd 1 Tb +kit_1200x700.jpg"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-1 img-carrousel"
							src="img\productos\Kit Xtrike-me Gamer 4 En 1_1200x700.jpg"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

		</div>

		<!-- Cards de productos en oferta hecha de forma dinamica con elementosPagina.js -->
		<div class="card-deck m-5 row d-flex justify-content-around" id="productsIndex">
			<%
			Producto producto; 
			for (int i = 0; i < productosDestacados.size(); i++) { 
				producto = productosDestacados.get(i);
			%>
				<div class="card bg-light col-4 p-0">
                    <img class="card-img-top" src="img/productos/<%=producto.getImg()%>">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title"><%=producto.getNombre()%></h5>
                        <p class="card-text"><%=producto.getDescripcion()%></p>
                        <div class="mt-auto text-right">
                        	<p class="card-text">$ <%=producto.getPrecio()%></p>
                            <button data-toggle="modal" data-target="#formaDePago"
                                class="btnComprar btn btn-info">Comprar</button>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="text-right">
                            <a href="javascript:void(0)" data-id="<%=producto.getId()%>"
                                class="btnAgregar text-decoration-none badge-pill badge-light py-1">
                                Agregar al Carrito<i class="bi bi-cart-plus ri-xl"></i>
                            </a>
                        </div>
                    </div>
                </div>
			<%} %>	

			<!-- <div id="productsIndex"></div> -->
		</div>


	</main>



	<!-- Footer -->
	<%@include file="vistas/footer.jsp"%>

	<!-- Modal Forma de Pago -->
	<!-- DATOS del boton -->
	<!-- data-toggle="modal" data-target="#formaDePago" -->
	<div class="modal fade" id="formaDePago" tabindex="-1"
		aria-hidden="true">
		<%@include file="vistas/formaDePago.jsp"%>
	</div>

	<!-- Iclude jQuery and Bootstrap Bundle (includes Popper) -->

	<script src="js/jquery-3.5.1.slim.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/elementosPagina.js"></script>
	<script src="js/index.js"></script>
	<script src="js/logIn.js"></script>
	<script src="js/iconoCarrito.js"></script>
</body>

</html>