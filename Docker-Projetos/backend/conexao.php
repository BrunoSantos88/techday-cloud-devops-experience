<?php

$servername ="$_BANCO_HOST";
$username = "$_BANCO_ADMIN";
$password = "$_ADMIN_SECRET";
$database = "$_BANCO_TABELA";

// Criar conexão


$link = new mysqli($servername, $username, $password, $database);

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

?>