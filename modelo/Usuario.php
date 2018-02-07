<?php

class Usuario {

    private $user;
    private $pass;
    private $link;

    public function __construct() {
        $this->Usuario = array();
        $this->link = new mysqli('localhost', 'root', '', 'agenda');
    }

    public function comprobarUsuario() {
            $user = $_POST['usuario'];
            $password = $_POST['password'];
            $passEncriptada;
            $sql = "select user, pass from usuarios where user = '$user'";
            $result = mysqli_query($this->link, $sql);
            while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                $passEncriptada=$row['pass'];
                echo $passEncriptada;
            }
            if (password_verify($password, $passEncriptada)) {
                    $_SESSION['Logueado'] = $user;
                    return true;
                } else {
                    return false;
                }
    }
    
    public function crearUsuario() {
            $user = "Hodei";
            $password = "Hodei";
            $opciones = ['cost'=>12];
            $contrasenaEncriptada = password_hash($password, PASSWORD_BCRYPT, $opciones);
            $sql = "insert into usuarios (user, pass, esAdmin) values ('$user', '$contrasenaEncriptada', 1)";
            mysqli_query($this->link, $sql);
    }

}
