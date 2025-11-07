# 📜 Changelog — Modelo Refinado de E-commerce

Este documento descreve todas as **alterações estruturais** realizadas entre o **modelo inicial** e o **modelo refinado** do projeto.

---

## 🆕 Novas Tabelas

| Nome | Função |
|------|--------|
|**BAIRRO**|Armazena o ID, nome e identificador da cidade de cada bairro.|
|**CIDADE**|Armazena o ID, nome e identificador do estado de cada cidade.|
|**CLIENTE_CONTATO**|Resolve o relacionamento N:N entre CLIENTE e CONTATO, permitindo múltiplos contatos para um mesmo cliente.|
|**CLIENTE_ENDERECO**|Resolve o relacionamento N:N entre CLIENTE e ENDERECO, permitindo múltiplos clientes em um mesmo endereço.|
|**CONTATO**|Centraliza informações de contato de clientes, vendedores, lojas e fornecedores.|
|**ENDERECO**|Centraliza informações de endereço de clientes, vendedores, lojas e fornecedores (ex: "logradouro", "bairro", "CEP").|
|**ESTADO**|Armazena o ID, o nome e a UF de cada estado.|
|**FORNECEDOR_CONTATO**|Resolve o relacionamento N:N entre FORNECEDOR e CONTATO, permitindo múltiplos contatos por fornecedor.|
|**GENERO**|Armazena o ID e a descrição dos gêneros (ex: "Masculino", "Feminino", "Outro").|
|**LOJA**|Armazena o ID, o nome, o e-mail, o contato e endereço de cada loja.|
|**PEDIDO_STATUS**|Armazena o histórico de atualizações de status de cada pedido ao longo do tempo.|
|**PRODUTO_CATEGORIA**|Armazena o ID e o nome das categorias de produtos.|
|**PRODUTO_FORNECEDOR**|Resolve o relacionamento N:N entre PRODUTO e FORNECEDOR, pois um produto pode ter vários fornecedores.|
|**REGIAO**|Armazena o ID, o nome e a sigla de cada região do território nacional.|
|**SITUACAO_CLIENTE**|Armazena o ID e a descrição da situação atual de um cliente (ex: "Ativo", "Inativo", "Suspenso").|
|**STATUS_DESCRICAO**|Armazena o ID e a descrição do status de um pedido (ex: "Em preparação", "Enviado", "Entregue").|
|**TIPO_PAGAMENTO**|Armazena o ID e a descrição das formas de pagamento (ex: "Boleto", "Cartão de Crédito").|
|**TIPO_PESSOA**|Armazena o ID e a descrição do tipo de pessoa (ex: "Pessoa Física", "Pessoa Jurídica").|
|**VENDEDOR_CONTATO**|Resolve o relacionamento N:N entre VENDEDOR e CONTATO, permitindo múltiplos contatos por vendedor.|
|**VENDEDOR_TIPO_CONTRATO**|Armazena o ID e a descrição do tipo de contrato de um vendedor (ex: "CLT", "Freelancer", "PJ").|

---

## ✏️ Modificações em Tabelas Existentes

| Tabela | Modificação |
|---------|--------------|
| **FORNECEDOR** | Adição de novos atributos (**DATA_CADASTRO**, **ID_ENDERECO**, **EMAIL**, **ID_ENDERECO**).|
| **PEDIDO** | Adição de novos atributos (**ID_TIPO_PAGAMENTO**, **ID_VENDEDOR**, **ID_TIPO_PAGAMENTO**) e substituição de campos diretos por chaves estrangeiras. |
| **VENDEDOR** | Adição de novos atributos (**DATA_NASCIMENTO**, **DATA_CONTRATACAO**, **SALARIO**, **EMAIL**, **ID_GENERO**, **ID_TIPO_PESSOA**, **ID_TIPO_CONTRATO**, **ID_LOJA**, **ID_ENDERECO**).|
| **CLIENTE** | Adição de novos atributos (**DATA_NASCIMENTO**, **DATA_CADASTRO**, **CNPJ**, **EMAIL**, **ID_GENERO**, **ID_TIPO_PESSOA**, **ID_SITUACAO**). |
| **PRODUTO** | Substituição do atributo de categoria por chave estrangeira (**ID_CATEGORIA**). |
| **ESTOQUE_LOCALIZACAO** | Renomeada para **PRODUTO_LOJA_ESTOQUE**, com novos atributos de controle de estoque. |
| **PRODUTO_PEDIDO** | Renomeada para **ITEM_PEDIDO**. |

---

## 🗑️ Tabelas Removidas

| Tabela | Motivo |
|---------|--------|
| **PRODUTO_VENDEDOR** | Não havia utilidade prática; substituída por relações indiretas. |
| **PAGAMENTO** | Informações agora representadas nas tabelas **PEDIDO** e **TIPO_PAGAMENTO**. |
| **ESTOQUE** | Substituída pela tabela mais completa **PRODUTO_LOJA_ESTOQUE**. |

---

## 🧠 Resumo da Evolução
- O modelo refinado segue princípios de **3ª Forma Normal (3FN)**.  
- As entidades estão mais bem definidas e desacopladas.  
- A modelagem favorece **expansão futura**, como inclusão de múltiplas lojas, clientes e meios de pagamento.

---

📅 **Versão:** 2.0 (Modelo Refinado)  
📍 **Base:** Oracle SQL  
🧱 **Autor:** Alexis Pereira Dos Santos