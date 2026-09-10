CREATE DATABASE GameVault;
USE GameVault;
CREATE TABLE tb_cliente(
	id_cliente INT PRIMARY KEY 
AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE,
	telefone VARCHAR(20),
    cpf CHAR(20) UNIQUE,
    data_cadastro DATE
);
CREATE TABLE tb_jogo(
	id_jogo INT PRIMARY KEY
AUTO_INCREMENT,
	titulo VARCHAR(100) NOT NULL,
	genero VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    clas_ind VARCHAR(10),
    desenvolvedora VARCHAR(100),
    data_lanc DATE 
);

CREATE TABLE tb_venda(
	id_venda INT PRIMARY KEY 
AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	data_venda DATE,
    valor_total DECIMAL(10,2),
    
    FOREIGN KEY (id_cliente)
		REFERENCES tb_cliente(id_cliente)
);

CREATE TABLE tb_item_venda(
	id_item_venda INT PRIMARY KEY 
AUTO_INCREMENT,
	id_venda INT NOT NULL,
    id_jogo INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unit DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (id_venda)
		REFERENCES tb_venda(id_venda),
        
	FOREIGN KEY (id_jogo)
		REFERENCES tb_jogo(id_jogo)
);

CREATE TABLE tb_form_pag(
	id_pagamento INT PRIMARY KEY 
AUTO_INCREMENT,
	tipo_pag VARCHAR(30) NOT NULL
);
    
CREATE TABLE tb_pagamento(
	id_pag_venda INT PRIMARY KEY 
AUTO_INCREMENT,
	id_venda INT NOT NULL,
    id_pagamento INT NOT NULL,
    numero_parcelas INT DEFAULT 1,
    valor_pago DECIMAL(10,2) NOT NULL,
    status_pag VARCHAR(20) NOT NULL,
    
FOREIGN KEY (id_venda)
	REFERENCES tb_venda(id_venda),
    
FOREIGN KEY (id_pagamento)
	REFERENCES tb_from_pagamento(id_pagamento)
);

INSERT INTO tb_cliente(nome, email, telefone, data_cadastro, cpf)
	VALUES ('João Silva', 'joao.silva@email.com', '11987654321', '2026-06-13', '11111111111'),
('Maria Oliveira', 'maria.oliveira@email.com', '11987654322', '2026-06-13', '22222222222'),
('Pedro Santos', 'pedro.santos@email.com', '11987654323', '2026-06-13', '33333333333'),
('Ana Costa', 'ana.costa@email.com', '11987654324', '2026-06-13', '44444444444'),
('Lucas Ferreira', 'lucas.ferreira@email.com', '11987654325', '2026-06-13', '55555555555'),
('Juliana Almeida', 'juliana.almeida@email.com', '11987654326', '2026-06-13', '66666666666'),
('Gabriel Rodrigues', 'gabriel.rodrigues@email.com', '11987654327', '2026-06-13', '77777777777'),
('Beatriz Souza', 'beatriz.souza@email.com', '11987654328', '2026-06-13', '88888888888'),
('Rafael Martins', 'rafael.martins@email.com', '11987654329', '2026-06-13', '99999999999'),
('Camila Pereira', 'camila.pereira@email.com', '11987654330', '2026-06-13', '00000000000'); 

INSERT INTO tb_jogo(titulo, genero, preco, clas_ind, desenvolvedora, data_lanc)
	VALUES ('Elden Ring', 'RPG', 229.90, '16', 'FromSoftware', '2022-02-25'),
('Dark Souls Remastered', 'RPG', 159.90, '16', 'FromSoftware', '2018-05-25'),
('Dark Souls III', 'RPG', 229.90, '16', 'FromSoftware', '2016-04-12'),
('Sekiro: Shadows Die Twice', 'Ação/Aventura', 274.90, '16', 'FromSoftware', '2019-03-22'),
('Clair Obscur: Expedition 33', 'RPG', 249.90, '16', 'Sandfall Interactive', '2025-04-24'),
('Resident Evil Requiem', 'Terror', 349.90, '18', 'Capcom', '2026-02-27'),
('Alan Wake', 'Terror', 59.90, '16', 'Remedy Entertainment', '2012-02-16'),
('Alan Wake 2', 'Terror', 199.90, '18', 'Remedy Entertainment', '2023-10-27'),
('Hollow Knight', 'Metroidvania', 46.99, '10', 'Team Cherry', '2017-02-24'),
('Hades', 'Roguelike', 73.99, '14', 'Supergiant Games', '2020-09-17'),
('The Witcher 3: Wild Hunt', 'RPG', 129.90, '18', 'CD Projekt Red', '2015-05-19'),
('Red Dead Redemption 2', 'Ação/Aventura', 249.90, '18', 'Rockstar Games', '2018-10-26'),
('Cyberpunk 2077', 'RPG', 199.90, '18', 'CD Projekt Red', '2020-12-10'),
('Grand Theft Auto V', 'Ação', 119.90, '18', 'Rockstar Games', '2013-09-17'),
('Resident Evil 4 Remake', 'Terror', 199.90, '18', 'Capcom', '2023-03-24'),
('Resident Evil Village', 'Terror', 139.90, '18', 'Capcom', '2021-05-07'),
('Silent Hill 2 Remake', 'Terror', 349.90, '18', 'Bloober Team', '2024-10-08'),
('Lies of P', 'RPG', 249.90, '16', 'Neowiz', '2023-09-19'),
('Bloodborne', 'RPG', 99.90, '16', 'FromSoftware', '2015-03-24'),
('Demon''s Souls', 'RPG', 349.90, '16', 'Bluepoint Games', '2020-11-12'),
('Black Myth: Wukong', 'Ação/RPG', 229.90, '16', 'Game Science', '2024-08-20'),
('Monster Hunter Wilds', 'Ação/RPG', 279.90, '14', 'Capcom', '2025-02-28'),
('Devil May Cry 5', 'Ação', 99.90, '16', 'Capcom', '2019-03-08'),
('Persona 5 Royal', 'RPG', 249.90, '16', 'Atlus', '2019-10-31'),
('Baldur''s Gate 3', 'RPG', 199.90, '18', 'Larian Studios', '2023-08-03'),
('God of War Ragnarök', 'Ação/Aventura', 249.90, '18', 'Santa Monica Studio', '2022-11-09'),
('Ghost of Tsushima', 'Ação/Aventura', 249.90, '18', 'Sucker Punch Productions', '2020-07-17'),
('Minecraft', 'Sandbox', 99.90, '10', 'Mojang Studios', '2011-11-18'),
('Stardew Valley', 'Simulação', 24.99, 'Livre', 'ConcernedApe', '2016-02-26'),
('Terraria', 'Sandbox', 32.99, '10', 'Re-Logic', '2011-05-16');

INSERT INTO tb_form_pag(tipo_pag)
VALUES('Pix'),
('Crédito'),
('Débito');

SELECT * FROM tb_cliente;
SELECT * FROM tb_form_pag;
SELECT * FROM tb_pagamento;
SELECT * FROM tb_item_venda;
SELECT * FROM tb_jogo;