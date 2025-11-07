--------------------------------------------------------------------------------
-- BANCO DE DADOS: ORACLE
-- PROJETO: E-COMMERCE REFINADO
-- TOTAL DE TABELAS: 27
-- AUTOR: ALEXIS PEREIRA DOS SANTOS
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- TABELA: GENERO
--------------------------------------------------------------------------------
CREATE TABLE GENERO (
    ID_GENERO NUMBER(1) PRIMARY KEY,
    DESCRICAO VARCHAR2(30) NOT NULL,

    CONSTRAINT UQ_GENERO_DESCRICAO UNIQUE(DESCRICAO)
);

--------------------------------------------------------------------------------
-- TABELA: TIPO_PESSOA (PF OU PJ)
--------------------------------------------------------------------------------
CREATE TABLE TIPO_PESSOA (
    ID_TIPO_PESSOA NUMBER(1) PRIMARY KEY,
    DESCRICAO VARCHAR2(30) NOT NULL,

    CONSTRAINT UQ_TIPO_PESSOA_DESCRICAO UNIQUE(DESCRICAO)
);

--------------------------------------------------------------------------------
-- TABELA: SITUACAO_CLIENTE
--------------------------------------------------------------------------------
CREATE TABLE SITUACAO_CLIENTE (
    ID_SITUACAO NUMBER(1) PRIMARY KEY,
    DESCRICAO VARCHAR2(30) NOT NULL,

    CONSTRAINT UQ_SITUACAO_CLIENTE_DESCRICAO UNIQUE(DESCRICAO)
);

--------------------------------------------------------------------------------
-- TABELA: REGIAO
--------------------------------------------------------------------------------

CREATE TABLE REGIAO(
    ID_REGIAO NUMBER(1) PRIMARY KEY,
    NOME_REGIAO VARCHAR(20) NOT NULL,
    SIGLA CHAR(2) NOT NULL,

    CONSTRAINT UQ_REGIAO_NOME_REGIAO UNIQUE(NOME_REGIAO),
    CONSTRAINT UQ_REGIAO_SIGLA UNIQUE(SIGLA)
);

--------------------------------------------------------------------------------
-- TABELA: ESTADO
--------------------------------------------------------------------------------
CREATE TABLE ESTADO(
    ID_ESTADO NUMBER(2) PRIMARY KEY,
    NOME_ESTADO VARCHAR2(25) NOT NULL,
    UF CHAR(2) NOT NULL,
    ID_REGIAO NUMBER(1) NOT NULL,

    CONSTRAINT FK_ESTADO_ID_REGIAO 
        FOREIGN KEY(ID_REGIAO) REFERENCES REGIAO(ID_REGIAO),

    CONSTRAINT UQ_ESTADO_NOME_ESTADO UNIQUE(NOME_ESTADO),
    CONSTRAINT UQ_ESTADO_UF UNIQUE(UF)
);

--------------------------------------------------------------------------------
-- TABELA: CIDADE
--------------------------------------------------------------------------------
CREATE TABLE CIDADE(
    ID_CIDADE NUMBER(4) PRIMARY KEY,
    NOME_CIDADE VARCHAR2(30) NOT NULL,
    ID_ESTADO NUMBER(2) NOT NULL,

    CONSTRAINT FK_CIDADE_ID_ESTADO 
        FOREIGN KEY (ID_ESTADO) REFERENCES ESTADO(ID_ESTADO),

    CONSTRAINT UQ_CIDADE_NOME_CIDADE UNIQUE(NOME_CIDADE)
);

--------------------------------------------------------------------------------
-- TABELA: BAIRRO
--------------------------------------------------------------------------------
CREATE TABLE BAIRRO(
    ID_BAIRRO NUMBER(5) PRIMARY KEY,
    NOME_BAIRRO VARCHAR2(30) NOT NULL,
    ID_CIDADE NUMBER(4) NOT NULL,

    CONSTRAINT FK_BAIRRO_ID_CIDADE
        FOREIGN KEY(ID_CIDADE) REFERENCES CIDADE(ID_CIDADE),

    CONSTRAINT UQ_BAIRRO_NOME_BAIRRO UNIQUE(NOME_BAIRRO)
);

