
# Estudo de caso: Análise de dados 
# Nesta fase, os dados serão transformados com ferramentas e funções; a integri-
# dade dos dados será mantida; os dados serão testados com métodos e critérios;
# os dados que estão errados ou incompletos são limpos e os resultados serão 
# verificados.

# Pacotes
library(tidyverse)
library(lubridate)
library(ggplot2)
library(ggrepel)
library(readr)
library(dplyr)
library(tidyr)
library(here)
library(skimr)
library(janitor)
library(corrplot)

# Baixar os datasets
atividade_diaria <- read_csv("dailyActivity_merged.csv")

sono_diario <- read.csv("sleepDay_merged.csv")

calorias_hora <- read.csv("hourlyCalories_merged.csv")

intensidade_hora <- read.csv("hourlyIntensities_merged.csv")

passos_hora <- read.csv("hourlySteps_merged.csv")

# ---------------------EXPLORAR A ESTRUTURA DOS DADOS -------------------------
# Atividade_diaria
head(atividade_diaria)
str(atividade_diaria)
colnames(atividade_diaria)

# Sono_diario
head(sono_diario)
str(sono_diario)
colnames(sono_diario)

# Calorias_hora
head(calorias_hora)
str(calorias_hora)
colnames(calorias_hora)

# Intensidades_hora
head(intensidade_hora)
str(intensidade_hora)
colnames(intensidade_hora)

# Passos_hora
head(passos_hora)
str(passos_hora)
colnames(passos_hora)

# ---------------------PADRONIZAR OS NOMES DAS COLUNAS -----------------------
# Colocar todas as letras em minúsculas (CLEAN_NAMES)
atividade_diaria <- atividade_diaria %>%
  clean_names()
colnames(atividade_diaria)

# sono 
sono_diario <- sono_diario %>%
  clean_names()
colnames(sono_diario)

# calorias
calorias_hora <- calorias_hora %>%
  clean_names()
colnames(calorias_hora)

# intensidade
intensidade_hora <- intensidade_hora %>% 
  clean_names()
colnames(intensidade_hora)

# passos
passos_hora <- passos_hora %>%
  clean_names()
colnames(passos_hora)

# -------------------- RENOMEANDO NOMES DAS COLUNAS -------------------------
# Renomear os nomes das colunas (RENAME)

atividade_diaria <- atividade_diaria %>%
  rename(data = activity_date,
         passos_totais = total_steps,
         distancia_total = total_distance,
         distancia_rastreador = tracker_distance,
         distancia_atividades_registradas = logged_activities_distance,
         distancia_muito_ativa = very_active_distance,
         distancia_moderadamente_ativa = moderately_active_distance,
         distancia_ativa_leve = light_active_distance,
         distancia_ativa_sedentaria = sedentary_active_distance,
         minutos_muito_ativos = very_active_minutes,
         minutos_razoavelmente_ativos = fairly_active_minutes,
         minutos_levemente_ativos = lightly_active_minutes,
         minutos_sedentarios = sedentary_minutes,
         calorias = calories)

colnames(atividade_diaria)

# Dataset SONO_DIARIO  RENOMEAR
sono_diario <- sono_diario %>%
  rename(data = sleep_day,
         registros_totais_sono = total_sleep_records,
         total_minutos_dormindo = total_minutes_asleep,
         tempo_total_cama = total_time_in_bed)
colnames(sono_diario)

# Dataset Calorias_horas / RENOMEAR
calorias_hora <- calorias_hora %>%
  rename (data_hora = activity_hour,
         calorias = calories)
colnames(calorias_hora)

# Dataset Intensidade_horas /RENOMEAR
intensidade_hora <- intensidade_hora %>%
  rename(data_hora = activity_hour,
         intensidade_total = total_intensity,
         intensidade_media = average_intensity)
colnames(intensidade_hora)

# Dataset Passos_hora / RENOMEAR COLUNAS
passos_hora <- passos_hora %>%
  rename(data_hora = activity_hour,
         passos_total = step_total)
colnames(passos_hora)

# --------------------- CONVERTER FORMATO DE DATA -----------------------------

