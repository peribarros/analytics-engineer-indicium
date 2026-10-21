{% docs __overview__ %}

# Bem-vindo à Documentação do Projeto dbt - Adventure Works (Comercial)

Este projeto dbt foi desenvolvido com foco em Engenharia de Analytics utilizando dados do ecossistema **Adventure Works** no ambiente **Databricks SQL**, seguindo uma arquitetura modular moderna dividida entre as camadas de **Staging** e **Marts**.

---

## 🏗️ Arquitetura do Projeto

O fluxo de dados segue uma estruturação limpa e padronizada:
1. **Staging (`stg`)**: Conexão direta com as fontes brutas (`sources`), aplicando padronização de nomenclatura (totalmente em português), tipagem explícita de colunas e limpeza inicial dos dados.
2. **Marts**: Camada de consumo estruturada em formato de **Star Schema** (Esquema Estrela), contendo dimensões consolidadas e tabelas fato otimizadas para análises comerciais.

---

## 📊 Modelos Principais

### Dimensões
* **`dim_cliente`**: Combina dados de clientes e pessoas físicas/jurídicas.
* **`dim_produto`**: Catálogo de produtos comercializados.
* **`dim_cartao`**: Informações de cartões de crédito utilizados nas transações.
* **`dim_localidade`**: Informações geográficas estruturadas (endereço, província/estado e país).
* **`dim_data`**: Dimensão temporal extraída para análises cronológicas.
* **`dim_motivo_venda`**: Classificação dos motivos de venda das ordens.

### Fato
* **`fct_vendas`**: Tabela central agregando o histórico de ordens de venda, métricas financeiras e chaves estrangeiras para as respetivas dimensões.

---

## 🔍 Testes e Qualidade de Dados
O projeto implementa rigorosos testes de qualidade integrados no dbt, incluindo:
* Validações de **unicidade** (`unique`) e **não-nulos** (`not_null`) nas chaves primárias.
* Testes de integridade referencial (`relationships`) entre as tabelas fato e dimensões.

---

## 🚀 Navegação e Execução
* Utilize a aba **Project** à esquerda para inspecionar a árvore de diretórios e modelos.
* Utilize a aba **Database** para explorar as tabelas geradas diretamente no Databricks.
* Para rodar e validar o projeto localmente, utilize:
  * `dbt run`: Para compilar e executar os modelos.
  * `dbt build`: Para executar os modelos e validar todos os testes em sequência.

{% enddocs %}