--------------------------------------------------------------------------------
-- TABELA: ENDERECO
--------------------------------------------------------------------------------
CREATE TABLE ENDERECO (
    ID_ENDERECO NUMBER(8) PRIMARY KEY,
    CEP VARCHAR2(10) NOT NULL,
    LOGRADOURO VARCHAR2(30) NOT NULL,
    ID_BAIRRO NUMBER(5) NOT NULL,
    NUMERO VARCHAR2(6) NOT NULL, -- pode conter letras (ex: "37B")
    COMPLEMENTO VARCHAR(20)
);

--------------------------------------------------------------------------------
-- TABELA: CLIENTE
--------------------------------------------------------------------------------
CREATE TABLE CLIENTE (
    ID_CLIENTE NUMBER(7) PRIMARY KEY,
    NOME VARCHAR2(30) NOT NULL,
    SOBRENOME VARCHAR2(50) NOT NULL,
    DATA_NASCIMENTO DATE,
    DATA_CADASTRO DATE DEFAULT SYSDATE NOT NULL,
    CPF CHAR(11),
    CNPJ CHAR(14),
    EMAIL VARCHAR2(40) NOT NULL,
    ID_GENERO NUMBER(1),
    ID_TIPO_PESSOA NUMBER(1) NOT NULL,
    ID_SITUACAO NUMBER(1) NOT NULL,

    CONSTRAINT FK_CLIENTE_ID_GENERO 
        FOREIGN KEY (ID_GENERO) REFERENCES GENERO(ID_GENERO),
    CONSTRAINT FK_CLIENTE_ID_TIPO_PESSOA 
        FOREIGN KEY (ID_TIPO_PESSOA) REFERENCES TIPO_PESSOA(ID_TIPO_PESSOA),
    CONSTRAINT FK_CLIENTE_ID_SITUACAO 
        FOREIGN KEY (ID_SITUACAO) REFERENCES SITUACAO_CLIENTE(ID_SITUACAO),

    CONSTRAINT UQ_CLIENTE_CPF   UNIQUE (CPF),
    CONSTRAINT UQ_CLIENTE_CNPJ  UNIQUE (CNPJ),
    CONSTRAINT UQ_CLIENTE_EMAIL UNIQUE (EMAIL),

    CONSTRAINT CK_CLIENTE_CPF_CNPJ CHECK (
        (ID_TIPO_PESSOA = 1 AND CPF IS NOT NULL AND CNPJ IS NULL) OR
        (ID_TIPO_PESSOA = 2 AND CNPJ IS NOT NULL AND CPF IS NULL)
    )
);

--------------------------------------------------------------------------------
-- TABELA: CLIENTE_ENDERECO (tabela de relação N:N)
--------------------------------------------------------------------------------
CREATE TABLE CLIENTE_ENDERECO (
    ID_CLIENTE NUMBER(7),
    ID_ENDERECO NUMBER(8),
    ENDERECO_PRINCIPAL CHAR(1) NOT NULL,

    PRIMARY KEY (ID_CLIENTE, ID_ENDERECO),

    CONSTRAINT FK_CLIENTE_ENDERECO_ID_CLIENTE 
        FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
    CONSTRAINT FK_CLIENTE_ENDERECO_ID_ENDERECO 
        FOREIGN KEY (ID_ENDERECO) REFERENCES ENDERECO(ID_ENDERECO),

    CONSTRAINT CK_CLIENTE_ENDERECO_ENDERECO_PRINCIPAL CHECK (ENDERECO_PRINCIPAL IN (0, 1))
);

--------------------------------------------------------------------------------
-- TABELA: CONTATO
--------------------------------------------------------------------------------
CREATE TABLE CONTATO (
    ID_CONTATO NUMBER(8) PRIMARY KEY,
    CONTATO VARCHAR2(15) NOT NULL,

    CONSTRAINT UQ_CONTATO_CONTATO UNIQUE(CONTATO)
);

--------------------------------------------------------------------------------
-- TABELA: LOJA
--------------------------------------------------------------------------------
CREATE TABLE LOJA (
    ID_LOJA NUMBER(4) PRIMARY KEY,
    NOME_LOJA VARCHAR2(30) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    EMAIL VARCHAR2(30) NOT NULL,
    ID_CONTATO NUMBER(8) NOT NULL,
    ID_ENDERECO NUMBER(8) NOT NULL,

    CONSTRAINT FK_LOJA_ID_CONTATO 
        FOREIGN KEY (ID_CONTATO) REFERENCES CONTATO(ID_CONTATO),
    CONSTRAINT FK_LOJA_ID_ENDERECO 
        FOREIGN KEY (ID_ENDERECO) REFERENCES ENDERECO(ID_ENDERECO),

    CONSTRAINT UQ_LOJA_CNPJ UNIQUE(CNPJ),
    CONSTRAINT UQ_LOJA_EMAIL UNIQUE(EMAIL)
);

