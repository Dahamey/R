library(ggplot2)

data_aosi <- read.csv("cross-sec_aosi.csv", stringsAsFactors = FALSE, na.strings = ".")

ggplot(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18)) +
    geom_point()

ggplot()+
    geom_point(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18))

ggplot(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18), color = "blue")+
    geom_point()

# ne fonctionne pas, toujours noir. Pourquoi ?

ggplot()+
  geom_point(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18), color = "blue")

ggplot(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18, color = GROUP ))+
    geom_point()

ggplot()+
    geom_point(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18, color = GROUP))

# uniquement la taille 
ggplot(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18, size = GROUP))+
    geom_point()

# uniquement la forme
ggplot()+
    geom_point(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18, shape = GROUP))

# Taille et couleur
ggplot()+
    geom_point(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18, color = GROUP, size = Gender))

# couleur et format
ggplot()+
    geom_point(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18, shape = Gender,color = GROUP))

ggplot(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18))+
    geom_smooth(method = "lm")

# LOESS est la méthode par défaut et sera automatiquement utilisée si la méthode n'est pas spécifiée
ggplot(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18))+
    geom_smooth(method = "loess")


ggplot(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18))+
    geom_point()+
    geom_smooth(method = "lm")

ggplot(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18))+
  geom_point()+
  geom_smooth(method = "loess")

ggplot(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18))+
    geom_point(aes(color = Gender))+
    geom_smooth(method = "lm", aes(group = Gender))

ggplot(data = data_aosi, aes(x = V06.aosi.total_score_1_18, y = V12.aosi.total_score_1_18))+
    geom_point(aes(color = Gender))+
    geom_smooth(method = "lm", aes(group = Gender, color = Gender))

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18))+
    geom_boxplot()

ggplot(data = data_aosi, aes(y = GROUP,x = V12.aosi.total_score_1_18))+
    geom_boxplot()

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = GROUP))+
    geom_boxplot()

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, color = GROUP))+
    geom_boxplot()

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = Gender))+
    geom_boxplot()

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, group = Gender))+
    geom_boxplot()

ggplot(data = data_aosi, aes(x = Gender, y = V12.aosi.total_score_1_18, group = Gender))+
    geom_boxplot()

ggplot(data = data_aosi, aes(x = GROUP))+
    geom_bar()

ggplot(data = data_aosi, aes(x = GROUP))+
    geom_bar(aes(y = ..prop.., group = 1))

ggplot(data = data_aosi, aes(x = GROUP))+
    geom_bar(aes(y = ..prop.., group = GROUP))


