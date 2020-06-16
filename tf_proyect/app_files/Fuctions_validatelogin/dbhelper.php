<?php

function obtenerConexionDB(){
    $connectDB = new mysqli("localhost",
        "nazgul13",
        "iacproyect",
        "replic_micms");
    if ($connectDB->connect_error)
        return null;
    else
        return $connectDB;
}

function obtenerCredenciales(){
    if ($_SERVER["REQUEST_METHOD"] == "GET"){
        if (isset($_GET["name"]) && isset($_GET["password"])){
            $name = filter_var(htmlentities($_GET["name"]), FILTER_SANITIZE_STRING);
            $password = filter_var(htmlentities($_GET["password"]), FILTER_SANITIZE_STRING);
            $credenciales = array("name" => $name, "password" => $password);
            return $credenciales;
        } else {
            echo "<br/> Error de conexión";
            return null;
        }
    } else {
        echo "<br/> Error de conexión";
        return null;
        }
}