--------------------------------------------------------------------------------
-- TABELA: VENDEDOR_TIPO_CONTRATO
--------------------------------------------------------------------------------
CREATE TABLE VENDEDOR_TIPO_CONTRATO (
    ID_TIPO_CONTRATO NUMBER(1) PRIMARY KEY,
    DESCRICAO VARCHAR2(20) NOT NULL,

    CONSTRAINT UQ_VENDEDOR_TIPO_CONTRATO_DESCRICAO UNIQUE(DESCRICAO)
);

--------------------------------------------------------------------------------
-- TABELA: VENDEDOR
--------------------------------------------------------------------------------
CREATE TABLE VENDEDOR (
    ID_VENDEDOR NUMBER(7) PRIMARY KEY,
    NOME VARCHAR2(30) NOT NULL,
    SOBRENOME VARCHAR2(50) NOT NULL,
    DATA_NASCIMENTO DATE,
    DATA_CONTRATACAO DATE DEFAULT SYSDATE NOT NULL,
    SALARIO NUMBER(7,2),
    CPF CHAR(11),
    CNPJ CHAR(14),
    EMAIL VARCHAR2(30) NOT NULL,
    ID_GENERO NUMBER(1),
    ID_TIPO_PESSOA NUMBER(1) NOT NULL,
    ID_TIPO_CONTRATO NUMBER(1) NOT NULL,
    ID_LOJA NUMBER(4) NOT NULL,
    ID_ENDERECO NUMBER(8) NOT NULL,

    CONSTRAINT FK_VENDEDOR_ID_LOJA 
        FOREIGN KEY (ID_LOJA) REFERENCES LOJA(ID_LOJA),
    CONSTRAINT FK_VENDEDOR_ID_TIPO_CONTRATO 
        FOREIGN KEY (ID_TIPO_CONTRATO) REFERENCES VENDEDOR_TIPO_CONTRATO(ID_TIPO_CONTRATO),
    CONSTRAINT FK_VENDEDOR_ID_ENDERECO 
        FOREIGN KEY (ID_ENDERECO) REFERENCES ENDERECO(ID_ENDERECO),
    CONSTRAINT FK_VENDEDOR_ID_TIPO_PESSOA
        FOREIGN KEY (ID_TIPO_PESSOA) REFERENCES TIPO_PESSOA(ID_TIPO_PESSOA),

    CONSTRAINT UQ_VENDEDOR_CPF   UNIQUE(CPF),
    CONSTRAINT UQ_VENDEDOR_CNPJ  UNIQUE(CNPJ),
    CONSTRAINT UQ_VENDEDOR_EMAIL UNIQUE(EMAIL),

    CONSTRAINT CK_VENDEDOR_CPF_CNPJ CHECK (
        (ID_TIPO_PESSOA = 1 AND CPF IS NOT NULL AND CNPJ IS NULL) OR
        (ID_TIPO_PESSOA = 2 AND CNPJ IS NOT NULL AND CPF IS NULL)
        )
    );

--------------------------------------------------------------------------------
-- TABELA: TIPO_PAGAMENTO
--------------------------------------------------------------------------------
CREATE TABLE TIPO_PAGAMENTO (
    ID_TIPO_PAGAMENTO NUMBER(1) PRIMARY KEY,
    DESCRICAO VARCHAR2(30) NOT NULL,

    CONSTRAINT UQ_TIPO_PAGAMENTO_DESCRICAO UNIQUE(DESCRICAO)
);

--------------------------------------------------------------------------------
-- TABELA: STATUS_DESCRICAO
--------------------------------------------------------------------------------
CREATE TABLE STATUS_DESCRICAO (
    ID_STATUS NUMBER(1) PRIMARY KEY,
    DESCRICAO VARCHAR2(20) NOT NULL,

    CONSTRAINT UQ_STATUS_DESCRICAO_DESCRICAO UNIQUE(DESCRICAO)
);

