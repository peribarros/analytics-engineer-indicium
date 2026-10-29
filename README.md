Markdown
# 🚴‍♂️ Adventure Works - Modern Analytics Stack (MAS) & Analytics Engineer Certification

[![dbt Cloud](https://img.shields.io/badge/dbt-Cloud-orange.svg?logo=dbt&logoColor=white)](https://www.getdbt.com/)
[![Databricks](https://img.shields.io/badge/Databricks-Lakehouse-red.svg?logo=databricks&logoColor=white)](https://databricks.com/)
[![Power BI](https://img.shields.io/badge/Power%20BI-Self--Service%20BI-yellow.svg?logo=powerbi&logoColor=white)](https://powerbi.microsoft.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

Repositório oficial do projeto prático desenvolvido para a **Certificação em Analytics Engineer da Indicium AI**. O objetivo principal é desenhar, implementar e documentar uma infraestrutura analítica de ponta a ponta para a **Adventure Works (AW)**, utilizando a metodologia do *Modern Analytics Stack* (MAS).

---

## Sumário
1. [Visão Geral do Projeto](#-visão-geral-do-projeto)
2. [Arquitetura & Stack Tecnológica](#-arquitetura--stack-tecnológica)
3. [Modelagem Conceitual (Star Schema)](#-modelagem-conceitual-star-schema)
4. [Transformação de Dados & Qualidade (dbt)](#-transformação-de-dados--qualidade-dbt)
5. [Painel de BI & Principais Insights](#-painel-de-bi--principais-insights)
6. [Governança, FinOps & Planejamento](#-governança-finops--planejamento)
7. [Estrutura do Repositório](#-estrutura-do-repositório)

---

## Visão Geral do Projeto
A Adventure Works é uma indústria de bicicletas em expansão que lida com mais de 500 produtos, 20.000 clientes e 31.000 pedidos. Para mitigar resistências internas da diretoria comercial e garantir a confiança executiva (especialmente do CEO Carlos Silveira e da Diretora Comercial Silvana Teixeira), este projeto implementou uma arquitetura moderna orientada a dados com foco em:
* Confiabilidade Absoluta: Reconciliação contábil validada (ex: faturamento bruto de 2011 fixado exatamente em `$12.646.112,16`).
* Descoberta de Alto Impacto: Identificação de que os registos `NULL` em motivos de venda correspondem ao canal B2B de grandes contas corporativas de alto valor.
* Agilidade Multi-Cloud: Demonstração da portabilidade de modelos dbt entre **Databricks** e **AWS Redshift**.

---

## Arquitetura & Stack Tecnológica
* Fontes (Raw): Banco de dados transacional PostgreSQL (`schema: adventure_works`).
* Data Lakehouse / DW: Databricks (Delta Lake) / AWS Redshift.
* Transformação & Orquestração: dbt Cloud (com versionamento em GitHub).
* Visualização: Power BI (Self-Service BI interativo).

```text
[ PostgreSQL (OLTP) ] 
       │
       ▼ (ELT / Delta Lake)
[ Databricks / Redshift ] 
       │
       ▼ (dbt Cloud - Staging ➔ Marts)
[ Camada Analítica (Star Schema) ] 
       │
       ▼
[ Power BI (Dashboards & Insights) ]
📐 Modelagem Conceitual (Star Schema)
O Data Warehouse foi modelado em formato estrela (Star Schema), centrado na tabela fato de itens de pedido (fct_sales), rodeada pelas dimensões essenciais para responder às perguntas de negócio:

fct_sales: Grão ao nível de item de pedido (salesorderdetailid), contendo métricas calculadas de Faturamento Bruto, Descontos e Faturamento Líquido.

dim_products: Catálogo de produtos, categorias e subcategorias.

dim_customers: Dados consolidados de clientes e pessoas.

dim_territories: Localização geográfica detalhada (cidade, estado e país).

dim_sales_reasons: Motivos associados às vendas (incluindo o mapeamento do canal B2B).

⚡ Transformação de Dados & Qualidade (dbt)
O projeto utiliza o dbt para modularizar as transformações em camadas (staging, intermediate, marts), garantindo testes automatizados rigorosos:

Testes de Source: Validação de integridade e frescura dos dados brutos (dbt test --select source:*).

Testes de Primary Keys: Assegurando unicidade e não-nulidade (unique, not_null) em todas as dimensões e fatos.

Teste de Dados do CEO (Customizado): Implementação de um teste singular em SQL (assert_gross_sales_2011.sql) para validar a exatidão contábil de 2011 ($12.646.112,16).

Tags Estratégicas: Organização por tags (staging, marts) para execuções parciais eficientes (dbt run).

Comandos principais executados no pipeline:

Bash
dbt test --select source:*
dbt run
dbt test

Painel de BI & Respostas de Negócio
O dashboard interativo no Power BI foi estruturado para responder com precisão cirúrgica às exigências da diretoria:

Item 5-b/e/f: Série temporal consolidada de pedidos, quantidades e faturamento total.

Item 5-c: Análise de Ticket Médio por mês, ano e região geográfica.

Item 5-d: Ranking dos Top 10 Clientes por valor negociado.

Item 5-e: As Top 5 Cidades em volume de faturamento.

Item 5-g: O produto com maior volume de vendas sob o motivo "Promotion" é o "AWC Logo Cap" (com 2.048 unidades).

Item 5-h (Insights): Desmistificação dos nulos no motivo de venda, comprovando que representam contas corporativas B2B estratégicas para o crescimento da receita sem queima de margem em promoções.

Governança, FinOps & Planejamento

Governança de Dados: Aplicação de boas práticas de mascaramento de dados sensíveis (PII hash SHA-256), controle de acesso baseado em papéis (RBAC) via Unity Catalog, e linhagem de dados transparente.

Relatório FinOps: Monitoramento de custos de computação na nuvem, otimização de tamanhos de instâncias de clusters do Databricks e políticas de auto-suspensão para evitar desperdício orçamentário.

Planejamento Ágil (Scrum): Cronograma estruturado em Sprints divididas entre alinhamento com stakeholders (João Muller, Carlos Silveira, Silvana Teixeira e Nilson Ramos), modelagem, testes e entrega final.

📂 Estrutura do Repositório
Plaintext
├── models/
│   ├── staging/         # Modelos stg_* (limpeza e padronização inicial)
│   ├── intermediate/    # Regras de negócio intermediárias e joins lógicos
│   └── marts/           # Tabelas finais dim_* e fct_* (Star Schema)
├── tests/               # Testes singulares (ex: validação contábil do CEO Carlos)
├── analyses/            # Consultas ad-hoc e validações exploratórias
├── dbt_project.yml      # Configurações globais do projeto dbt
└── README.md            # Documentação oficial do projeto
Desenvolvido com excelência técnica para a Certificação em Analytics Engineer — Indicium AI.