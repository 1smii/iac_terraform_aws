<?php

function checkifuser($connectDB, $name){
    $consulta = "SELECT * FROM usuarios WHERE user = '$name'";
    $r = $connectDB->query($consulta);
    if ($r->num_rows == 0){
        echo "Usuario válido";
        return true;
    }else {
        echo "Usuario duplicado ingrese otro";
        return false;
    }
}