CREATE DATABASE somnia;
USE somnia;

--usuario

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    idioma VARCHAR(50),
    renda_mensal DECIMAL(10,2)
);

--curriculo

CREATE TABLE curriculo (
    id_curriculo INT AUTO_INCREMENT PRIMARY KEY,
    profissao VARCHAR(100),
    escolaridade VARCHAR(100),

    id_usuario INT UNIQUE,

    CONSTRAINT fk_curriculo_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
);

--experiencia

CREATE TABLE experiencia (
    id_experiencia INT AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(100),
    empresa VARCHAR(100),
    tempo VARCHAR(50),

    id_curriculo INT NOT NULL,

    CONSTRAINT fk_experiencia_curriculo
        FOREIGN KEY (id_curriculo)
        REFERENCES curriculo(id_curriculo)
        ON DELETE CASCADE
);

--endereço

CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(100),
    estado VARCHAR(100),
    cidade VARCHAR(100),

    id_usuario INT UNIQUE,

    CONSTRAINT fk_endereco_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
);

--recomendação de viagem

CREATE TABLE recomendacao_viagem (
    id_viagem INT AUTO_INCREMENT PRIMARY KEY,
    destino VARCHAR(100),
    melhor_epoca VARCHAR(100),
    seguranca VARCHAR(50),
    hotel_recomendado VARCHAR(150),

    id_usuario INT NOT NULL,

    CONSTRAINT fk_viagem_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
);

--recomendação de moradia

CREATE TABLE recomendacao_moradia (
    id_recomendacao INT AUTO_INCREMENT PRIMARY KEY,
    pais_recomendado VARCHAR(100),
    cidade_recomendada VARCHAR(100),
    qualidade_vida VARCHAR(50),
    oportunidade_emprego VARCHAR(50),

    id_usuario INT NOT NULL,

    CONSTRAINT fk_moradia_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
);