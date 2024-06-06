# Analise de dados do BellaBeat

#### Este projeto envolve analisar dados para obter informações sobre como os consumidores estão usando seus dispositivos inteligentes e fazer excelentes recomendações com base nos insights sobre como essas tendências podem nortear a estratégia de marketing da empresa. 

## Sobre a Empresa
Bellabeat é uma fabricante de produtos de alta tecnologia voltados à saúde para mulheres. 
A empresa acredita que a análise de dados de condicionamento físico a partir de dispositivos inteligentes pode ajudar a abrir novas oportunidades de crescimento.

## Produtos
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

## Preparação os dados 
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

## Análise
Nesta etapa, foram usadas ferramentas para formatar e transformar os dados para análise. Os dados são classificados e filtrados para selecionar as informações mais relevantes.
Identificou-se padrões e tendências nos dados e extraímos conclusões, após uma análise estatística.

### Principais Descobertas
- A média de passos totais dados por dia é 7.638.
- A média de distância total percorrida por dia é 5.490 km.
- A média de distância ativa leve percorrida por dia é 3.341 km, cerca de 61% da distância total.
- A média de distância muito ativa percorrida por dia é 1.503 km, cerca de 27% da distância total.
- A média de distância moderadamente ativa percorrida por dia é 0.5675 km, cerca de 10% da distância total.
- A média de distância ativa sedentária percorrida por dia é 0.001606 km, cerca de 0,03% da distância total.
- A média de minutos muito ativos por dia é 21.16, o que equivale a 0,35 horas.
- A média de minutos levemente ativos por dia é 192.8, o que equivale a 3,21 horas.
- A média de minutos razoavelmente ativos por dia é 13.56, o que equivale a 0,23 horas.
- A média de minutos sedentários por dia é 991.2, o que equivale a 16,52 horas.
- A média de calorias queimadas por dia é 2.304, variando conforme peso, altura, idade, sexo e metabolismo.
- A média de minutos dormindo por dia é 419.2, o que equivale a 7 horas de sono.
- A média de tempo na cama por dia é 458.5 minutos, o que equivale a 7,6 horas.
- A média de calorias queimadas por hora do dia é 97.39, variando conforme a rotina e as atividades do usuário.
- A média de intensidade por hora do dia é 12.04, variando conforme a rotina e as atividades do usuário.
- A média de passos dados por hora do dia é 320.2, variando conforme a rotina e as atividades do usuário.

### Nesta etapa, há uma compreensão da visualização de dados e são desenvolvidos recursos visuais eficazes. A comunicação ocorre de maneira clara e persuasiva.

## Distribuição de Calorias
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/d103a4ca-9410-4070-9033-93be87368fd5)


 O gráfico de histograma acima representa a distribuição de frequências da variável Calorias. É possível observar que há uma concentração de dados aparentemente equilibrada tanto à esquerda quanto à direita. Isso indica que a distribuição dessa amostra é quase simétrica. Além disso, o gráfico apresenta dois picos, sendo o segundo relativamente menor, sugerindo a existência de dois grupos distintos: um que queima cerca de 2.000 calorias por dia e outro que queima cerca de 2.800 calorias. A linha vertical tracejada destaca a média, que é de 2.304.


## Distribuição de Passos Totais
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/860efdbe-2aa5-4834-a093-1cff6d8178f0)


É possível observar neste histograma que há uma maior concentração de dados com valores menores na extremidade esquerda, caracterizada por uma cauda que se estende à direita. Isso indica que a distribuição dessa amostra é distorcida à direita.
Outro aspecto importante a notar é a presença de alguns outliers. A linha vertical tracejada destaca a média de 7.638.

##  Distribuição de Distância Total 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/1f607da0-0b42-4f0f-a582-ae62efab7cde)

O gráfico acima representa a distribuição de frequências da variável Distância Total. Observa-se que há uma concentração de dados com valores menores na extremidade esquerda. Isso indica que a distribuição dessa amostra é distorcida à direita. Outro aspecto importante a notar é a presença de alguns outliers, que são pontos de dados isolados dos demais. A linha vertical tracejada destaca a média, que é de 5.490.

---------

## Distribuição de Minutos Muito Ativos 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/837d833c-6469-4731-ad83-58d05cc77e84)