# Dataset Atividade_hora / MODIFICAR DATA
atividade_diaria <- atividade_diaria %>%
  mutate(data = mdy(data))
head(atividade_diaria)

# Dataset Sono_diario / MODIFICAR DATA
sono_diario <- sono_diario %>%
  mutate(data = mdy_hms(data))
head(sono_diario)

# Dataset Calorias_hora / MODIFICAR DATA
calorias_hora <- calorias_hora %>%
  mutate(data = mdy_hms(data_hora))
head(calorias_hora)

# Dataset Intensidade_hora / MODIFICAR DATA
intensidade_hora <- intensidade_hora %>%
  mutate(data_hora = mdy_hms(data_hora))
head(intensidade_hora)

# Dataset Passos_hora / MODIFICAR DATA
passos_hora <- passos_hora %>%
  mutate(data_hora = mdy_hms(data_hora))
head(passos_hora)

# ------------------- CRIAR UMA COLUNA DE DIAS DA SEMANA -----------------------

# criar coluna dias da semana / MUTATE - WEEKDAYS
atividade_diaria <- atividade_diaria %>%
  mutate(dias_da_semana = weekdays(data))
head(atividade_diaria)

# criar coluna dias da semana / MUTATE - WEEKDAYS
sono_diario <- sono_diario %>%
  mutate(dias_da_semana = weekdays(data))
head(sono_diario)

calorias_hora

# ------------------------- SEPARAR A COLUNA DE DATA E HORAS ------------------

# Dataset Calorias_hora / SEPARATE - INTO - SEP " "
calorias_hora <- calorias_hora %>%
  separate(data, into = c("data", "hora"), sep = " ")

head(calorias_hora)

# Dataset Intensidade / SEPARATE - INTO - SEP
intensidade_hora <- intensidade_hora %>%
  separate(data_hora, into = c("data", "hora"), sep = " ")
head(intensidade_hora)

# Dataset Passos / SEPARATE - INTO - SEP
passos_hora <- passos_hora %>%
  separate(data_hora, into = c("data", "hora"), sep = " ")
head(passos_hora)

# -------------------------  CRIAR UMA COLUNA -----------------------------

# Criar uma coluna com o Total de Minutos Ativos
atividade_diaria <- atividade_diaria %>%
  mutate(total_minutos_ativos = minutos_muito_ativos + minutos_razoavelmente_ativos +
           minutos_levemente_ativos)

# ----------------------- MESCLAR UM CONJUNTO DE DADOS -----------------------

# Mesclar um conjunto de dados com       MERGE/ BY = C
dados_mesclados <- merge(sono_diario, atividade_diaria, by = c("id", "data", "dias_da_semana"))

head(dados_mesclados)
str(dados_mesclados)
colnames(dados_mesclados)

# -----------------CONTAR O NÚMERO DE VALORES DUPLICADOS E NA ------------------

sum(duplicated(atividade_diaria))  # SUM / DUPLICARTED
sum(is.na(atividade_diaria))       # SUM / IS. NA

sum(duplicated(sono_diario))
sum(is.na(sono_diario))

sum(duplicated(calorias_hora))
sum(is.na(calorias_hora))

sum(duplicated(intensidade_hora))
sum(is.na(intensidade_hora))

sum(duplicated(passos_hora))
sum(is.na(passos_hora))

sum(duplicated(dados_mesclados))
sum(is.na(dados_mesclados))

# -------------------- EXCLUIR VALORES DUPLICADOS E N.A ------------------------

atividade_diaria <- atividade_diaria %>%
  distinct() %>%  # Filtra linhas duplicadas e retorna linhas únicas
  drop_na() # exclui valores ausentes

sono_diario <- sono_diario %>%
  distinct() %>%
  drop_na()

calorias_hora <- calorias_hora %>%
  distinct() %>%
  drop_na()

intensidade_hora <-  intensidade_hora %>%
  distinct() %>%
  drop_na()

passos_hora <- passos_hora %>% 
  distinct() %>% 
  drop_na()

dados_mesclados <- dados_mesclados %>% 
  distinct() %>% 
  drop_na()


