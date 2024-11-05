DROP TABLE evento;

CREATE TABLE evento
(
    id VARCHAR(15) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    data DATE NOT NULL,
    administradorid VARCHAR(14),
    categoriaid VARCHAR(20) UNIQUE,
    FOREIGN KEY (categoriaid) REFERENCES categoria(id),
    FOREIGN KEY (administradorid) REFERENCES administrador(cpf)
);

-- prompt chatGPT: 10 inserts para a tabela evento

INSERT INTO evento (id, nome, data, administradorid, categoriaid) VALUES
    ('EV001', 'Workshop de Python', '2024-03-10', '111.111.111-11', 'CAT001'),
    ('EV002', 'Feira de Inovação', '2024-04-15', '222.222.222-22', 'CAT002'),
    ('EV003', 'Palestra sobre AI', '2024-05-05', '333.333.333-33', 'CAT003'),
    ('EV004', 'Congresso de TI', '2024-06-20', '444.444.444-44', 'CAT004'),
    ('EV005', 'Hackathon', '2024-07-30', '555.555.555-55', 'CAT005'),
    ('EV006', 'Seminário de Cloud', '2024-08-25', '666.666.666-66', 'CAT006'),
    ('EV007', 'Treinamento de Segurança', '2024-09-10', '777.777.777-77', 'CAT007'),
    ('EV008', 'Curso de DevOps', '2024-10-05', '888.888.888-88', 'CAT008'),
    ('EV009', 'Encontro de Startups', '2024-11-15', '999.999.999-99', 'CAT009'),
    ('EV010', 'Workshop de UX/UI', '2024-12-01', '123.123.123-12', 'CAT010');


DELETE FROM interesse;

-- prompt chatGPT: faça 15 inserts da tabela interesse, clientes com 2 interesses cada

INSERT INTO interesse (usuarioid, categoriaid) VALUES
        ('111.111.111-11', 'CAT001'),
        ('111.111.111-11', 'CAT002'),
        ('222.222.222-22', 'CAT003'),
        ('222.222.222-22', 'CAT004'),
        ('333.333.333-33', 'CAT005'),
        ('333.333.333-33', 'CAT006'),
        ('444.444.444-44', 'CAT007'),
        ('444.444.444-44', 'CAT008'),
        ('555.555.555-55', 'CAT009'),
        ('555.555.555-55', 'CAT010'),
        ('666.666.666-66', 'CAT011'),
        ('666.666.666-66', 'CAT012'),
        ('777.777.777-77', 'CAT013'),
        ('777.777.777-77', 'CAT014'),
        ('888.888.888-88', 'CAT015'),
        ('888.888.888-88', 'CAT001'),
        ('999.999.999-99', 'CAT002'),
        ('999.999.999-99', 'CAT003'),
        ('123.123.123-12', 'CAT004'),
        ('123.123.123-12', 'CAT005'),
        ('321.321.321-32', 'CAT006'),
        ('321.321.321-32', 'CAT007'),
        ('456.456.456-45', 'CAT008'),
        ('456.456.456-45', 'CAT009'),
        ('654.654.654-65', 'CAT010'),
        ('654.654.654-65', 'CAT011'),
        ('789.789.789-78', 'CAT012'),
        ('789.789.789-78', 'CAT013'),
        ('987.987.987-98', 'CAT014'),
        ('987.987.987-98', 'CAT015');

DROP TABLE mensagem;

CREATE TABLE mensagem
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mensagem TEXT NOT NULL,
    data_envio DATE NOT NULL,
    autor VARCHAR(14),
    destinatario VARCHAR(14),
    eventoid VARCHAR(15),
    FOREIGN KEY (eventoid) REFERENCES evento(id),
    FOREIGN KEY (autor) REFERENCES usuario(cpf),
    FOREIGN KEY (destinatario) REFERENCES usuario(cpf)
);

-- prompt chatGPT: faça 15 inserts para a tabela mensagem

INSERT INTO mensagem (mensagem, data_envio, autor, destinatario, eventoid) VALUES
    ('Olá, Carlos! Como você está?', '2024-01-15', '222.222.222-22', '111.111.111-11', 'EV001'),
    ('Ana, estou interessado no evento.', '2024-01-16', '333.333.333-33', '222.222.222-22', 'EV002'),
    ('Paulo, aguardo mais informações.', '2024-01-17', '444.444.444-44', '333.333.333-33', 'EV003'),
    ('Mariana, podemos nos encontrar amanhã?', '2024-01-18', '555.555.555-55', '444.444.444-44', 'EV004'),
    ('Rafael, gostaria de confirmar minha presença.', '2024-01-19', '666.666.666-66', '555.555.555-55', 'EV005'),
    ('Fernanda, qual será o local do evento?', '2024-01-20', '777.777.777-77', '666.666.666-66', 'EV006'),
    ('Lucas, estou animado para o workshop!', '2024-01-21', '888.888.888-88', '777.777.777-77', 'EV001'),
    ('Bianca, pode me enviar o link de inscrição?', '2024-01-22', '999.999.999-99', '888.888.888-88', 'EV002'),
    ('Thiago, agradeço pela informação!', '2024-01-23', '123.123.123-12', '999.999.999-99', 'EV003'),
    ('Júlia, estou pronto para participar!', '2024-01-24', '321.321.321-32', '123.123.123-12', 'EV004'),
    ('Gabriel, por favor, me mantenha atualizado.', '2024-01-25', '456.456.456-45', '321.321.321-32', 'EV005'),
    ('Clara, quero discutir algumas ideias.', '2024-01-26', '654.654.654-65', '456.456.456-45', 'EV006'),
    ('Pedro, muito obrigado pela ajuda.', '2024-01-27', '789.789.789-78', '654.654.654-65', 'EV007'),
    ('Marcelo, vamos nos reunir para mais detalhes?', '2024-01-28', '987.987.987-98', '789.789.789-78', 'EV008'),
    ('Isabela, espero vê-lo no evento!', '2024-01-29', '111.111.111-11', '987.987.987-98', 'EV009');

ALTER TABLE usuario ADD COLUMN idade;

UPDATE usuario
SET idade = ABS(RANDOM() % 86) + 15
WHERE idade IS NULL