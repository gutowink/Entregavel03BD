DROP TABLE venda;

CREATE TABLE venda
(
    vendaid INTEGER NOT NULL,
    clientesid VARCHAR(14),
    produtosid VARCHAR(26),
    quantidade INTEGER NOT NULL,
    preco_unitario INTEGER NOT NULL,
    valor_total INTEGER NOT NULL,
    data_venda DATE NOT NULL,
    PRIMARY KEY (clientesid, produtosid),
    FOREIGN KEY (clientesid) REFERENCES clientes(cpf),
    FOREIGN KEY (produtosid) REFERENCES produtos(sku)
);

-- prompt chatGPT: faça 5 inserts para a tabela venda

INSERT INTO venda (vendaid, clientesid, produtosid, quantidade, preco_unitario, data_venda, valor_total) VALUES
        (1, '111.111.111-11', 'SKU001', 2, 1000, '2024-03-15', 2000),
        (1, '111.111.111-11', 'SKU002', 1, 1500, '2024-03-15', 1500),
        (2, '222.222.222-22', 'SKU003', 3, 2000, '2024-05-22', 6000),
        (3, '333.333.333-33', 'SKU004', 1, 2500, '2024-07-10', 2500),
        (3, '333.333.333-33', 'SKU005', 2, 3000, '2024-07-10', 6000);

UPDATE produtos
SET preco = preco * 1.10
WHERE CAST(SUBSTR(sku, -1) AS INTEGER) % 2 = 0;