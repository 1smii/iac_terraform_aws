<?php

function takepasswdhash($connectDB, $name){
    $hashpassword = null;
    $consulta = "SELECT passwd FROM usuarios WHERE user = '$name'";
    $result = $connectDB->query($consulta);
    if ($result->num_rows > 0){
        $hashpassword = $result->fetch_assoc()['passwd'];
        return $hashpassword;
    } else {
        echo "El usuario no existe";
        return $hashpassword;
    }
}

function comprobarpasswd($password, $hashpassword){
    if (password_verify($password, $hashpassword)){
        echo "Usuario valido";
        return true;
    }else
        echo "<br/> Contraseña incorrecta";
}