O histograma acima com curva de densidade ajustada representa a distribuição de frequências da variável Minutos Muito Ativos. Observa-se que há uma maior concentração de dados com valores menores na extremidade esquerda, caracterizada por uma cauda que se estende à direita. Isso indica que a distribuição dessa amostra é distorcida à direita. A linha vertical tracejada apresenta a média, que é de 21.16.

--------------

##  Distribuição de Minutos Razoavelmente Ativos 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/e404ab7b-5692-44d5-87d8-02833417a210)


O histograma acima representa a distribuição de frequências da variável Minutos Razoavelmente Ativos. É possível observar que há uma maior concentração de dados com valores menores na extremidade esquerda. Isso indica que a distribuição dessa amostra é distorcida à direita. A linha vertical tracejada destaca a média, que é de 13.56.

------------------------

##  Distribuição de Minutos Levemente Ativos 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/51b3d208-d3ee-4d68-b8e8-482bc0406a85)


O gráfico de histograma acima com curva de densidade ajustada representa a distribuição de frequências da variável Minutos Levemente Ativos. É possível observar que há uma maior concentração de dados com valores menores à esquerda, em comparação com os valores maiores à direita. Isso indica que a distribuição dessa amostra é assimétrica à direita. A linha vertical tracejada destaca a média, que é de 192.8.

------------------------

## Distribuição de Minutos Sedentários 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/c5a7051b-b33b-4613-80fc-e73f8c48e395)


O histograma acima com curva de densidade ajustada representa a distribuição de frequências da variável Minutos Sedentários. É possível observar que há uma maior concentração de dados com valores maiores à direita, em comparação com os valores menores à esquerda.  Além disso, o gráfico apresenta dois picos, sugerindo a existência de dois grupos distintos: um que gasta cerca de 730 minutos em atividade de intensidade sedentária por dia e outro que gasta cerca de 1.150 minutos. A linha vertical tracejada destaca a média, que é de 991.2.

----------------------
## Distribuição de Total de Minutos Dormindo 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/7fbea504-3da0-4433-a437-eedce2f9146e)

O gráfico de histograma acima com curva de densidade ajustada representa a distribuição de frequências da variável Total de Minutos Dormindo. É possível observar que há uma concentração de dados aparentemente equilibrada tanto à esquerda quanto à direita. Isso indica que a distribuição dessa amostra é quase simétrica. A linha vertical tracejada destaca a média, que é de 419.2.

-----------------
##  Distribuição de Tempo Total na Cama 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/6e6d622e-3527-4136-a9a5-ff0a6c9c795a)


O histograma acima representa a distribuição de frequências da variável Tempo Total na Cama. É possível observar que há uma concentração de dados aparentemente equilibrada tanto à esquerda quanto à direita. Isso indica que a distribuição dessa amostra é quase simétrica. A linha vertical tracejada destaca a média, que é de 458.5.

----------------------
 ## Proporção de Minutos por Intensidades 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/7dec75c1-a9de-46b3-bd34-c02b9aec6b45)

O gráfico de pizza acima compara a proporção de usuários de acordo com a média de minutos por intensidade: sedentários, levemente ativos, razoavelmente ativos e muito ativos. 

Ele mostra que a maior parte dos usuários é composta por sedentários, que corresponde a 81,3% do total, seguida pelos levemente ativos, que representam 15,8%. Os usuários muito ativos e razoavelmente ativos são minoria, que equivalem a 1,7% e 1,1% respectivamente.

--------------
## Proporção de Distancias por Intensidades
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/525f2095-0966-41f1-896d-3e759cb5584c)


O gráfico de pizza acima compara a proporção de usuários de acordo com a média de distância por intensidade: leve, moderada e muito ativa. Ele mostra que a maior parte dos usuários percorre uma distância leve, que corresponde a 61,7% do total, seguida pela muito ativa, que representa 27,8%, e moderada, que equivale apenas 10,5%.

---------------------
## Comparação entre Minutos Dormindo e Tempo na Cama
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/f2512122-9e7b-4a01-9351-1e7364f9e613)

O gráfico de colunas acima compara a Média de Minutos Dormindo com a Média de Tempo na Cama. Ele mostra que os usuários passam mais tempo na cama do que dormindo de fato, cerca de 39.3 minutos.

------------------
## Passos Totais vs Calorias
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/087c1bcb-1f95-4179-b7cc-92f8ee65e300)

