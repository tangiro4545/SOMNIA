<?php

$host = "localhost";
$usuario = "root";
$senha = "";
$banco = "somnia";

$conn = new mysqli($host, $usuario, $senha, $banco);

if($conn->connect_error){
    die("Erro: " . $conn->connect_error);
}

?>