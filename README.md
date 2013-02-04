FarmApp_DB
==========


<h2>Crear un nuevo usuario para la base de datos</h2>

Desde la Shell de MySQL:

( En caso de tener XAMPP tenemos que abrir la consola cmd, ir a la carpeta C:/xampp/mysql/bin y poner mysql -u root -p (con su contraseña))
<pre>
mysql> grant usage on *.* to [usuario]@localhost identified by ‘[contraseña]‘;

mysql> grant all privileges on [nombre_bbdd].* to [usuario]@localhost;
</pre>

[usuario] es el identificador para el nuevo usuario 
[contraseña] su contraseña 
[nombre_bbdd] el nombre que le daremos a la base de datos que importaremos desde el respaldo.


Salimos de la Shell (exit) como root y entramos con el usuario que acabamos de crear:

Entramos a mysql con el usuario creado en el paso anterior:

<pre>
$ mysql -u [usuario] -p
Enter password: [contraseña]
</pre>

<h2>Creamos la base de datos: </h2>

<pre>
mysql> create database [nombre_bbdd];
mysql> exit;
</pre>
