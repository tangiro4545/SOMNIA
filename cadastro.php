<?php

include("conexao.php");

$nome = $_POST['nome'];
$email = $_POST['email'];
$senha = password_hash($_POST['senha'], PASSWORD_DEFAULT);

$sql = "INSERT INTO usuario(nome,email,senha_hash)
VALUES ('$nome','$email','$senha')";

if($conn->query($sql)){
    header("Location: sobre.html");
}else{
    echo "Erro ao cadastrar";
}

?>