# --------------------------- ANALISAR --------------------------------------
# Nesta fase ferramentas são usadas para formatar e transformar os dados para análise.
# Os dados são classificados e filtrados para selecionar as informações mais relevantes

# PADRÕES E TENDÊNCIAS NOS DADOS são identificados e conclusões são tiradas.

# PREVISÕES E RECOMENDAÇÕES SÃO FEITAS.

# DECISÕES BASEADAS DOS DADOS E NAS EVIDENCIAS SÃO TOMADAS

# ---------------------------- CONTAR O NÚMERO DE VALORES ÚNICOS --------------

n_distinct(atividade_diaria$id)
min(atividade_diaria$data)
max(atividade_diaria$data)

n_distinct(sono_diario$id)
min(sono_diario$data)
max(sono_diario$data)

n_distinct(calorias_hora$id )
min(calorias_hora$data)
max(calorias_hora$data)

n_distinct(intensidade_hora$id)
min (intensidade_hora$data)
max(intensidade_hora$data)

n_distinct(passos_hora$id )
min(passos_hora$data)
max(passos_hora$data)

n_distinct(dados_mesclados$id)
max(dados_mesclados$data)
min(dados_mesclados$data)

# ------------------ CONTAR O NÚMERO DE COLUNAS E LINHAS -----------------------
nrow(atividade_diaria)
ncol(atividade_diaria)

nrow(sono_diario)
ncol(sono_diario)

nrow(calorias_hora)
ncol(calorias_hora)

nrow(intensidade_hora)
ncol(intensidade_hora)

nrow(dados_mesclados)
ncol(dados_mesclados)

nrow(passos_hora)
ncol(passos_hora)

# -------------------- RESUMIR OS VALORES DAS COLUNAS --------------------------
# Análise Estatística

 # Summary de algumas colunas / SELECT/ SUMMARY
atividade_diaria %>% 
  select(passos_totais,
         distancia_total,
         distancia_atividades_registradas,
         distancia_muito_ativa,
         distancia_moderadamente_ativa,
         distancia_ativa_leve,
         distancia_ativa_sedentaria,
         minutos_muito_ativos,
         minutos_razoavelmente_ativos,
         minutos_levemente_ativos,
         minutos_sedentarios,
         calorias) %>% 
  summary()

sono_diario %>% 
  select(total_minutos_dormindo, tempo_total_cama) %>% 
  summary()

calorias_hora %>% 
  select(calorias) %>% 
  summary()

intensidade_hora %>% 
  select(intensidade_total) %>%
  summary()

passos_hora %>% 
  select(passos_total) %>% 
  summary()

# -------------------- Principais descobertas ---------------------------

# COMPARTILHAR

# Distribuiçaõ de Calorias / OPTIONS configura opções globais

options (repr.plot.width = 10, repr.plot.height = 9)

