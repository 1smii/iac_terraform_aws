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
echo "La contraseña introducida es: $password";
echo "<br/>";

$connectDB = new mysqli("localhost",
    "nazgul13",
    "iacproyect",
    "replic_micms");

if (!$connectDB->connect_error) {
    $consulta = "SELECT passwd FROM usuarios WHERE user = '$name'";
    $result = $connectDB->query($consulta);
    if ($result->num_rows > 0) {
        $hashpasswd = $result->fetch_assoc()['passwd'];
        if (password_verify($password,$hashpasswd))
            echo "Usuario válido";
        else
            echo "Usuario inválido";

    }else {
        echo "Imposible conectar a la base de datos";
    }
}