DROP TABLE artista;

CREATE TABLE artista
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50) NOT NULL,
    banda VARCHAR(50),
    albumid VARCHAR(50),
    FOREIGN KEY (albumid) REFERENCES album(id)
);

DROP TABLE turne;

CREATE TABLE turne
(
    id VARCHAR(26) PRIMARY KEY,
    artistaid INTEGER,
    cidade VARCHAR(33) NOT NULL,
    data_show DATE NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero VARCHAR(3) NOT NULL,
    FOREIGN KEY (artistaid) REFERENCES artista(id)
);

CREATE TABLE album
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE musica
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50) NOT NULL,
    albumid VARCHAR(50),
    FOREIGN KEY (albumid) REFERENCES album(id)
);

-- prompt chatGPT: faça inserts para as tabelas artista e turnes

-- Inserts para a tabela turne
INSERT INTO turne (id, artistaid, cidade, data_show, rua, numero) VALUES
    ('T001', 1, 'Porto Alegre', '2024-10-01', 'Rua X', '100'),
    ('T002', 2, 'São Paulo', '2024-10-05', 'Rua Y', '200'),
    ('T003', 3, 'Rio de Janeiro', '2024-10-10', 'Rua Z', '300'),
    ('T004', 4, 'Curitiba', '2024-10-15', 'Rua W', '400'),
    ('T005', 5, 'Belo Horizonte', '2024-10-20', 'Rua V', '500'),
    ('T006', 6, 'Brasília', '2024-10-25', 'Rua U', '600'),
    ('T007', 7, 'Salvador', '2024-10-30', 'Rua T', '700'),
    ('T008', 8, 'Recife', '2024-11-01', 'Rua S', '800'),
    ('T009', 9, 'Fortaleza', '2024-11-05', 'Rua R', '900'),
    ('T010', 10, 'Manaus', '2024-11-10', 'Rua Q', '1000'),
    ('T011', 11, 'Florianópolis', '2024-11-15', 'Rua P', '1100'),
    ('T012', 12, 'Porto Velho', '2024-11-20', 'Rua O', '1200'),
    ('T013', 13, 'Natal', '2024-11-25', 'Rua N', '1300'),
    ('T014', 14, 'João Pessoa', '2024-12-01', 'Rua M', '1400'),
    ('T015', 15, 'Aracaju', '2024-12-05', 'Rua L', '1500');


INSERT INTO artista (nome, banda, albumid) VALUES
    ('John Lennon', 'The Beatles', 'Abbey Road'),
    ('David Gilmour', 'Pink Floyd', 'The Dark Side of the Moon'),
    ('Jimmy Page', 'Led Zeppelin', 'Led Zeppelin IV'),
    ('Freddie Mercury', 'Queen', 'A Night at the Opera'),
    ('Kurt Cobain', 'Nirvana', 'Nevermind'),
    ('James Hetfield', 'Metallica', 'Master of Puppets'),
    ('Axl Rose', 'Guns N Roses', 'Appetite for Destruction'),
    ('Angus Young', 'AC/DC', 'Back in Black'),
    ('Mick Jagger', 'The Rolling Stones', 'Let It Bleed'),
    ('Anthony Kiedis', 'Red Hot Chili Peppers', 'Californication'),
    ('Eddie Vedder', 'Pearl Jam', 'Ten'),
    ('Thom Yorke', 'Radiohead', 'OK Computer'),
    ('Liam Gallagher', 'Oasis', '(Whats the Story) Morning Glory?'),
    ('Bono', 'U2', 'The Joshua Tree'),
    ('Jim Morrison', 'The Doors', 'L.A. Woman');

-- prompt chatGPT: 15 albuns e 15 musicas

INSERT INTO album (nome) VALUES
    ('Abbey Road'),
    ('The Dark Side of the Moon'),
    ('Led Zeppelin IV'),
    ('A Night at the Opera'),
    ('Nevermind'),
    ('Master of Puppets'),
    ('Appetite for Destruction'),
    ('Back in Black'),
    ('Let It Bleed'),
    ('Californication'),
    ('Ten'),
    ('OK Computer'),
    ('(Whats the Story) Morning Glory?'),
    ('The Joshua Tree'),
    ('L.A. Woman');

