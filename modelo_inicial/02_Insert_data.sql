-- SCRIPT DE CARGA INICIAL – ECOMMERCE (Inicial)

-- 1️. CLIENTE
-- ==============================
INSERT INTO Cliente VALUES (1, 'João', 'A.', 'Silva', '12345678901', 'Rua A, 100');
INSERT INTO Cliente VALUES (2, 'Maria', 'B.', 'Souza', '98765432100', 'Rua B, 200');
INSERT INTO Cliente VALUES (3, 'Carlos', 'C.', 'Oliveira', '45678912345', 'Rua C, 300');
INSERT INTO Cliente VALUES (4, 'Ana', 'D.', 'Pereira', '11223344556', 'Rua D, 400');
INSERT INTO Cliente VALUES (5, 'Bruna', 'E.', 'Lima', '22334455667', 'Rua E, 500');
INSERT INTO Cliente VALUES (6, 'Pedro', 'F.', 'Costa', '33445566778', 'Rua F, 600');
INSERT INTO Cliente VALUES (7, 'Lucas', 'G.', 'Ferreira', '44556677889', 'Rua G, 700');
INSERT INTO Cliente VALUES (8, 'Paula', 'H.', 'Ribeiro', '55667788990', 'Rua H, 800');
INSERT INTO Cliente VALUES (9, 'Juliana', 'I.', 'Mendes', '66778899001', 'Rua I, 900');
INSERT INTO Cliente VALUES (10, 'Rafael', 'J.', 'Gomes', '77889900112', 'Rua J, 1000');


-- 2️. PAGAMENTO
-- ==============================
INSERT INTO Pagamento VALUES (1, 1, 'Crédito', 2000.00);
INSERT INTO Pagamento VALUES (2, 1, 'Débito', 1000.00);
INSERT INTO Pagamento VALUES (3, 1, 'Pix', 500.00);
INSERT INTO Pagamento VALUES (4, 1, 'Crédito', 3000.00);
INSERT INTO Pagamento VALUES (5, 1, 'Boleto', 800.00);
INSERT INTO Pagamento VALUES (6, 1, 'Crédito', 1200.00);
INSERT INTO Pagamento VALUES (7, 1, 'Débito', 900.00);
INSERT INTO Pagamento VALUES (8, 1, 'Pix', 700.00);
INSERT INTO Pagamento VALUES (9, 1, 'Crédito', 2500.00);
INSERT INTO Pagamento VALUES (10, 1, 'Boleto', 600.00);


-- 3️. PEDIDO
-- ==============================
INSERT INTO Pedido VALUES (1, 1, 'Enviado', 'Pedido de eletrônicos', 199.90, 'Pix');
INSERT INTO Pedido VALUES (2, 2, 'Entregue', 'Pedido de roupas', 249.90, 'Crédito');
INSERT INTO Pedido VALUES (3, 3, 'Em processamento', 'Pedido de livros', 89.90, 'Débito');
INSERT INTO Pedido VALUES (4, 4, 'Enviado', 'Pedido de brinquedos', 159.90, 'Pix');
INSERT INTO Pedido VALUES (5, 5, 'Entregue', 'Pedido de calçados', 299.90, 'Boleto');
INSERT INTO Pedido VALUES (6, 6, 'Cancelado', 'Pedido de utensílios', 79.90, 'Pix');
INSERT INTO Pedido VALUES (7, 7, 'Em processamento', 'Pedido de cosméticos', 149.90, 'Crédito');
INSERT INTO Pedido VALUES (8, 8, 'Entregue', 'Pedido de eletrônicos', 399.90, 'Débito');
INSERT INTO Pedido VALUES (9, 9, 'Enviado', 'Pedido de roupas', 199.90, 'Crédito');
INSERT INTO Pedido VALUES (10, 10, 'Entregue', 'Pedido de acessórios', 59.90, 'Pix');


