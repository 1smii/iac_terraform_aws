<?php

function sessionSTART($credenciales){
    $session = "false";
    session_start();
    $_SESSION['user'] = $credenciales['name'];
    $_SESSION['timeout'] = $_SERVER['REQUEST_TIME'] + 20;

    $dif_session = $_SERVER['REQUEST_TIME'] - $_SESSION;

    if ($dif_session <= 0 ){
        session_destroy();
        echo "Sesión caducada vuelva a loguearse";
        return $session;
    } else {
        echo "Aun tienes tiempo de sesión";
        return true;
    }
}