#    ATIVIDADE_DIARIA
atividade_diaria %>%
  ggplot(aes(x = calorias)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 349,color = "#000000", fill = "#FFFFFF") +
  geom_density(color = "#000000", fill = "#007BA7", alpha = 0.4) +
  geom_vline(xintercept = 2304, linetype = "longdash", color = "#FF0000") +
  geom_label(aes(x = 2304, y = 0.00075, label = "Média = 2.304"), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Distribuição de  Calorias",  x = "Calorias")


atividade_diaria %>%
  ggplot(aes(x = passos_totais)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 2500, color = "#000000", fill = "#FFFFFF") +
  geom_density(color = "#000000", fill = "#007BA7", alpha = 0.4) +
  geom_vline(xintercept = 7638, linetype = "longdash", color = "#FF0000") +
  geom_label(aes(x = 7638, y = 0.00008, label = "Média = 7.638"), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Distribuição de Passos Totais", x = "Passos Totais")


atividade_diaria %>%
  ggplot(aes(x = distancia_total)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 2, color = "#000000", fill = "#FFFFFF") +
  geom_density(color = "#000000", fill = "#007BA7", alpha = 0.4) +
  geom_vline(xintercept = 5.490, linetype = "longdash", color = "#FF0000") +
  geom_label(aes(x = 5.490, y = 0.105, label = "Média = 5.490"), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Distribuição de Distância Total", x = "Distância Total")

atividade_diaria %>%
  ggplot(aes(x = minutos_muito_ativos)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 13.5, color = "#000000", fill = "#FFFFFF") +
  geom_density(color = "#000000", fill = "#007BA7", alpha = 0.4) +
  geom_vline(xintercept = 21.16, linetype = "longdash", color = "#FF0000") +
  geom_label(aes(x = 21.16, y = 0.035, label = "Média = 21.16"), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Distribuição de Minutos Muito Ativos", x = "Minutos Muito Ativos")

atividade_diaria %>%
  ggplot(aes(x = minutos_razoavelmente_ativos)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 8, color = "#000000", fill = "#FFFFFF") +
  geom_density(color = "#000000", fill = "#007BA7", alpha = 0.4) +
  geom_vline(xintercept = 13.56, linetype = "longdash", color = "#FF0000") +
  geom_label(aes(x = 13.56, y = 0.05, label = "Média = 13.56"), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Distribuição de Minutos Razoavelmente Ativos", x = "Minutos Razoavelmente Ativos")


atividade_diaria %>%
  ggplot(aes(x = minutos_levemente_ativos)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 30, color = "#000000", fill = "#FFFFFF") +
  geom_density(color = "#000000", fill = "#007BA7", alpha = 0.4) +
  geom_vline(xintercept = 192.8, , linetype = "longdash", color = "#FF0000") +
  geom_label(aes(x = 192.8, y = 0.004, label = "Média = 192.8"), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Distribuição de Minutos Levemente Ativos", x = "Minutos Levemente Ativos")

atividade_diaria %>%
  ggplot(aes(x = minutos_sedentarios)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 95, color = "#000000", fill = "#FFFFFF") +
  geom_density(color = "#000000", fill = "#007BA7", alpha = 0.4) +
  geom_vline(xintercept = 991.2, , linetype = "longdash", color = "#FF0000") +
  geom_label(aes(x = 991.2, y = 0.0015, label = "Média = 991.2"), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Distribuição de Minutos Sedentários", x = "Minutos Sedentários")

# SONO_DIÁRIO
sono_diario %>%
  ggplot(aes(x = total_minutos_dormindo)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 50, color = "#000000", fill = "#FFFFFF") +
  geom_density(color = "#000000", fill = "#007BA7", alpha = 0.4) +
  geom_vline(xintercept = 419.2, linetype = "longdash", color = "#FF0000") +
  geom_label(aes(x = 419.2, y = 0.004, label = "Média = 419.2"), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Distribuição de Total de Minutos Dormindo", x = "Total de Minutos Dormindo")

sono_diario %>%
  ggplot(aes(x = tempo_total_cama)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 60, color = "#000000", fill = "#FFFFFF") +
  geom_density(color = "#000000", fill = "#007BA7", alpha = 0.4) +
  geom_vline(xintercept = 458.5,, linetype = "longdash", color = "#FF0000") +
  geom_label(aes(x = 458.5, y = 0.004, label = "Média = 458.5"), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Distribuição de Tempo Total na Cama", x = "Tempo Total na Cama")

# Proporção de Minutos por Intensidades 

# CRIAR UM NOVO DATASET
intensidades <- c("Razoavelmente Ativos", "Muito Ativos", "Levemente Ativos", "Sedentários")
minutos <- c(13.56, 21.16, 192.8, 991.2)
porcentagem <- round(minutos * 100 / sum(minutos), 1)
minutos_medios <- data.frame(intensidades, minutos, porcentagem)

minutos_medios %>%
  ggplot(aes(x = "", y = minutos, fill = intensidades)) +
  geom_col(width = 1, alpha = 0.8) +
  coord_polar(theta = "y") +
  scale_fill_manual(values = c("#BFDEE9", "#80BDD3", "#409CBD", "#007BA7")) +
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  geom_label_repel(aes(label = paste0(porcentagem, "%")), position = position_stack(vjust = 0.5), show.legend = FALSE) +
  labs(title = "Proporção de Minutos por Intensidades")

#  Comparação entre Minutos Dormindo e Tempo na Cama 
repouso <- c("Minutos Dormindo", "Tempo na Cama")
minutos <- c(419.2, 458.5)
sono_medio <- data.frame(repouso, minutos)

sono_medio %>%
  ggplot(aes(x = repouso, y = minutos)) +
  geom_col(color = "#000000", fill = "#007BA7", alpha = 0.5, width = 0.5) +
  geom_hline(yintercept = 419.2, linetype = "longdash", color = "#FF0000") +
  geom_hline(yintercept = 458.5, linetype = "longdash", color = "#FF0000") +
  geom_label(aes(label = minutos)) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title="Comparação Entre Minutos Dormindo e Tempo na Cama", x="", y="Média de Minutos")

# Passos Totais vs Calorias 
correlacao <- cor(atividade_diaria$passos_totais, atividade_diaria$calorias)

atividade_diaria %>%
  ggplot(aes(x = passos_totais, y = calorias)) +
  geom_point(color = "#007BA7", alpha = 0.5, size = 3) +
  geom_vline(xintercept = 7638, linetype = "longdash", color = "#FF0000") +
  geom_hline(yintercept = 2304, linetype = "longdash", color = "#FF0000") +
  geom_smooth(method = lm, color = "#000000") +
  annotate("text", x = 25000, y = 0, label = paste("Coeficiente de correlação de Pearson =", round(correlacao, 2)), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Passos Totais vs Calorias", x = "Passos Totais", y = "Calorias")

#  ----------------------- CORRELAÇÃO ENTRE VARIÁVEIS ----------------------

#Passos Totais vs Distância Total 
correlacao <- cor(atividade_diaria$passos_totais, atividade_diaria$distancia_total)

atividade_diaria %>%
  ggplot(aes(x = passos_totais, y = distancia_total)) +
  geom_point(color = "#007BA7", alpha = 0.5, size = 3) +
  geom_vline(xintercept = 7638, linetype = "longdash", color = "#FF0000") +
  geom_hline(yintercept = 5.490, linetype = "longdash", color = "#FF0000") +
  geom_smooth(method = lm, color = "#000000") +
  annotate("text", x = 25000, y = 0, label = paste("Coeficiente de correlação de Pearson =", round(correlacao, 2)), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Passos Totais vs Distância Total", x = "Passos Totais", y = "Distância Total")

#  Minutos Sedentários vs Passos Totais 
correlacao <- cor(atividade_diaria$minutos_sedentarios, atividade_diaria$passos_totais)

atividade_diaria %>%
  ggplot(aes(x = minutos_sedentarios, y = passos_totais)) +
  geom_point(color = "#007BA7", alpha = 0.5, size = 3) +
  geom_vline(xintercept = 991.2, linetype = "longdash", color = "#FF0000") +
  geom_hline(yintercept = 7638, linetype = "longdash", color = "#FF0000") +
  geom_smooth(method = lm, color = "#000000") +
  annotate("text", x = 400, y = 35000, label = paste("Coeficiente de correlação de Pearson =", round(correlacao, 2)), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Minutos Sedentários vs Passos Totais", x = "Minutos Sedentários", y = "Passos Totais")

#  Minutos Muito Ativos vs Passos Totais ¶
correlacao <- cor(atividade_diaria$minutos_muito_ativos, atividade_diaria$passos_totais)

atividade_diaria %>%
  ggplot(aes(x = minutos_muito_ativos, y = passos_totais)) +
  geom_point(color = "#007BA7", alpha = 0.5, size = 3) +
  geom_vline(xintercept = 21.16, linetype = "longdash", color = "#FF0000") +
  geom_hline(yintercept = 7638, linetype = "longdash", color = "#FF0000") +
  geom_smooth(method = lm, color = "#000000") +
  annotate("text", x = 150, y = 0, label = paste("Coeficiente de correlação de Pearson =", round(correlacao, 2)), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Minutos Muito Ativos vs Passos Totais", x = "Minutos Muito Ativos", y = "Passos Totais")

# Total de Minutos Dormindo vs Tempo Total na Cama ¶
correlacao <- cor(sono_diario$total_minutos_dormindo, sono_diario$tempo_total_cama)

sono_diario %>%
  ggplot(aes(x = total_minutos_dormindo, y = tempo_total_cama)) +
  geom_point(color = "#007BA7", alpha = 0.5, size = 3) +
  geom_vline(xintercept = 419.2, linetype = "longdash", color = "#FF0000") +
  geom_hline(yintercept = 458.5, linetype = "longdash", color = "#FF0000") +
  geom_smooth(method = lm, color = "#000000") +
  annotate("text", x = 620, y = 0, label = paste("Coeficiente de correlação de Pearson =", round(correlacao, 2)), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Total de Minutos Dormindo vs Tempo Total na Cama", x = "Total de Minutos Dormindo", y = "Tempo Total na Cama")

# -----------------------Médias de calorias por dia da semana ------------------

atividade_diaria$dias_da_semana <- ordered(atividade_diaria$dias_da_semana,
        levels = c("Monday", "Tuesday", "Wednesday", "Thursday","Friday", "Saturday", "Sunday"))

atividade_diaria %>%
  group_by(dias_da_semana) %>%
  summarise(media_calorias = round(mean(calorias))) %>%
  
  ggplot(aes(x = dias_da_semana, y = media_calorias)) +
  geom_col(color = "#000000", fill = "#007BA7", alpha = 0.5) +
  geom_hline(yintercept = 2304, color = "#FF0000") +
  geom_label(aes(label = media_calorias)) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Média de Calorias por Dia da Semana", x = "Dias da Semana", y = "Média de Calorias")


# Média de Passos por Dia da Semana 
atividade_diaria %>%
  group_by(dias_da_semana) %>%
  summarise(media_passos = round(mean(passos_totais))) %>%
 
   ggplot(aes(x = dias_da_semana, y = media_passos)) +
  geom_col(color = "#000000", fill = "#007BA7", alpha = 0.5) +
  geom_hline(yintercept = 7638, color = "#FF0000") +
  geom_label(aes(label = media_passos)) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Média de Passos por Dia da Semana", x = "Dias da Semana",
       y = "Média de Passos Totais")

 #Média de Distância por Dia da Semana 
atividade_diaria %>%
  group_by(dias_da_semana) %>%
  summarise(distancia_media = round(mean(distancia_total), 3)) %>%
  
  ggplot(aes(x = dias_da_semana, y = distancia_media)) +
  geom_col(color = "#000000", fill = "#007BA7", alpha = 0.5) +
  geom_hline(yintercept = 5.490, color = "#FF0000") +
  geom_label(aes(label = distancia_media)) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Média de Distância por Dia da Semana", x = "Dias da Semana", 
       y = "Média de Distância Total")

sono_diario$dias_da_semana <- ordered(sono_diario$dias_da_semana, levels = c("Monday", "Tuesday", "Wednesday", "Thursday","Friday", "Saturday", "Sunday"))

sono_diario %>%
  group_by(dias_da_semana) %>%
  summarise(media_minutos_dormindo = round(mean(total_minutos_dormindo), 1)) %>%
  
  ggplot(aes(x = dias_da_semana, y = media_minutos_dormindo)) +
  geom_col(color = "#000000", fill = "#007BA7", alpha = 0.5) +
  geom_hline(yintercept = 419.2, color = "#FF0000") +
  geom_label(aes(label = media_minutos_dormindo)) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Média de Minutos Dormindo por Dia da Semana",
       x = "Dias da Semana", y = "Média de Minutos Totais Dormindo")

#  Média de Tempo na Cama por Dia da Semana 
sono_diario %>%
  group_by(dias_da_semana) %>%
  summarise(media_tempo_cama = round(mean(tempo_total_cama), 1)) %>%
  
  ggplot(aes(x = dias_da_semana, y = media_tempo_cama)) +
  geom_col(color = "#000000", fill = "#007BA7", alpha = 0.5) +
  geom_hline(yintercept = 458.5, color = "#FF0000") +
  geom_label(aes(label = media_tempo_cama)) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Média de Tempo na Cama por Dia da Semana", x = "Dias da Semana", y = "Média de Tempo na Cama")


# ------------------ CORRELAÇÃO ---------------------------------
correlacao_2 <- cor(atividade_diaria$minutos_muito_ativos, atividade_diaria$calorias)

atividade_diaria %>% 
  ggplot(aes(x = minutos_muito_ativos, y = calorias)) +
  geom_point(color = "#007BA7", alpha = 0.5, size = 3) +
  geom_vline(xintercept = 21.16, linetype = "longdash", color = "#FF0000") +
  geom_hline(yintercept = 2304, linetype = "longdash", color = "#FF0000") +
  geom_smooth(method = lm, color = "#000000") +
  annotate("text", x = 150, y = 0, label = paste("Coeficiente de correlação de Pearson:", round(correlacao, 2)), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Minutos Muito Ativos vs Calorias", x = "Minutos Muito Ativos", y = "Calorias")  

# Correlação 
correlacao_3 <- cor(atividade_diaria$minutos_razoavelmente_ativos, atividade_diaria$calorias)

atividade_diaria %>% 
  ggplot(aes(x = minutos_razoavelmente_ativos, y = calorias)) +
  geom_point(color = "#007BA7", alpha = 0.5, size = 3) +
  geom_vline(xintercept = 13.56, linetype = "longdash", color = "#FF0000") +
  geom_hline(yintercept = 2304, linetype = "longdash", color = "#FF0000") +
  geom_smooth(method = lm, color = "#000000") +
  annotate("text", x = 100, y = 0, label = paste("Coeficiente de correlação de Pearson = ", round(correlacao, 2)), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Minutos Razoavelmente Ativos vs Calorias", x = "Razoavelmente Ativos", y = "Calorias")

#  Minutos Sedentários vs Calorias 
correlacao <- cor(atividade_diaria$minutos_sedentarios, atividade_diaria$calorias)

atividade_diaria %>%
  ggplot(aes(x = minutos_sedentarios, y = calorias)) +
  geom_point(color = "#007BA7", alpha = 0.5, size = 3) +
  geom_vline(xintercept = 991.2, linetype = "longdash", color = "#FF0000") +
  geom_hline(yintercept = 2304, linetype = "longdash", color = "#FF0000") +
  geom_smooth(method = lm, color = "#000000") +
  annotate("text", x = 350, y = 5000, label = paste("Coeficiente de correlação de Pearson =", round(correlacao, 2)), size = 5) +
  theme(plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Minutos Sedentários vs Calorias", x = "Minutos Sedentarios", y = "Calorias")


# Média de Calorias por Hora do Dia 
calorias_hora %>%
  group_by(hora) %>%
  summarise(media_calorias = round(mean(calorias), 2)) %>%
  ggplot(aes(x = hora, y = media_calorias)) +
  geom_col(color = "#000000", fill = "#007BA7", alpha = 0.5, width = 0.6) +
  geom_label(aes(label = media_calorias)) +
  theme(axis.text.x = element_text(angle = 90), plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Média de Calorias por Hora do Dia", x = "Horas do Dia", y = "Média de Calorias") 


#  Média de Intensidade por Hora do Dia 
intensidades_hora %>%
  group_by(hora) %>%
  summarise(media_intensidade = round(mean(intensidade_total), 2)) %>%
  ggplot(aes(x = hora, y = media_intensidade)) +
  geom_col(color = "#000000", fill = "#007BA7", alpha = 0.5, width = 0.6) +
  geom_label(aes(label = media_intensidade)) +
  theme(axis.text.x = element_text(angle = 90), plot.title = element_text(hjust = 0.5), text = element_text(size = 15)) +
  labs(title = "Média de Intensidade por Hora do Dia", x = "Horas do Dia", y = "Média de Intensidade")

# Média de Passos por Hora do Dia
passos_hora %>%
  group_by(hora) %>%
  summarise(media_passos = round(mean(passo_total), 1)) %>%
  ggplot(aes(x = hora, y = media_passos)) +
  geom_col(color = "#000000", fill = "#007BA7", alpha = 0.5, width = 0.6) +
  geom_label(aes(label = media_passos)) +
  labs(title = "Média de Passos por Hora do Dia", x = "Horas do Dia", y = "Média de Passos") +
  theme(axis.text.x = element_text(angle = 90), 
        plot.title = element_text(hjust = 0.5), text = element_text(size = 15))
