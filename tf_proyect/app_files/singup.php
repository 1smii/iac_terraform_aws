<?php

if ($_SERVER["REQUEST_METHOD"] == "POST"){
    if (isset($_POST["name"]))
        $name = filter_var(htmlentities($_POST["name"]), FILTER_SANITIZE_STRING);
    if (isset($_POST["password"]))
        $password = filter_var(htmlentities($_POST["password"]), FILTER_SANITIZE_STRING);
}

if ($_SERVER["REQUEST_METHOD"] == "GET"){
    if (isset($_GET["name"]))
        $name = filter_var(htmlentities($_GET["name"]), FILTER_SANITIZE_STRING);
    if (isset($_GET["password"]))
        $password = filter_var(htmlentities($_GET["password"]), FILTER_SANITIZE_STRING);
}

echo "El usuario introducido es: $name";
echo "<br/>";
echo "Con contraseña sin hashear: $password";
echo "<br/>";

$connectDB = new mysqli("localhost",
    "nazgul13",
    "iacproyect",
    "replic_micms");

if (!$connectDB->connect_error) {
    $usuario = $name;
    $q = "SELECT * FROM usuarios WHERE user = '$usuario'";
    $r = $connectDB->query($q);
    if ($r->num_rows == 0) {
        $hashpasswd = password_hash($password, PASSWORD_DEFAULT);
        $insertar = "INSERT INTO usuarios (user, passwd) VALUES ('$name', '$hashpasswd')";
        if ($connectDB->query($insertar))
            echo "El usuario se insertó correctamente";
        else
            echo "Error al insertar usuario";
    } else {
        echo 'El user ya esta registrado, ingresa otro';
    }
} else {
    echo "Error en la conexión a la base de datos";
}