O gráfico de dispersão acima mostra que existe uma correlação linear positiva moderada de 0.59 entre Passos Totais e Calorias. Isso significa que o número total de passos dados corresponde a mais calorias queimadas. A linha vertical tracejada destaca a média de passos, que é de 7.638, enquanto a linha horizontal destaca a média de calorias, que é de 2.304.

------------------
## Passos Totais vs Distância Total 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/4a72eb9c-8663-4f2a-b267-218bdea0b6b5)

O gráfico de dispersão acima mostra que existe uma correlação linear positiva muito forte de 0.99 entre Passos Totais e Distância Total. Isso significa que o número total de passos dados corresponde a mais distância percorrida. A linha vertical tracejada destaca a média de passos, que é de 7.638, enquanto a horizontal destaca a média de distância, que é de 5.490.

-------------------
## Minutos Sedentários vs Passos Totais
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/fb5856fc-c712-4ef0-af66-8b4368e9566b)

O gráfico de dispersão acima mostra que existe uma correlação linear negativa fraca de -0.33 entre Minutos Sedentários e Passos Totais. Isso significa que o total de minutos gastos em atividade de intensidade sedentária corresponde a menos passos dados. A linha vertical tracejada destaca a média de minutos sedentários, que é de 991.2.

------------------
## Minutos Muito Ativos vs Passos Totais 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/c4cffe98-0761-4a1d-9df9-761a29233cd3)

O gráfico de dispersão acima mostra que existe uma correlação linear positiva moderada de 0.67 entre Minutos Muito Ativos e Passos Totais. Isso significa que o total de minutos gastos em atividade de intensidade muito ativa corresponde a mais passos dados. A linha vertical tracejada destaca a média de minutos muito ativos, que é de 21.16.

-----------------
## Total de Minutos Dormindo vs Tempo Total na Cama
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/27bc7f88-c114-4a06-87b1-a88f0c683a3d)

O gráfico de dispersão acima mostra que existe uma correlação linear positiva muito forte de 0.93 entre Total de Minutos Dormindo e Tempo Total na Cama. Isso significa que o número total de minutos dormindo corresponde a mais tempo na cama. A linha vertical tracejada destaca a média de minutos dormindo, que é de 419.2, enquanto a horizontal destaca a média de tempo na cama, que é de 458.5.

--------------------
## Média de Calorias por Dia da Semana
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/70783bbd-225d-4f3c-81c4-ef99ee471daa)

O gráfico de colunas acima compara a média de calorias queimadas por dia da semana. Ele mostra que os usuários atingem ou ultrapassam essa média, que é de 2.304, destacada pela linha horizontal, em quatro dias: segunda, terça, sexta e sábado. Por outro lado, na quarta, na quinta e no domingo, os usuários queimam menos calorias do que a média.

--------------------------
##  Média de Passos por Dia da Semana 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/84975d3a-b0ea-4adc-bcc1-d0998c981b8a)

O gráfico de colunas acima compara a média de passos dados por dia da semana. Ele mostra que os usuários atingem ou ultrapassam essa média, que é de 7.638, destacada pela linha horizontal, em três dias: segunda, terça e sábado. Por outro lado, na quarta, na quinta, na sexta e no domingo, os usuários dão menos passos do que a média.

-----------------
## Média de Distância por Dia da Semana
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/de55c5c8-389a-4dbb-b5fe-cfc8cd599914)

O gráfico de colunas acima compara a média de distância percorrida por dia da semana. Ele mostra que os usuários atingem ou ultrapassam essa média, que é de 5.490, destacada pela linha horizontal, em três dias: segunda, terça e sábado. Por outro lado, na quarta, na quinta, na sexta e no domingo, os usuários percorrem menos distância do que a média.

--------
## Média de Minutos Dormindo por Dia da Semana 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/2011873e-58f4-40bb-9a79-4542f6c4e45c)

O gráfico de colunas acima compara a média de minutos dormindo por dia da semana. Ele mostra que os usuários atingem ou ultrapassam essa média, que é de 419.2, destacada pela linha horizontal, em três dias: segunda, quarta e domingo. Por outro lado, na terça, na quinta, na sexta e no sabado, os usuários dormem menos minutos do que a média.

-----------------
## Média de Tempo na Cama por Dia da Semana 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/d9c35eeb-f26d-4d32-b3dd-b9cc8a6c25b8)