--------------------------------------------------------------------------------
-- TABELA: PEDIDO
--------------------------------------------------------------------------------
CREATE TABLE PEDIDO (
    ID_PEDIDO NUMBER(7) PRIMARY KEY,
    ID_CLIENTE NUMBER(7) NOT NULL,
    ID_VENDEDOR NUMBER(7) NOT NULL,
    ID_TIPO_PAGAMENTO NUMBER(1) NOT NULL,
    DATA_PEDIDO DATE DEFAULT SYSDATE NOT NULL,

    CONSTRAINT FK_PEDIDO_ID_VENDEDOR 
        FOREIGN KEY (ID_VENDEDOR) REFERENCES VENDEDOR(ID_VENDEDOR),
    CONSTRAINT FK_PEDIDO_ID_TIPO_PAGAMENTO 
        FOREIGN KEY (ID_TIPO_PAGAMENTO) REFERENCES TIPO_PAGAMENTO(ID_TIPO_PAGAMENTO),
    CONSTRAINT FK_PEDIDO_ID_CLIENTE 
        FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);

--------------------------------------------------------------------------------
-- TABELA: PEDIDO_STATUS 
--------------------------------------------------------------------------------
CREATE TABLE PEDIDO_STATUS (
    ID_PEDIDO NUMBER(7),
    ID_STATUS NUMBER(1),
    DATA_ATUALIZACAO DATE DEFAULT SYSDATE NOT NULL,

    PRIMARY KEY (ID_PEDIDO, ID_STATUS),

    CONSTRAINT FK_PEDIDO_STATUS_ID_PEDIDO 
        FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
    CONSTRAINT FK_PEDIDO_STATUS_ID_STATUS 
        FOREIGN KEY (ID_STATUS) REFERENCES STATUS_DESCRICAO(ID_STATUS)
);

--------------------------------------------------------------------------------
-- TABELA: FORNECEDOR
--------------------------------------------------------------------------------
CREATE TABLE FORNECEDOR (
    ID_FORNECEDOR NUMBER(4) PRIMARY KEY,
    NOME_SOCIAL VARCHAR2(100) NOT NULL,
    DATA_CADASTRO DATE DEFAULT SYSDATE NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    EMAIL VARCHAR2(30) NOT NULL,
    ID_ENDERECO NUMBER(8)  NOT NULL,
    
    CONSTRAINT FK_FORNECEDOR_ID_ENDERECO 
        FOREIGN KEY (ID_ENDERECO) REFERENCES ENDERECO(ID_ENDERECO),

    CONSTRAINT UQ_FORNECEDOR_CNPJ UNIQUE(CNPJ),
    CONSTRAINT UQ_FORNECEDOR_EMAIL UNIQUE(EMAIL)
);

--------------------------------------------------------------------------------
-- TABELA: PRODUTO_CATEGORIA
--------------------------------------------------------------------------------
CREATE TABLE PRODUTO_CATEGORIA (
    ID_CATEGORIA NUMBER(3) PRIMARY KEY,
    DESCRICAO VARCHAR2(30) NOT NULL,

    CONSTRAINT UQ_PRODUTO_CATEGORIA_DESCRICAO UNIQUE(DESCRICAO)
);

--------------------------------------------------------------------------------
-- TABELA: PRODUTO
--------------------------------------------------------------------------------
CREATE TABLE PRODUTO (
    ID_PRODUTO NUMBER(5) PRIMARY KEY,
    NOME_PRODUTO VARCHAR2(100) NOT NULL,
    CLASSIFICACAO_KIDS CHAR(1), 
    DESCRICAO VARCHAR2(255),
    AVALIACAO NUMBER(3,2),
    TAMANHO VARCHAR2(20),
    ID_CATEGORIA NUMBER(3) NOT NULL,

    CONSTRAINT FK_PRODUTO_ID_CATEGORIA 
        FOREIGN KEY (ID_CATEGORIA) REFERENCES PRODUTO_CATEGORIA(ID_CATEGORIA),
    CONSTRAINT CK_PRODUTO_CLASSIFICACAO_KIDS CHECK(CLASSIFICACAO_KIDS IN (0, 1))
);

--------------------------------------------------------------------------------
-- TABELA: PRODUTO_FORNECEDOR (tabela de relação N:N)
--------------------------------------------------------------------------------
CREATE TABLE PRODUTO_FORNECEDOR (
    ID_PRODUTO NUMBER(5),
    ID_FORNECEDOR NUMBER(4),

    PRIMARY KEY (ID_PRODUTO, ID_FORNECEDOR),

    CONSTRAINT FK_PRODUTO_FORNECEDOR_ID_FORNECEDOR 
        FOREIGN KEY (ID_FORNECEDOR) REFERENCES FORNECEDOR(ID_FORNECEDOR),
    CONSTRAINT FK_PRODUTO_FORNECEDOR_ID_PRODUTO 
        FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO(ID_PRODUTO)
);

