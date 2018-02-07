<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <title>Agenda - LOGIN</title>
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Bienvenido</h1>

        <div>
            <form name="loginForm" action="../controlador/controladorLogin.php" method="post">
                <div>
                    <h2>Login</h2>
                    <div>
                        <input type="text" name="usuario" placeholder="Usuario" 
                               maxlength="20" />
                    </div>
                    <div>
                        <input type="password" name="password" placeholder="Password"
                               />
                    </div>
                </div>
                <br><input type="submit" value="Entrar"/>
            </form>
            
            <form action="../controlador/crearNuevo.php" method="POST">
                <input type="submit" name="btnCrear" value="Crear nuevo usuario predefinido" />
            </form>


            <form action="../controlador/cerrarSesion.php" method="POST">
                <input type="submit" name="btn_amaitu" value="Cerrar sesión activa" />
            </form>

            <a href="../controlador/controladorContacto.php">Entrar sin loguear</a>
        </div>
    </body>
</html>
