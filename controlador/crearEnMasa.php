<?php

session_start();
require_once("../modelo/Usuario.php");
$lineas = file('../datos.txt');
foreach ($lineas as $num_linea => $linea) {
    echo "Línea #<b>{$num_linea}</b> : " . htmlspecialchars($linea) . "<br />\n";
$contacto = explode("::", $linea);
    $crear = new Usuario();
    $crear->crearContacto($contacto[0], $contacto[1], $contacto[2], $contacto[3]);
}

//header("Location: ../vista/vistaLogin.php");





