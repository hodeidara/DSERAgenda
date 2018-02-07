<?php
    session_start();
    require_once("../modelo/Usuario.php");
    $crear = new Usuario();
    $crear->crearUsuario();
    header("Location: ../controlador/vistaLogin.php");
    
    
    


