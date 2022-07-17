var campos = [
    'nombre',
    'apellido',
    'alias',
    'codigoPostal',
    'email',
    'verifEmail',
    'clave',
    'verifClave',
]
// validaciones SignIn

var esValido = {
    nombre: false,
    apellido: false,
    alias: false,
    codigoPostal: false,
    email: false,
    verifEmail: false,
    clave: false,
    verifClave: false,
}

//habilitarSignIn();

function validarNombre() {
    let campo = document.getElementById("nombre");
    if (campo.value.length < 3) {
        campo.classList.add("alert-danger");
        campo.classList.add("border-danger");
        document.getElementById("nombreWarning").innerText = "Nombre muy corto.";
        esValido["nombre"] = false;
    }
    else {
        campo.classList.remove("border-danger");
        campo.classList.remove("alert-danger");
        document.getElementById("nombreWarning").innerHTML = "&nbsp;";
        esValido["nombre"] = true;
    }
    //habilitarSignIn();
}
function validarApellido() {
    let campo = document.getElementById("apellido");
    if (campo.value.length < 3) {
        campo.classList.add("alert-danger");
        campo.classList.add("border-danger");
        document.getElementById("apellidoWarning").innerText = "Apellido muy corto.";
        esValido["apellido"] = false;
    }
    else {
        campo.classList.remove("border-danger");
        campo.classList.remove("alert-danger");
        document.getElementById("apellidoWarning").innerHTML = "&nbsp;";
        esValido["apellido"] = true;
    }
    //habilitarSignIn();
}
function validarAlias() {
    let campo = document.getElementById("alias");
    if (campo.value.length == 0) {
        campo.classList.add("alert-danger");
        campo.classList.add("border-danger");
        document.getElementById("aliasWarning").innerText = "Alias muy corto.";
        esValido["alias"] = false;
    }
    else {
        campo.classList.remove("border-danger");
        campo.classList.remove("alert-danger");
        document.getElementById("aliasWarning").innerHTML = "&nbsp;";
        esValido["alias"] = true;
    }
    //habilitarSignIn();
}
function validarCodigoPostal() {
    let campo = document.getElementById("codigoPostal");
    if (campo.value.length < 4) {
        campo.classList.add("alert-danger");
        campo.classList.add("border-danger");
        document.getElementById("codigoPostalWarning").innerText = "El codigo postal debe tener mínimo 4 digitos.";
        esValido["codigoPostal"] = false;
    }
    else {
        campo.classList.remove("border-danger");
        campo.classList.remove("alert-danger");
        document.getElementById("codigoPostalWarning").innerHTML = "&nbsp;";
        esValido["codigoPostal"] = true;
    }
    //habilitarSignIn();
}
function validarEmail() {
    let campo = document.getElementById("email");
    if (!campo.value.includes("@") || !campo.value.includes(".com")) {
        campo.classList.add("alert-danger");
        campo.classList.add("border-danger");
        document.getElementById("emailWarning").innerText = "Email no válido";
        esValido["email"] = false;
    }
    else {
        campo.classList.remove("border-danger");
        campo.classList.remove("alert-danger");
        document.getElementById("emailWarning").innerHTML = "&nbsp;";
        esValido["email"] = true;
    }
    //habilitarSignIn();
}
function validarVerifEmail() {
    let campo = document.getElementById("verifEmail");
    if (campo.value != document.getElementById("email").value) {
        campo.classList.add("alert-danger");
        campo.classList.add("border-danger");
        document.getElementById("verifEmailWarning").innerText = "El email no corresponde con el anterior";
        esValido["verifEmail"] = false;
    }
    else {
        campo.classList.remove("border-danger");
        campo.classList.remove("alert-danger");
        document.getElementById("verifEmailWarning").innerHTML = "&nbsp;";
        esValido["verifEmail"] = true;
    }
    //habilitarSignIn();
}
function validarClave() {
    let campo = document.getElementById("clave");
    if (campo.value.length < 6) {
        document.getElementById("claveWarning").className = "warning";
        campo.classList.add("alert-danger");
        campo.classList.add("border-danger");
		document.getElementById("claveWarning").innerText = "Debe tener como mínimo 6 caracteres";
        esValido["clave"] = false;
    }
    else {
        document.getElementById("claveWarning").className = "light";
        campo.classList.remove("border-danger");
        campo.classList.remove("alert-danger");
        esValido["clave"] = true;
    }
    //habilitarSignIn();
}
function validarVerifClave() {
    let campo = document.getElementById("verifClave");
    if (campo.value != document.getElementById("clave").value) {
        campo.classList.add("alert-danger");
        campo.classList.add("border-danger");
        document.getElementById("verifClaveWarning").innerText = "La contraseña no corresponde con la anterior";
        esValido["verifClave"] = false;
    }
    else {
        campo.classList.remove("border-danger");
        campo.classList.remove("alert-danger");
        document.getElementById("verifClaveWarning").innerHTML = "&nbsp;";
        esValido["verifClave"] = true;
    }
    //habilitarSignIn();
}



campos.forEach(campo => {
    document.getElementById(campo).addEventListener("focus", e => {
        e.target.classList.remove("border-danger");
        e.target.classList.remove("alert-danger");
        document.getElementById(campo + "Warning").innerHTML = "&nbsp;";
    })
});


function camposValidos() {
    let valido = true;
    let keys = Object.values(esValido);
    for (let i = 0; i < keys.length; i++) {
        valido &&= keys[i];
    }
    return valido;
}


const btnSingIn = document.getElementById("btnSignIn");
btnSingIn.addEventListener("click", e => {
    e.preventDefault();
    // verifico valores de los imputs
    validarNombre();
    validarApellido();
    validarAlias();
    validarCodigoPostal();
    validarEmail();
    validarVerifEmail();
    validarClave();
    validarVerifClave();

    if (camposValidos()) {
        document.getElementById("form").submit();
    }
})

