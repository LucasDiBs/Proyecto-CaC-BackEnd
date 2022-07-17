<%@page import="modelos.Usuario"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	Usuario usuario = (Usuario) session.getAttribute("usuario");
	if (usuario == null){
		usuario = new Usuario("", "");
		usuario.limpiar();
	}
%>
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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">

    <title>TecnoTienda</title>
</head>

<body>
    <main role="main" class="container my-auto">
        <h2 class="text-center p-4" id="titulo"></h2>
        <form id="form" action="Signin" method="POST">
        	<input type="hidden" name="id" value="<%=usuario.getId()%>" >
            <div class="row py-2 justify-content-center">
                <div class="col-5">
                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<%=usuario.getNombre()%>">
                    <small class="warning" id="nombreWarning">&nbsp;</small>
                </div>
                <div class="col-5">
                    <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" value="<%=usuario.getApellido()%>">
                    <small class="warning" id="apellidoWarning">&nbsp;</small>
                </div>
            </div>
            <div class="row py-2 justify-content-center">
                <div class="col-5">
                    <input type="text" class="form-control" id="alias" name="alias" placeholder="Alias" value="<%=usuario.getAlias()%>">
                    <small class="warning" id="aliasWarning">&nbsp;</small>
                </div>
                <div class="col-5">
                    <input type="text" class="form-control" id="codigoPostal" name="codigoPostal" placeholder="Codigo Postal" value="<%=usuario.getCodigoPostal()%>">
                    <small class="warning" id="codigoPostalWarning">&nbsp;</small>
                </div>
            </div>
            <div class="row py-2 justify-content-center">
                <div class="col-5">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Correo electronico" value="<%=usuario.getEmail()%>">
                    <small class="warning" id="emailWarning">&nbsp;</small>
                </div>
                <div class="col-5">
                    <input type="email" class="form-control" id="verifEmail" name="verifEmail" placeholder="Repita correo electronico"  value="<%=usuario.getEmail()%>">
                    <small class="warning" id="verifEmailWarning">&nbsp;</small>
                </div>
            </div>
            <div class="row py-2 justify-content-center">
                <div class="col-5">
                    <input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña" >
                    <small id="claveWarning"></small>
                </div>
                <div class="col-5">
                    <input type="password" class="form-control" id="verifClave" name="verifClave" placeholder="Repita contraseña"
                        >
                    <small class="warning" id="verifClaveWarning">&nbsp;</small>
                </div>
            </div>
            <div class="row py-2 justify-content-center">
            	<%if(usuario.getAlias().isEmpty()) {%>
<!--                 <input type="button" class="btn btn-info mb-2" id="btnSignIn" name="accion" value="Registrar"> -->
                <button class="btn btn-info mb-2" id="btnSignInX" name="accion" type="submit" value="registrar">Registrar</button>
                <% } else { %>
<!--                 <input type="button" class="btn btn-info mb-2" id="btnSignIn" name="accion" value="Guardar"> -->
                <button class="btn btn-info mb-2" id="btnSignInX" name="accion" type="submit" value="actualizar">Guardar</button> 
                <% } %>
            </div>
        </form>
        <div class="d-flex  justify-content-center p-2">
            <a href="Home" class="badge badge-light p-2">Volver al Inicio</a>
        </div>
    </main>

    <!-- modal registro exitoso -->
    <div class="modal fade" id="msjOK" data-backdrop="static" data-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Registro</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success" role="alert">
                        El usuario ha sido registrado exitosamente
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="index.jsp" class="btn btn-info">Volver al Inicio</a>
                </div>
            </div>
        </div>
    </div>


    <!-- fin modal registro exitoso -->

    <!-- Iclude jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="js/jquery-3.5.1.slim.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/signIn.js"></script>
</body>

</html>