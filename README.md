# Estudo de caso de análise de dados da Bellabeat
#### Este projeto envolve analisar dados para obter informações sobre como os consumidores estão usando seus dispositivos inteligentes e fazer excelentes recomendações com base nos insights sobre como essas tendências podem nortear a estratégia de marketing da empresa. 

# Sobre a Empresa
Bellabeat é uma fabricante de produtos de alta tecnologia voltados à saúde para mulheres. 
A empresa acredita que a análise de dados de condicionamento físico a partir de dispositivos inteligentes pode ajudar a abrir novas oportunidades de crescimento.

# Produtos
- *O aplicativo Bellabeat* : fornece aos usuários dados de saúde relacionados à sua atividade, sono, estresse, ciclo menstrual e hábitos de atenção plena. Esses dados podem ajudar os usuários a entender melhor seus hábitos atuais e tomar decisões saudáveis.
- *Leaf* : o rastreador de bem-estar clássico da Bellabeat pode ser usado como pulseira, colar ou clipe. O rastreador Leaf se conecta ao aplicativo Bellabeat para rastrear a atividade, o sono e o estresse.
- *Time* : o relógio de bem-estar combina a aparência de um relógio clássico com tecnologia inteligente para rastrear a atividade como: sono e o estresse.
- *Spring* : é uma garrafa de água que rastreia a ingestão diária de água para garantir que você esteja adequadamente hidratado ao longo do dia.
 
## Perguntas norteadoras
- Quais são algumas das tendências no uso de dispositivos inteligentes?
- Como essas tendências podem se aplicar aos clientes da Bellabeat?
- Como essas tendências podem ajudar a influenciar a estratégia de marketing da Bellabeat?

## Conjunto de dados
Este é um conjunto de dados gerado por respondentes de uma pesquisa distribuída via Amazon Mechanical Turk.
Os dados do rastreador de condicionamento físico FitBit são de domínio público e estão armazenados em um conjunto de dados do Kaggle. 

Trinta usuários elegíveis do Fitbit consentiram com o envio de dados pessoais do rastreador, incluindo os resultados a cada minuto de atividade física, frequência cardíaca e monitoramento do sono. 
São abrangidas informações sobre atividades diárias, passos e frequência cardíaca, que podem ser usadas para explorar os hábitos dos usuários.

### Organização
O conjunto de dados é composto por 18 arquivos do tipo .CSV, sendo 15 organizados no formato longo e 3 no formato amplo. Cada usuário tem seu próprio ID exclusivo e linhas diferentes, visto que os dados são rastreados por dia e hora.

As Tabelas foram verificadas, classificadas e filtradas no RStudio.

## Privacidade
O conjunto de dados foi coletado e tratado em conformidade com o Regulamento Geral sobre a Proteção de Dados (GDPR), que visa garantir a privacidade e a segurança dos dados pessoais dos usuários.
Todos os dados pessoais e sensíveis foram anonimizados ou removidos.

# Preparação os dados 
### Processamento dos dados

1. Para análise, preparação e processamento dos dados foram utilizadas as seguintes bibliotecas:
- library(tidyverse)   /   library(lubridate)
- library(ggplot2) /    library(ggrepel)
- library(readr) /      library(dplyr)
- library(tidyr) /      library(here)
- library(skimr) /      library(janitor)
- library(corrplot)

2.  Importação dos datasets
3.  Explorar a estrutura dos dados 
4.  Padronização dos nomes das colunas para um melhor manejo
5.  Renomear os nomes das colunas, traduzindo para o português
6.  Conversão do formato de Datas
7.  Criação de uma coluna de *Dias da Semana* a fim de se obter uma melhor análise
8.  Separação da coluna *Data e Hora* para auxiliar nas futuras análises
9.  Criação de uma coluna com o *Total de Minutos Ativos*
10. Mesclando datasets para futuras análises
11. Remoção de *Valores Duplicados* e *NA*

# Análise
Nesta etapa, foram usadas ferramentas para formatar e transformar os dados para análise. Os dados são classificados e filtrados para selecionar as informações mais relevantes.
Identificou-se padrões e tendências nos dados e extraímos conclusões. Por fim, tomamos decisões fundamentadas nos dados e nas evidências.