--------------------------------------------------------------------------------
-- TABELA: PRODUTO_LOJA_ESTOQUE (tabela de relação N:N)
--------------------------------------------------------------------------------
CREATE TABLE PRODUTO_LOJA_ESTOQUE (
    ID_PRODUTO NUMBER(5),
    ID_LOJA NUMBER(4),
    QUANTIDADE NUMBER(5),
    ESTOQUE_MINIMO NUMBER(3),
    ESTOQUE_MAXIMO NUMBER(5),

    PRIMARY KEY (ID_PRODUTO, ID_LOJA),

    CONSTRAINT FK_PRODUTO_LOJA_ESTOQUE_ID_PRODUTO 
        FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO(ID_PRODUTO),
    CONSTRAINT FK_PRODUTO_LOJA_ESTOQUE_ID_LOJA 
        FOREIGN KEY (ID_LOJA) REFERENCES LOJA(ID_LOJA),

    CONSTRAINT CK_PRODUTO_LOJA_ESTOQUE_ESTOQUE_MIN_MAX CHECK (ESTOQUE_MINIMO <= ESTOQUE_MAXIMO)
);

--------------------------------------------------------------------------------
-- TABELA: ITEM_PEDIDO (tabela de relação N:N)
--------------------------------------------------------------------------------
CREATE TABLE ITEM_PEDIDO (
    ID_PEDIDO NUMBER(7),
    ID_PRODUTO NUMBER(5),
    QUANTIDADE NUMBER(6) NOT NULL,
    PRECO_UNITARIO NUMBER(7,2) NOT NULL,
    DESCONTO NUMBER(7,2),

    PRIMARY KEY (ID_PEDIDO, ID_PRODUTO),

    CONSTRAINT FK_ITEM_PEDIDO_ID_PEDIDO 
        FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
    CONSTRAINT FK_ITEM_PEDIDO_ID_PRODUTO 
        FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO(ID_PRODUTO)
);

--------------------------------------------------------------------------------
-- TABELA: FORNECEDOR_CONTATO (tabela de relação N:N)
--------------------------------------------------------------------------------
CREATE TABLE FORNECEDOR_CONTATO (
    ID_FORNECEDOR NUMBER(4),
    ID_CONTATO NUMBER(8),

    PRIMARY KEY (ID_FORNECEDOR, ID_CONTATO),

    CONSTRAINT FK_FORNECEDOR_CONTATO_ID_FORNECEDOR 
        FOREIGN KEY (ID_FORNECEDOR) REFERENCES FORNECEDOR(ID_FORNECEDOR),
    CONSTRAINT FK_FORNECEDOR_CONTATO_ID_CONTATO 
        FOREIGN KEY (ID_CONTATO) REFERENCES CONTATO(ID_CONTATO)
);

--------------------------------------------------------------------------------
-- TABELA: VENDEDOR_CONTATO (tabela de relação N:N)
--------------------------------------------------------------------------------
CREATE TABLE VENDEDOR_CONTATO (
    ID_VENDEDOR NUMBER(7),
    ID_CONTATO NUMBER(8),

    PRIMARY KEY (ID_VENDEDOR, ID_CONTATO),

    CONSTRAINT FK_VENDEDOR_CONTATO_ID_VENDEDOR 
        FOREIGN KEY (ID_VENDEDOR) REFERENCES VENDEDOR(ID_VENDEDOR),
    CONSTRAINT FK_VENDEDOR_CONTATO_ID_CONTATO 
        FOREIGN KEY (ID_CONTATO) REFERENCES CONTATO(ID_CONTATO)
);

--------------------------------------------------------------------------------
-- TABELA: CLIENTE_CONTATO (tabela de relação N:N)
--------------------------------------------------------------------------------
CREATE TABLE CLIENTE_CONTATO (
    ID_CLIENTE NUMBER(7),
    ID_CONTATO NUMBER(8),

    PRIMARY KEY (ID_CLIENTE, ID_CONTATO),

    CONSTRAINT FK_CLIENTE_CONTATO_ID_CLIENTE 
        FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
    CONSTRAINT FK_CLIENTE_CONTATO_ID_CONTATO 
        FOREIGN KEY (ID_CONTATO) REFERENCES CONTATO(ID_CONTATO)
);