-- 4️. PRODUTO
-- ==============================
INSERT INTO Produto VALUES (1, 'Camisa Polo', 'N', 'ADULTO', 'Camisa de algodão', 4, 'M');
INSERT INTO Produto VALUES (2, 'Tênis Sport', 'N', 'ADULTO', 'Tênis leve e confortável', 5, '42');
INSERT INTO Produto VALUES (3, 'Boneco Marvel', 'S', 'INFANTIL', 'Boneco colecionável', 4, 'ÚNICO');
INSERT INTO Produto VALUES (4, 'Livro Python', 'N', 'ADULTO', 'Livro técnico de programação', 5, 'ÚNICO');
INSERT INTO Produto VALUES (5, 'Bola de futebol', 'S', 'INFANTIL', 'Bola oficial tamanho 5', 5, 'P');
INSERT INTO Produto VALUES (6, 'Vestido Floral', 'N', 'ADULTO', 'Vestido de verão', 4, 'M');
INSERT INTO Produto VALUES (7, 'Carrinho HotWheels', 'S', 'INFANTIL', 'Miniatura colecionável', 5, 'ÚNICO');
INSERT INTO Produto VALUES (8, 'Fone Bluetooth', 'N', 'ADULTO', 'Fone sem fio', 4, 'ÚNICO');
INSERT INTO Produto VALUES (9, 'Camiseta Infantil', 'S', 'INFANTIL', 'Camiseta de algodão', 5, 'P');
INSERT INTO Produto VALUES (10, 'Mouse Gamer', 'N', 'ADULTO', 'Mouse óptico RGB', 5, 'ÚNICO');


-- 5️. VENDEDOR
-- ==============================
INSERT INTO Vendedor VALUES (1, 'Loja Esportiva', '12345678000111', NULL, 'São Paulo', '11999990001');
INSERT INTO Vendedor VALUES (2, 'Tech Store', '98765432000199', NULL, 'Rio de Janeiro', '21988880002');
INSERT INTO Vendedor VALUES (3, 'Kids World', '45678912000155', NULL, 'Curitiba', '41977770003');
INSERT INTO Vendedor VALUES (4, 'Moda Chic', '32165487000122', NULL, 'Belo Horizonte', '31966660004');
INSERT INTO Vendedor VALUES (5, 'Games BR', '15975348000133', NULL, 'Salvador', '71955550005');
INSERT INTO Vendedor VALUES (6, 'Livraria Saber', '75395126000188', NULL, 'Porto Alegre', '51944440006');
INSERT INTO Vendedor VALUES (7, 'Sound Plus', '85214796000177', NULL, 'Fortaleza', '85933330007');
INSERT INTO Vendedor VALUES (8, 'Loja ABC', '95175346000166', NULL, 'Brasília', '61922220008');
INSERT INTO Vendedor VALUES (9, 'Fashion Rio', '14725836000155', NULL, 'Niterói', '21911110009');
INSERT INTO Vendedor VALUES (10, 'Toys Mania', '36925814000144', NULL, 'Recife', '81900000010');


-- 6️. ESTOQUE
-- ==============================
INSERT INTO Estoque VALUES (1, 'São Paulo', 150);
INSERT INTO Estoque VALUES (2, 'Rio de Janeiro', 200);
INSERT INTO Estoque VALUES (3, 'Curitiba', 100);
INSERT INTO Estoque VALUES (4, 'Belo Horizonte', 120);
INSERT INTO Estoque VALUES (5, 'Salvador', 90);
INSERT INTO Estoque VALUES (6, 'Porto Alegre', 160);
INSERT INTO Estoque VALUES (7, 'Fortaleza', 80);
INSERT INTO Estoque VALUES (8, 'Brasília', 70);
INSERT INTO Estoque VALUES (9, 'Niterói', 110);
INSERT INTO Estoque VALUES (10, 'Recife', 130);


