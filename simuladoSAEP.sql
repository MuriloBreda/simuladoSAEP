create database simuladoSAEP;
use simuladoSAEP;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE empresas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE salas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    n_Sala INT NOT NULL,
    bloco VARCHAR(50) NOT NULL,
    empresa_id INT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,

    FOREIGN KEY (empresa_id) REFERENCES empresas(id)
);

CREATE TABLE agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    descricao VARCHAR(255),
    sala_id INT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,

    FOREIGN KEY (sala_id) REFERENCES salas(id)
);

INSERT INTO usuarios 
(nome, email, senha, created_at, updated_at)
VALUES
('Administrador', 'admin@saep.com', SHA2('123456', 256), NOW(), NOW()),
('Carlos Oliveira', 'carlos@saep.com', SHA2('123456', 256), NOW(), NOW()),
('Mariana Santos', 'mariana@saep.com', SHA2('123456', 256), NOW(), NOW());

INSERT INTO empresas
(nome, cnpj, telefone, email, created_at, updated_at)
VALUES
('Empresa 1', '00.000.000/0001-91', '(16) 99999-1111', 'empresaUM@email.com', NOW(), NOW()),
('Empresa 2', '33.000.167/0001-01', '(16) 98888-2222', 'empresaDOIS@email.com', NOW(), NOW()),
('Empresa 3', '47.960.950/0001-21', '(16) 97777-3333', 'empresaTRES@email.com', NOW(), NOW());

INSERT INTO salas
(n_sala, bloco, empresa_id, created_at, updated_at)
VALUES
('1', 'Bloco A', 1, NOW(), NOW()),
('2', 'Bloco B', 2, NOW(), NOW()),
('3', 'Bloco C', 3, NOW(), NOW());

INSERT INTO agendamentos
(data, hora, descricao, sala_id, created_at, updated_at)
VALUES
('2026-09-21', '08:00:00', 'Reunião Um', 1, NOW(), NOW()),
('2026-09-22', '10:30:00', 'Reunião Dois', 2, NOW(), NOW()),
('2026-09-23', '14:00:00', 'Reunião Três', 3, NOW(), NOW());

select * from usuarios;

select * from empresas;

select * from salas;

select * from agendamentos;