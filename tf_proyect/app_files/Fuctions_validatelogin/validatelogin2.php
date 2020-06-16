<?php

require_once "dbhelper.php";
require_once "passwdhelper.php";

if (validatelogin())
    echo "<br/>validatelogin() -> true";
else
    echo "<br/>validatelogin() -> false";



//------------------------------------

function validatelogin(){
    $credenciales = obtenerCredenciales();
    $connectDB = obtenerConexionDB();
    if ($connectDB != null){
        if ($credenciales != null){
            $hashpassword = takepasswdhash($connectDB, $credenciales["name"]);
            if (comprobarpasswd($credenciales["password"], $hashpassword)){
                echo "<br/> Acceso permitido";
                return true;
            } else
                echo "<br/> Acceso denegado";
        }
    } return false;
}
