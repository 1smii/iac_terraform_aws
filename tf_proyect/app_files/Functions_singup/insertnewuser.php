<?php

function insernewuser($connectDB, $credenciales){
    $hashpasswd = password_hash($credenciales['password'], PASSWORD_DEFAULT);
    $insert = "INSERT INTO usuarios (user, passwd) VALUES ('{$credenciales["name"]}', '$hashpasswd')";
    if ($connectDB->query($insert)){
        echo "<br/>El usuario se insertó correctamente";
    }else{
        echo "Error al insertar usuario";
    }
}