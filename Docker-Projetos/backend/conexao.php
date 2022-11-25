<?php
$servername ="bootcamp-363315:us-central1:mysql94251"
$username = "root";
$password = "mypassw0rd";
$database = "meubanco";

// Criar conexão


$link = new mysqli($servername, $username, $password, $database);

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

?>
