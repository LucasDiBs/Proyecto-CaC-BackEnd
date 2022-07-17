<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="es">

<head>
    <!-- Icons -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <!-- link: https://remixicon.com -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- https://icons.getbootstrap.com -->
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/styles.css">

    <title>TecnoTienda</title>
</head>

<body>
    <nav class="navbar navbar-expand-md navbar-light p-0 sticky-top">
        <a class="navbar-brand pl-2" href="../index.jsp" id="linkInicio">
            <i class="ri-sword-line d-inline-block " alt="logo"></i>
            TecnoTienda
        </a>
        <button class="navbar-toggler p-2" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <div class="navbar-nav">
                <a href="../index.jsp" class="nav-item nav-link">Inicio</a>
                <a href="products.jsp" class="nav-item nav-link">Productos</a>
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="servicesDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Caregorias
                    </a>
                    <div class="dropdown-menu dropdown-menu" aria-labelledby="servicesDropdown">
                        <div class="d-md-flex ">
                            <div>
                                <div class="dropdown-header">Categoria 1</div>
                                <a class="dropdown-item" href="#">Subcategoria 1</a>
                                <a class="dropdown-item" href="#">Subcategoria 2</a>
                                <a class="dropdown-item" href="#">Subcategoria 3</a>
                            </div>
                            <div>
                                <div class="dropdown-header">Categoria 2</div>
                                <a class="dropdown-item" href="#">Subcategoria 1</a>
                                <a class="dropdown-item" href="#">Subcategoria 2</a>
                                <a class="dropdown-item" href="#">Subcategoria 3</a>
                            </div>
                            <div>
                                <div class="dropdown-header">Categoria 3</div>
                                <a class="dropdown-item" href="#">Subcategoria 1</a>
                                <a class="dropdown-item" href="#">Subcategoria 2</a>
                                <a class="dropdown-item" href="#">Subcategoria 3</a>
                            </div>
                            <div>
                                <div class="dropdown-header">Categoria 4</div>
                                <a class="dropdown-item" href="#">Subcategoria 1</a>
                                <a class="dropdown-item" href="#">Subcategoria 2</a>
                                <a class="dropdown-item" href="#">Subcategoria 3</a>
                                <a class="dropdown-item" href="#">Subcategoria 4</a>
                                <a class="dropdown-item" href="#">Subcategoria 5</a>
                                <a class="dropdown-item" href="#">Subcategoria 6</a>
                                <a class="dropdown-item" href="#">Subcategoria 7</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <form class="form-inline flex-fill px-1">
                <div class="input-group w-100">
                    <input class="form-control mr-sm-2 " type="search" placeholder="Busqueda" aria-label="Busqueda">
                    <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Buscar</button>
                </div>
            </form>
            <div class="navbar-nav">
                <a href="cart.jsp" class="d-none" id="cartLocation"></a>
                <a href="javascript:void(0)" class="nav-item nav-link px-3" id="goToCart">
                    <i class="ri-shopping-cart-line ri-2x"></i>
                    <span class="position-absolute top-0 start-90 translate-middle badge rounded-pill bg-light" id="cantCart"></span>
                </a>
            </div>
            <div class="navbar-nav pl-1 d-none" id="btnNoLogged">
                <a href="#a" class="nav-item nav-link pr-4" data-toggle="modal" data-target="#login">Iniciar Sesion</a>
            </div>
            <div class="navbar-nav pl-1 d-none" id="btnLogged">
                <div class="nav-item dropdown">
                    <a class="nav-link pr-4" href="#" id="servicesDropdown" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <div class="navbar-nav">
                            <span class="align-middle" id="aliasUser"></span>
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="servicesDropdown">
                        <div class="d-flex justify-content-center">
                            <div>
                                <a class="dropdown-item" href="singin.jsp">Perfil</a>
                                <a class="dropdown-item" href="#" id="cerrarSesion">Cerrar Sesion</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

        <!-- modal login -->
        <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <div id="msjEstado">
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeLogIn">
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
                                    <input type="email" class="form-control" id="email" placeholder="Ingrese su mail">
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
    
                            <div class="text-center text-muted delimiter">o ingrese con una red social</div>
                            <div class="d-flex justify-content-center social-buttons">
                                <div class="px-1">
                                    <button type="button" class="btn btn-secondary btn-circle" data-toggle="tooltip"
                                        data-placement="top" title="Twitter">
                                        <i class="bi bi-twitter"></i>
                                    </button>
                                </div>
                                <div class="px-1">
                                    <button type="button" class="btn btn-secondary btn-round" data-toggle="tooltip"
                                        data-placement="top" title="Facebook">
                                        <i class="bi bi-facebook"></i>
                                    </button>
                                </div>
                                <div class="px-1">
                                    <button type="button" class="btn btn-secondary btn-round" data-toggle="tooltip"
                                        data-placement="top" title="Linkedin">
                                        <i class="bi bi-linkedin"></i>
                                    </button>
                                </div>
                                </di>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <div class="signup-section">Aun no tienes cuenta? <a href="singin.jsp" class="text-info">
                                Registrar</a>.
                        </div>
                    </div>
                </div>
    
            </div>
        </div>
        <!-- cierre modal login -->

    

    <div class="mx-5 p-5 ">
        <div class="row bg-light py-2">
            <table class="table" id="lista-compra" >
                <thead>
                    <tr>
                        <th scope="col">Producto</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Total</th>
                    </tr>
                </thead>
                <tbody id="carrito">
                    
                </tbody>
                <tr>
                    <th colspan="5" scope="col" class="text-right">TOTAL :</th>
                    <th scope="col" id="total">
                        <!-- <input id="total" name="monto" class="font-weight-bold border-0" readonly style="background-color: white;"></input> -->
                    </th>
                    
                </tr>
            </table>
        </div>
        <div class="row justify-content-end py-2">
            <div class=" col">
                <div class="row justify-content-end">
                    <div class="px-2">
                        <button type="button" class="btn btn-danger" id="btnBorrarTodo">Limpiar Carrito</button>
                    </div>
                    <div class="px-2">
                        <a href="products.jsp">
                            <button type="button" class="btn btn-info">Seguir Navegando</button>
                        </a>
                    </div>
                    <div class="px-2">
                        <button type="button" class="btn btn-info" id="btnComprar" data-toggle="modal"
                        data-target="#formaDePago">Comprar</button>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- container -->
    <div id="test">

    </div>
    <!--TODO Footer -->
    
    <div id="footer">
        <!-- Footer creado en js en elementosPagina.js -->
    </div>

    <!-- Modal Forma de Pago -->
    <div class="modal fade" id="formaDePago" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Forma de Pago</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                        <li class="nav-item pill-info"> <a data-toggle="pill" href="#credit-card"
                                class="nav-link active">
                                <i class="ri-bank-card-line ri-1x mr-1"></i> Debito / Credito </a> </li>
                        <li class="nav-item pill-info"><a data-toggle="pill" href="#paypal" class="nav-link ">
                                <i class="ri-paypal-line ri-1x mr-1"></i> Paypal </a> </li>
                        <li class="nav-item pill-info"> <a data-toggle="pill" href="#net-banking" class="nav-link ">
                                <i class="ri-smartphone-line ri-1x mr-1"></i> Mercado Pago </a> </li>
                        <li class="nav-item pill-info"> <a data-toggle="pill" href="#net-banking" class="nav-link ">
                                <i class="ri-smartphone-line ri-1x mr-1"></i> Todo Pago </a> </li>
                    </ul>
                    <!-- Contenidos Forma de Pago -->
                    <div class="tab-content">
                        <!-- Tarjeta Debito/Credito -->
                        <div id="credit-card" class="tab-pane fade show active pt-3">
                            <form role="form" onsubmit="event.preventDefault()">
                                <div class="form-group"> <label for="username">
                                        <h6>Nombre</h6>
                                    </label> <input type="text" name="username" placeholder="Nombre" required
                                        class="form-control "> </div>
                                <div class="form-group"> <label for="cardNumber">
                                        <h6>Numero de Tarjeta</h6>
                                    </label>
                                    <div class="input-group">
                                        <input type="text" name="Numero de Tarjeta"
                                            placeholder="Numero de tarjeta valido" class="form-control " required>
                                        <div class="input-group-append">
                                            <span class="input-group-text text-muted">
                                                <!-- <i class="ri-visa-fill ri-xl mx-1"></i> -->
                                                <!-- <i class="ri-mastercard-line ri-xl mx-1"></i> -->
                                                <!-- <i class="ri-bank-card-line ri-xl mx-1"></i> american express-->
                                                <i class="fab fa-cc-visa mx-1"></i>
                                                <i class="fab fa-cc-mastercard mx-1"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="form-group"> <label><span class="hidden-xs">
                                                    <h6>Fecha de Vencimiento</h6>
                                                </span></label>
                                            <div class="input-group"> <input type="number" placeholder="MM" name=""
                                                    class="form-control" required> <input type="number" placeholder="AA"
                                                    name="" class="form-control" required> </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group mb-4"> <label data-toggle="tooltip"
                                                title="Three digit CV code on the back of your card">
                                                <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                            </label> <input type="text" required class="form-control"> </div>
                                    </div>
                                </div>
                                <div class="card-footer"> <button type="button"
                                        class="subscribe btn btn-info btn-block shadow-sm"> Confirmar Pago </button>
                            </form>
                        </div>
                    </div> <!-- Cierre Tarjeta Debito/Credito -->
                    <!-- Paypal -->
                    <div id="paypal" class="tab-pane fade pt-3">
                        <h6 class="pb-2">Selecciona tu tipo de cuenta paypal</h6>
                        <div class="form-group ">
                            <label class="radio-inline">
                                <input type="radio" name="optradio" checked> Local
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="optradio" class="ml-5"> Internacional
                            </label>
                        </div>
                        <p>
                            <button type="button" class="btn btn-info ">
                                <i class="fab fa-paypal mr-2"></i>
                                Ingresar a mi Paypal</button>
                        </p>
                        <p class="text-muted"> Nota: Después de hacer clic en el botón, se le dirigirá a un
                            enlace seguro para el pago. Después de completar el proceso de pago, será redirigido
                            a el sitio web para ver los detalles de su pedido. </p>
                    </div> <!-- Cierre Paypal -->
                    <!-- MercadoPago / TodoPago -->
                    <div id="net-banking" class="tab-pane fade pt-3">
                        <div class="form-group "> <label for="Select Your Bank">
                                <h6>Seleccione la cantidad de cuotas</h6>
                            </label> <select class="form-control" id="ccmonth">
                                <option value="" selected disabled>--Por favor seleccione la cantidad de cuotas a
                                    pagar--</option>
                                <option>Una cuota</option>
                                <option>2 cuotas</option>
                                <option>4 cuotas</option>
                                <option>12 cuotas</option>
                                <option>18 cuotas</option>
                            </select> </div>
                        <div class="form-group">
                            <p> <button type="button" class="btn btn-info "><i class="ri-smartphone-line mr-2"></i>
                                    Confirmar Pago</button> </p>
                        </div>
                        <p class="text-muted">Nota: Después de hacer clic en el botón, se le dirigirá a un
                            enlace seguro para el pago. Después de completar el proceso de pago, será redirigido
                            a el sitio web para ver los detalles de su pedido. </p>
                    </div> <!-- Cierre MercadoPago / TodoPago -->
                    <div id="net-banking" class="tab-pane fade pt-3">
                        <div class="form-group "> <label for="Select Your Bank">
                                <h6>Seleccione la cantidad de cuotas</h6>
                            </label> <select class="form-control" id="ccmonth">
                                <option value="" selected disabled>--Por favor seleccione la cantidad de cuotas a
                                    pagar--</option>
                                <option>Una cuota</option>
                                <option>2 cuotas</option>
                                <option>4 cuotas</option>
                                <option>12 cuotas</option>
                                <option>18 cuotas</option>
                            </select> </div>
                        <div class="form-group">
                            <p> <button type="button" class="btn btn-info "><i class="ri-smartphone-line mr-2"></i>
                                    Confirmar Pago</button> </p>
                        </div>
                        <p class="text-muted">Nota: Después de hacer clic en el botón, se le dirigirá a un
                            enlace seguro para el pago. Después de completar el proceso de pago, será redirigido
                            a el sitio web para ver los detalles de su pedido. </p>
                    </div> <!-- Cierre MercadoPago / TodoPago -->
                </div>
                <div class="modal-footer">
                    <div class=" text-center">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>





    <!-- Iclude jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="../js/jquery-3.5.1.slim.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/elementosPagina.js"></script>
    <script src="../js/cart.js"></script>
    <script src="../js/logIn.js"></script>
    <script src="../js/iconoCarrito.js"></script>
</body>

</html>