-- 7️. FORNECEDOR
-- ==============================
INSERT INTO Fornecedor VALUES (1, 'Fornecedor SP', '11111111000111', '1133334444');
INSERT INTO Fornecedor VALUES (2, 'Fornecedor RJ', '22222222000122', '2134445555');
INSERT INTO Fornecedor VALUES (3, 'Fornecedor PR', '33333333000133', '4135556666');
INSERT INTO Fornecedor VALUES (4, 'Fornecedor MG', '44444444000144', '3136667777');
INSERT INTO Fornecedor VALUES (5, 'Fornecedor BA', '55555555000155', '7137778888');
INSERT INTO Fornecedor VALUES (6, 'Fornecedor RS', '66666666000166', '5138889999');
INSERT INTO Fornecedor VALUES (7, 'Fornecedor CE', '77777777000177', '8539990000');
INSERT INTO Fornecedor VALUES (8, 'Fornecedor DF', '88888888000188', '6130001111');
INSERT INTO Fornecedor VALUES (9, 'Fornecedor RJ2', '99999999000199', '2131112222');
INSERT INTO Fornecedor VALUES (10, 'Fornecedor PE', '00000000000100', '8132223333');


-- 8️. PRODUTO_PEDIDO
-- ==============================
INSERT INTO Produto_Pedido VALUES (1, 1, 2, 'Entregue');
INSERT INTO Produto_Pedido VALUES (2, 2, 1, 'Entregue');
INSERT INTO Produto_Pedido VALUES (3, 3, 3, 'Em processamento');
INSERT INTO Produto_Pedido VALUES (4, 4, 1, 'Enviado');
INSERT INTO Produto_Pedido VALUES (5, 5, 2, 'Entregue');
INSERT INTO Produto_Pedido VALUES (6, 6, 1, 'Cancelado');
INSERT INTO Produto_Pedido VALUES (7, 7, 2, 'Em processamento');
INSERT INTO Produto_Pedido VALUES (8, 8, 1, 'Entregue');
INSERT INTO Produto_Pedido VALUES (9, 9, 3, 'Enviado');
INSERT INTO Produto_Pedido VALUES (10, 10, 1, 'Entregue');


-- 9️. PRODUTO_VENDEDOR
-- ==============================
INSERT INTO Produto_Vendedor VALUES (1, 1, 10, 'Ativo');
INSERT INTO Produto_Vendedor VALUES (2, 2, 8, 'Ativo');
INSERT INTO Produto_Vendedor VALUES (3, 3, 15, 'Ativo');
INSERT INTO Produto_Vendedor VALUES (4, 4, 5, 'Ativo');
INSERT INTO Produto_Vendedor VALUES (5, 5, 7, 'Ativo');
INSERT INTO Produto_Vendedor VALUES (6, 6, 9, 'Ativo');
INSERT INTO Produto_Vendedor VALUES (7, 7, 12, 'Ativo');
INSERT INTO Produto_Vendedor VALUES (8, 8, 20, 'Ativo');
INSERT INTO Produto_Vendedor VALUES (9, 9, 14, 'Ativo');
INSERT INTO Produto_Vendedor VALUES (10, 10, 11, 'Ativo');


-- 10. ESTOQUE_LOCALIZACAO
-- ==============================
INSERT INTO Estoque_Localizacao VALUES (1, 1, 'São Paulo - Bloco A');
INSERT INTO Estoque_Localizacao VALUES (2, 2, 'Rio de Janeiro - Depósito B');
INSERT INTO Estoque_Localizacao VALUES (3, 3, 'Curitiba - Galpão 1');
INSERT INTO Estoque_Localizacao VALUES (4, 4, 'Belo Horizonte - Setor 2');
INSERT INTO Estoque_Localizacao VALUES (5, 5, 'Salvador - Área Central');
INSERT INTO Estoque_Localizacao VALUES (6, 6, 'Porto Alegre - Zona Norte');
INSERT INTO Estoque_Localizacao VALUES (7, 7, 'Fortaleza - Leste');
INSERT INTO Estoque_Localizacao VALUES (8, 8, 'Brasília - Sul');
INSERT INTO Estoque_Localizacao VALUES (9, 9, 'Niterói - Oeste');
INSERT INTO Estoque_Localizacao VALUES (10, 10, 'Recife - Central');