INSERT INTO musica (nome, albumid) VALUES
    ('Come Together', 1),
    ('Money', 2),
    ('Stairway to Heaven', 3),
    ('Bohemian Rhapsody', 4),
    ('Smells Like Teen Spirit', 5),
    ('Master of Puppets', 6),
    ('Sweet Child O Mine', 7),
    ('Back in Black', 8),
    ('Gimme Shelter', 9),
    ('Californication', 10),
    ('Alive', 11),
    ('Karma Police', 12),
    ('Wonderwall', 13),
    ('With or Without You', 14),
    ('Riders on the Storm', 15);

DROP TABLE avaliacao_turne;
DROP TABLE avaliacao_album;

CREATE TABLE avaliacao_turne
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nota INTEGER NOT NULL,
    data DATE NOT NULL,
    clienteid VARCHAR(14),
    turnesid VARCHAR(26),
    artistaid INTEGER,
    FOREIGN KEY (artistaid) REFERENCES artista(id),
    FOREIGN KEY (clienteid) REFERENCES cliente(cpf),
    FOREIGN KEY (turnesid) REFERENCES turne(id)
);

CREATE TABLE avaliacao_album
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nota INTEGER NOT NULL,
    data DATE NOT NULL,
    clienteid VARCHAR(14),
    albumid VARCHAR(26),
    artistaid INTEGER,
    FOREIGN KEY (artistaid) REFERENCES artista(id),
    FOREIGN KEY (clienteid) REFERENCES cliente(cpf),
    FOREIGN KEY (albumid) REFERENCES album(id)
);


-- prompt chatGPT: faça 10 inserts para as tabelas de avaliação

INSERT INTO avaliacao_turne (nota, data, clienteid, turnesid, artistaid) VALUES
    (5, '2024-09-01', '111.111.111-11', 'T001', 1),
    (4, '2024-09-02', '222.222.222-22', 'T002', 2),
    (5, '2024-09-03', '333.333.333-33', 'T003', 3),
    (3, '2024-09-04', '444.444.444-44', 'T004', 4),
    (5, '2024-09-05', '555.555.555-55', 'T005', 5),
    (4, '2024-09-06', '666.666.666-66', 'T006', 6),
    (5, '2024-09-07', '777.777.777-77', 'T007', 7),
    (4, '2024-09-08', '888.888.888-88', 'T008', 8),
    (5, '2024-09-09', '999.999.999-99', 'T009', 9),
    (3, '2024-09-10', '123.123.123-12', 'T010', 10);

INSERT INTO avaliacao_album (nota, data, clienteid, albumid, artistaid) VALUES
    (5, '2024-09-01', '111.111.111-11', 1, 1),
    (4, '2024-09-02', '222.222.222-22', 2, 2),
    (5, '2024-09-03', '333.333.333-33', 3, 3),
    (3, '2024-09-04', '444.444.444-44', 4, 4),
    (5, '2024-09-05', '555.555.555-55', 5, 5),
    (4, '2024-09-06', '666.666.666-66', 6, 6),
    (5, '2024-09-07', '777.777.777-77', 7, 7),
    (4, '2024-09-08', '888.888.888-88', 8, 8),
    (5, '2024-09-09', '999.999.999-99', 9, 9),
    (3, '2024-09-10', '123.123.123-12', 10, 10);


--prompt chatGPT: para 2 artistas 5 turnes para cada.

-- Turnês do artista John Lennon (artistaid = 1)
INSERT INTO turne (id, artistaid, cidade, data_show, rua, numero) VALUES
    ('T016', 1, 'Belo Horizonte', '2024-11-10', 'Rua A', '101'),
    ('T017', 1, 'São Paulo', '2024-11-15', 'Rua B', '202'),
    ('T018', 1, 'Rio de Janeiro', '2024-11-20', 'Rua C', '303'),
    ('T019', 1, 'Curitiba', '2024-11-25', 'Rua D', '404'),
    ('T020', 1, 'Porto Alegre', '2024-12-01', 'Rua E', '505');

