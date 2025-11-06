--------------------------------------------------------------------------------
-- BANCO DE DADOS: ORACLE
-- PROJETO: E-COMMERCE INICIAL
-- TOTAL DE TABELAS: 10
-- AUTOR: Juliana Mascarenhas - Instrutora (Digital Innovation One)
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- CLIENTE
--------------------------------------------------------------------------------
CREATE TABLE Cliente (
  idCliente NUMBER(7),
  Pnome VARCHAR2(45),
  Nome_do_meio VARCHAR2(45),
  Sobrenome VARCHAR2(45),
  CPF CHAR(11) NOT NULL,
  Endereco VARCHAR2(100),
  CONSTRAINT pk_cliente PRIMARY KEY (idCliente),
  CONSTRAINT unique_cpf_cliente UNIQUE (CPF)
);

--------------------------------------------------------------------------------
-- PRODUTO
--------------------------------------------------------------------------------
CREATE TABLE Produto (
  idProduto NUMBER(7),
  NomeProduto VARCHAR2(50),
  Classificacao_kids CHAR(1) DEFAULT 'N' CHECK (Classificacao_kids IN ('S','N')),
  Categoria VARCHAR2(45),
  Descricao VARCHAR2(100),
  Avaliacao NUMBER(2) DEFAULT 0,
  Tamanho VARCHAR2(10),
  CONSTRAINT pk_produto PRIMARY KEY (idProduto)
);

--------------------------------------------------------------------------------
-- PAGAMENTO
--------------------------------------------------------------------------------
CREATE TABLE Pagamento (
  idCliente NUMBER(7),
  idPagamento NUMBER(3),
  Tipo_Pagamento VARCHAR2(20),
  Limite NUMBER(10,2),
  CONSTRAINT pk_pagamento PRIMARY KEY (idCliente, idPagamento),
  CONSTRAINT fk_pagamento_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

--------------------------------------------------------------------------------
-- PEDIDO
--------------------------------------------------------------------------------
CREATE TABLE Pedido (
  idPedido NUMBER(7),
  idCliente NUMBER(7),
  Status_Pedido VARCHAR2(45),
  Descricao VARCHAR2(100),
  Valor_enviado NUMBER(10,2),
  Pagamento VARCHAR2(20),
  CONSTRAINT pk_pedido PRIMARY KEY (idPedido),
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

--------------------------------------------------------------------------------
-- VENDEDOR
--------------------------------------------------------------------------------
CREATE TABLE Vendedor (
  idVendedor NUMBER(7),
  Nome_Social VARCHAR2(255) NOT NULL,
  CNPJ CHAR(14),
  CPF CHAR(11),
  Localizacao VARCHAR2(100),
  Contato VARCHAR2(11) NOT NULL,
  CONSTRAINT pk_vendedor PRIMARY KEY (idVendedor),
  CONSTRAINT unique_cnpj_vendedor UNIQUE (CNPJ),
  CONSTRAINT unique_cpf_vendedor UNIQUE (CPF)
);

--------------------------------------------------------------------------------
-- ESTOQUE
--------------------------------------------------------------------------------
CREATE TABLE Estoque (
  idEstoque NUMBER(7),
  Localizacao VARCHAR2(255),
  Quantidade NUMBER(4),
  CONSTRAINT pk_estoque PRIMARY KEY (idEstoque)
);

--------------------------------------------------------------------------------
-- FORNECEDOR
--------------------------------------------------------------------------------
CREATE TABLE Fornecedor (
  idFornecedor NUMBER(5),
  Nome_Social VARCHAR2(255) NOT NULL,
  CNPJ CHAR(14),
  Contato VARCHAR2(11) NOT NULL,
  CONSTRAINT pk_fornecedor PRIMARY KEY (idFornecedor),
  CONSTRAINT unique_fornecedor UNIQUE (CNPJ)
);

--------------------------------------------------------------------------------
-- PRODUTO_PEDIDO (tabela de relação N:N)
--------------------------------------------------------------------------------
CREATE TABLE Produto_Pedido (
  idProduto NUMBER(7),
  idPedido NUMBER(7),
  Quantidade NUMBER(3) DEFAULT 1,
  Status VARCHAR2(20),
  CONSTRAINT pk_produto_pedido PRIMARY KEY (idProduto, idPedido),
  CONSTRAINT fk_produto_pedido_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
  CONSTRAINT fk_produto_pedido_pedido FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

--------------------------------------------------------------------------------
-- PRODUTO_VENDEDOR (tabela de relação N:N)
--------------------------------------------------------------------------------
CREATE TABLE Produto_Vendedor (
  idVendedor NUMBER(7),
  idProduto NUMBER(7),
  Quantidade NUMBER(3) DEFAULT 1,
  Status VARCHAR2(20),
  CONSTRAINT pk_produto_vendedor PRIMARY KEY (idVendedor, idProduto),
  CONSTRAINT fk_produto_vendedor_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
  CONSTRAINT fk_produto_vendedor_vendedor FOREIGN KEY (idVendedor) REFERENCES Vendedor(idVendedor)
);

--------------------------------------------------------------------------------
-- ESTOQUE_LOCALIZACAO (tabela de relação N:N)
--------------------------------------------------------------------------------
CREATE TABLE Estoque_Localizacao (
  idProduto NUMBER(7),
  idEstoque NUMBER(7),
  Local VARCHAR2(255) NOT NULL,
  CONSTRAINT pk_estoque_localizacao PRIMARY KEY (idProduto, idEstoque),
  CONSTRAINT fk_estoque_local_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
  CONSTRAINT fk_estoque_local_estoque FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque)
);
