#install.packages("dplyr")

library(dplyr)

# lire un dataframe 
data <- read.csv(file = "AOSI_small.csv", na.strings = c(".", " "))

# voir toute la dataset
data

# les colonnes
names(data)

# selectionner ID et Group uniquemet
select(.data = data, Identifiers, GROUP)

# enlever 'gender' et 'Study_Site'
select(data, -Gender, -Study_Site)

# Ne sélectionner que les observations avec un diagnostic de ASD
filter(data, GROUP == "HR_ASD")

# Ne sélectionner que les observations avec un diagnostic de ASD et un score total d'au moins 10 à la visite du mois 6
filter(data, (GROUP == "HR_ASD") & (V06.aosi.total_score_1_18>=10))

# Ne sélectionner que les observations féminines
filter(data, Gender == "Female") # L'ensemble de données retourné est vide, nous n'avons que des sujets masculins

# age croissant
arrange(.data = data, GROUP, V12.aosi.Candidate_Age)

# age décroissant
arrange(data, GROUP, desc(V12.aosi.Candidate_Age))

# groupe décroissant, notez que R utilise l'ordre alphabétique lorsque des variables de caractères sont utilisées
arrange(data, desc(GROUP))

# Créer un ensemble de données uniquement pour les enfants HR
data_HR <- read.csv('Cross-sec_full.csv', na.strings = c(".", " "))
data_HR <- filter(data_HR, V24.demographics.Risk == "HR")


names(data_HR)

unique(data_HR$Study_Site)

# Créer des variables en utilisant mutate()
data_HR <- mutate(data_HR, 
                 Mullen_mean = (data_HR$"V36.mullen.composite_standard_score"+data_HR$"V24.mullen.composite_standard_score"+data_HR$"V06.mullen.composite_standard_score"+data_HR$"V12.mullen.composite_standard_score")/4,
                 Site_location = factor(ifelse(data_HR$Study_Site == "PHI" | data_HR$Study_Site == "UNC", "East_Coast",
                                              ifelse(data_HR$Study_Site == "STL", "Midwest", "West_Coast"))))

head(data_HR)

table(data_HR$Study_Site, data_HR$Site_location)

data_aosi <- read.csv("cross-sec_aosi.csv", na.strings = c(".", " "))
head(data_aosi)

names(data_aosi)

summarise(data_aosi,
          sample_size = n(),
          mean_aosi_ts_v6 = mean(V06.aosi.total_score_1_18),
         mean_aosi_ts_v12 = mean(V12.aosi.total_score_1_18))

# Remarquons dans la fenêtre d'environnement, cet objet est marqué comme de type 'grouped_'
data_aosi_grouped <- group_by(data_aosi, Gender, GROUP)
summarize(data_aosi_grouped,
         sample_size = n(),
         mean_aosi_ts_V6=mean(V06.aosi.total_score_1_18),
         mean_aosi_ts_V12=mean(V12.aosi.total_score_1_18))

# 'groub_by' 'summarise' en ulisant pipe : control+shift+M '%>%'
data_aosi %>% 
        group_by(Gender, GROUP) %>% 
        summarise(ample_size = n(),
                 mean_aosi_ts_V6=mean(V06.aosi.total_score_1_18),
                 mean_aosi_ts_V12=mean(V12.aosi.total_score_1_18))

data

variables_to_convert <- names(data)[5:8]
variables_to_convert

data

# tidybverse
library(tidyr)

# Rassemblement
data %>% 
    gather(variable, var_value, variables_to_convert)

library(tidyr)
data %>% 
    # Rassemblement
    gather(variable, var_value, variables_to_convert) %>% 
    # Séparation de 'variable'
    separate(variable, c("Visit", "Variable"), sep = 3)

library(tidyr)

data %>%
    # Rassemblemnt
    gather(variable, var_value, variables_to_convert) %>% 
    # Séparation
    separate(variable, c("Visit", "Variable"), sep =3) %>% 
    # Etalement
    spread(key = Variable, value =  var_value)

rename_exp <- read.csv("cross-sec_aosi.csv", na.strings = c(".", " ")) %>% 
    rename(ID = Identifiers, Diagnosis_group = GROUP)

# print the first 10 rows
rename_exp[1:10,]

library(tidyr)

long_data <- data %>%
    # Rassemblemnt
    gather(variable, var_value, variables_to_convert) %>%
    # Séparation
    separate(variable,c("Visit","Variable"),sep = 3) %>% 
    # Etalement
    spread(key = Variable, value = var_value) %>%
    # Renomer les colonnes
    plyr::rename(c(".aosi.Candidate_Age" = "AOSI_Age",
                 ".aosi.total_score_1_18"="AOSI_Total_Score")) %>%
    # Créer une nouvelle colonne 'ASD_Diag'
    mutate(ASD_Diag = factor(ifelse(grepl("ASD", GROUP), "ASD_Neg", "ASD_Pos")),
         Visit = factor(Visit)) %>%
    # Ordonner selon les colonnes 'Identifiers' et 'Visit'
    arrange(Identifiers, Visit)

long_data

data_aosi %>% 
  group_by(Gender, GROUP) %>% 
  summarise(sample_size = n(), mean_aosi_ts_V6 = mean(V06.aosi.total_score_1_18), mean_aosi_ts_V12 = mean(V12.aosi.total_score_1_18))

read.csv("cross-sec_aosi.csv", na.strings = c(".", " ")) %>% 
  group_by(Gender, GROUP) %>% 
  summarise(sample_size = n(), mean_aosi_ts_V6 = mean(V06.aosi.total_score_1_18), mean_aosi_ts_V12 = mean(V12.aosi.total_score_1_18))

data_nouvelle <-
read.csv("cross-sec_aosi.csv", na.strings = c(".", " ")) %>% 
  group_by(Gender, GROUP) %>% 
  summarise(sample_size = n(), mean_aosi_ts_V6 = mean(V06.aosi.total_score_1_18), mean_aosi_ts_V12 = mean(V12.aosi.total_score_1_18)) 

data_nouvelle

library(forcats)

# changer les noms donnés aux classes de GROUP
fct_recode(data_aosi$GROUP, "HR_NoASD" ="HR_neg", "LR_NoASD"= "LR_neg")[1:10]

data_aosi_2 <- data_aosi %>% 
    mutate(GROUP = fct_recode(GROUP, "HR_NoASD" ="HR_neg", "LR_NoASD"= "LR_neg"))

data_aosi_2$GROUP[1:10]

fct_relevel(data_aosi_2$GROUP, "LR_NoASD", "LR_ASD", "HR_NoASD", "HR_ASD")[1:10]

data_aosi_3 <- data_aosi_2 %>% 
  mutate(GROUP = fct_relevel(GROUP, "LR_NoASD", "LR_ASD", "HR_NoASD", "HR_ASD"))

data_aosi_3$GROUP[1:10]