-- Turnês do artista David Gilmour (artistaid = 2)
INSERT INTO turne (id, artistaid, cidade, data_show, rua, numero) VALUES
    ('T021', 2, 'Florianópolis', '2024-11-11', 'Rua F', '606'),
    ('T022', 2, 'Salvador', '2024-11-16', 'Rua G', '707'),
    ('T023', 2, 'Recife', '2024-11-21', 'Rua H', '808'),
    ('T024', 2, 'Fortaleza', '2024-11-26', 'Rua I', '909'),
    ('T025', 2, 'Manaus', '2024-12-02', 'Rua J', '1006');

--prompt chatGPT: 5 avaliaçoes de 5 album para 3 clientes

-- Avaliações dos álbuns pelo cliente '111.111.111-11'
INSERT INTO avaliacao_album (nota, data, clienteid, albumid, artistaid) VALUES
    (5, '2024-09-15', '111.111.111-11', 1, 1),
    (4, '2024-09-16', '111.111.111-11', 2, 2),
    (3, '2024-09-17', '111.111.111-11', 3, 3),
    (5, '2024-09-18', '111.111.111-11', 4, 4),
    (4, '2024-09-19', '111.111.111-11', 5, 5);

-- Avaliações dos álbuns pelo cliente '222.222.222-22'
INSERT INTO avaliacao_album (nota, data, clienteid, albumid, artistaid) VALUES
    (4, '2024-09-15', '222.222.222-22', 1, 1),
    (5, '2024-09-16', '222.222.222-22', 2, 2),
    (4, '2024-09-17', '222.222.222-22', 3, 3),
    (3, '2024-09-18', '222.222.222-22', 4, 4),
    (5, '2024-09-19', '222.222.222-22', 5, 5);

-- Avaliações dos álbuns pelo cliente '333.333.333-33'
INSERT INTO avaliacao_album (nota, data, clienteid, albumid, artistaid) VALUES
    (3, '2024-09-15', '333.333.333-33', 1, 1),
    (4, '2024-09-16', '333.333.333-33', 2, 2),
    (5, '2024-09-17', '333.333.333-33', 3, 3),
    (4, '2024-09-18', '333.333.333-33', 4, 4),
    (3, '2024-09-19', '333.333.333-33', 5, 5);

--prompt chatGPT: avaliação de 2 shows de cada artista na visão de 5 clientes

-- Avaliações da turnê em Belo Horizonte (T016)
INSERT INTO avaliacao_turne (nota, data, clienteid, turnesid, artistaid) VALUES
    (5, '2024-11-02', '111.111.111-11', 'T016', 1),
    (4, '2024-11-03', '222.222.222-22', 'T016', 1),
    (3, '2024-11-04', '333.333.333-33', 'T016', 1),
    (5, '2024-11-05', '444.444.444-44', 'T016', 1),
    (4, '2024-11-06', '555.555.555-55', 'T016', 1);

-- Avaliações da turnê em São Paulo (T017)
INSERT INTO avaliacao_turne (nota, data, clienteid, turnesid, artistaid) VALUES
    (4, '2024-11-02', '111.111.111-11', 'T017', 1),
    (5, '2024-11-03', '222.222.222-22', 'T017', 1),
    (3, '2024-11-04', '333.333.333-33', 'T017', 1),
    (5, '2024-11-05', '444.444.444-44', 'T017', 1),
    (4, '2024-11-06', '555.555.555-55', 'T017', 1);

-- Avaliações da turnê em Florianópolis (T021)
INSERT INTO avaliacao_turne (nota, data, clienteid, turnesid, artistaid) VALUES
    (5, '2024-11-02', '111.111.111-11', 'T021', 2),
    (4, '2024-11-03', '222.222.222-22', 'T021', 2),
    (3, '2024-11-04', '333.333.333-33', 'T021', 2),
    (5, '2024-11-05', '444.444.444-44', 'T021', 2),
    (4, '2024-11-06', '555.555.555-55', 'T021', 2);

-- Avaliações da turnê em Salvador (T022)
INSERT INTO avaliacao_turne (nota, data, clienteid, turnesid, artistaid) VALUES
    (4, '2024-11-02', '111.111.111-11', 'T022', 2),
    (5, '2024-11-03', '222.222.222-22', 'T022', 2),
    (3, '2024-11-04', '333.333.333-33', 'T022', 2),
    (5, '2024-11-05', '444.444.444-44', 'T022', 2),
    (4, '2024-11-06', '555.555.555-55', 'T022', 2);
