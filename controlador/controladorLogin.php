<?php
    session_start();
    require_once("../modelo/Usuario.php");
    $comprobar = new Usuario();
    if($comprobar->comprobarUsuario()){
        header("Location: ../controlador/controladorContacto.php");
    }else{
        $mensaje = "Algo ha ido mal";
        echo "<script type='text/javascript'>alert('$mensaje');</script>";
        echo '<script type="text/javascript">location.href = "../vista/vistaLogin.php";</script>';
    }
    
    
    


