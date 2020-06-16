<html>
    <head>
        <tittle></tittle>
    </head>

    <style>
        #login{

        }
    </style>
    <body>
        <table align="center">
            <tr>
                <td>
        <form id="login" method="GET" action="Fuctions_validatelogin/validatelogin2.php">
            <fieldset>
            <legend>Login</legend>
                <label for="name">Usuario: </label>
                <input name="name" id="name" type="text" placeholder="Username" size="20"/><br>
                <label for="password">Contraseña: </label>
                <input name="password" id="password" type="password" size="17"/><br>
                <input type="submit" name="Enviar" value="Aceptar"/>
            </fieldset>
        </form>
                </td>
            </tr>

            <tr>
                <td>
        <form id="login" method="GET" action="Functions_singup/singup2.php">
            <fieldset>
                <legend>Sing-up</legend>
                <label for="name">Usuario: </label>
                <input name="name" id="name" type="text" placeholder="Username" size="20"/><br>
                <label for="password">Contraseña: </label>
                <input name="password" id="password" type="password" size="17"/><br>
                <input type="submit" name="Aceptar" value="Aceptar"/>
            </fieldset>
        </form>
                </td>
            </tr>
        </table>
    </body>
</html>
<?php