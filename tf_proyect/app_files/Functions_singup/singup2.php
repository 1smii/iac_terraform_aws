<?php

require_once "comprobarusuario.php";
require_once "../Fuctions_validatelogin/dbhelper.php";
require_once "insertnewuser.php";

if (signup())
    echo "<br/>signup() -> true";
else
    echo "<br/>signup() -> false";



//-------------------------------

function signup(){
    $credenciales = obtenerCredenciales();
    $connectDB = obtenerConexionDB();
    $checktrue = checkifuser($connectDB, $credenciales['name']);
    if ($connectDB != null){
        if ($credenciales != null){
            if ($checktrue != null) {
                insernewuser($connectDB, $credenciales);
                return true;
            }
        }
    } return false;
}

/*$hashpasswd = password_hash($credenciales["password"], PASSWORD_DEFAULT);
$insert = "INSERT INTO usuarios (user, passwd) VALUES ("$credenciales['name'], $hashpasswd")";
                if ($connectDB->query($insert)) {
                    echo "El usuario se insertó correctamente";
                    return true;
                } else {
                    echo "Error al insertar usuario";
                }*/