O gráfico de colunas acima compara a média de tempo na cama por dia da semana. Ele mostra que os usuários atingem ou ultrapassam essa média, que é de 458.5, destacada pela linha horizontal, em três dias: quarta, sábado e domingo. Por outro lado, na segunda, na terça, na quinta e na sexta, os usuários passam menos tempo na cama do que a média.

--------------
##  Minutos Muito Ativos vs Calorias
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/7b8df843-834c-497c-baa3-11ebf7bdf661)

O gráfico de dispersão acima mostra que existe uma correlação linear positiva moderada de 0.62 entre Minutos Muito Ativos e Calorias. Isso significa que o total de minutos gastos em atividade de intensidade muito ativa corresponde a mais calorias queimadas. A linha vertical tracejada destaca a média de minutos muito ativos, que é de 21.16, enquanto a horizontal destaca a média de calorias, que é de 2.304.
---------------
## Minutos Razoavelmente Ativos vs Calorias
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/ba8bb8b1-1c64-4150-801f-b88a5e0f0d48)

O gráfico de dispersão acima mostra que existe uma correlação linear positiva fraca de 0.30 entre Minutos Razoavelmente Ativos e Calorias. Isso significa que o total de minutos gastos em atividade de intensidade moderada corresponde a mais calorias queimadas. A linha vertical tracejada destaca a média de minutos razoavelmente ativos, que é de 13.56, enquanto a horizontal destaca a média de calorias, que é de 2.304.

-----
##  Minutos Levemente Ativos vs Calorias 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/34e7c007-4a82-4d6d-b361-6cc77db72bd4)

O gráfico de dispersão acima mostra que existe uma correlação linear positiva fraca de 0.29 entre Minutos Levemente Ativos e Calorias. Isso significa que o total de minutos gastos em atividade de intensidade leve corresponde a mais calorias queimadas. A linha vertical tracejada destaca a média de minutos levemente ativos, que é de 192.8, enquanto a horizontal destaca a média de calorias, que é de 2.304.
-----------------
##  Minutos Sedentários vs Calorias 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/fd045650-21b7-4cfd-8b40-0d0d3916b047)

O gráfico de dispersão acima mostra que existe uma correlação linear negativa bem fraca de -0.11 entre Minutos Sedentários e Calorias. Isso significa que o total de minutos gastos em atividade de intensidade sedentária corresponde a menos calorias queimadas. A linha vertical tracejada destaca a média de minutos sedentários, que é de 991.2, enquanto a horizontal destaca a média de calorias, que é de 2.304.

-----------------
 ## Média de Calorias por Hora do Dia 
 ![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/27376494-10d2-4ac7-bdb0-d4bac32cd6fa)


O gráfico de colunas acima compara a média de calorias queimadas por hora do dia. É possível identificar que há dois picos evidentes: o primeiro ocorre entre as 12h00 e 14h00, seguido de uma queda às 15h00; o segundo é entre as 17h00 e 19h00, sendo às 18h00 o ponto máximo. O menor nível de calorias queimadas é registrado entre as 23h00 e 04h00, com um aumento gradual entre as 05h00 e 10h00.

-----------------
## Média de Intensidade por Hora do Dia 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/5116be73-0133-4bbb-b4b1-972a5d12d37f)

O gráfico de colunas acima compara a média de intensidade por hora do dia. É possível identificar que há dois picos evidentes: o primeiro ocorre entre as 12h00 e 14h00, seguido de uma queda às 15h00; o segundo é entre as 17h00 e 19h00, sendo às 18h00 o ponto máximo. O menor nível de intensidade é registrado entre as 23h00 e 04h00, com um aumento gradual entre as 05h00 e 10h00.

----------------
## Média de Passos por Hora do Dia 
![image](https://github.com/AurelianoGon/analise_dados_rastreador/assets/106711467/8e124ba9-7ab1-4a12-88b5-6cd312762609)

O gráfico de colunas acima compara a média de passos por hora do dia. É possível identificar que há dois picos evidentes: o primeiro ocorre entre as 12h00 e 14h00, seguido de uma queda às 15h00; o segundo é entre as 17h00 e 19h00, sendo às 18h00 o ponto máximo. O menor número de passos é registrado entre as 23h00 e 04h00, com um aumento gradual entre as 05h00 e 10h00.

-----
## Agir
Na última fase, os insights são aplicados e recomendações às partes interessadas são feitas; problemas são resolvidos com soluções criativas e eficientes; decisões baseadas nos dados são tomadas e algo novo e inovador é criado.









