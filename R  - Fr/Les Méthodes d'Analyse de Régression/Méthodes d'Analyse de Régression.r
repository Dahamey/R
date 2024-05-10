library(ggplot2)
library(tidyverse)

data_complete <- read.csv("Cross-sec_full.csv", stringsAsFactors = FALSE, na.strings = c(" ", "","."))
head(data_complete)

colnames(data_complete)

ggplot(data = data_complete, aes(x= V12.mullen.composite_standard_score, y=V12.aosi.total_score_1_18))+
    geom_point()+
    labs(x="Score Standard de composite Mullen",
         y= "Score Totale d'AOSI",
         title = "Nuage de Points du Score Standard de composite Mullen \net Le Score Totale d'AOSI à 12 mois")

cor(x = data_complete$V12.mullen.composite_standard_score, y = data_complete$V12.aosi.total_score_1_18)

cor(x = data_complete$V12.mullen.composite_standard_score, y = data_complete$V12.aosi.total_score_1_18,
   use = "pairwise.complete")

# effectuons un test d'hypothèse
resultats <- cor.test(x = data_complete$V12.mullen.composite_standard_score, y = data_complete$V12.aosi.total_score_1_18)
resultats

# simuler les données
set.seed(25101989)
E <- rnorm(500)
X <- rnorm(500, mean=5)
Y1 <- 2*X+E
Y2 <- 6*X+E

# nous utiliserons les fonctions de tracé par défaut de R (plot)
plot(X, Y1, main="Exemple de Nuage de Points: Dataset 1 en Noir, Dataset 2 en Bleu", xlim = c(0, 8), ylim=c(0, 50), ylab="Y")
points(X, Y2, col="blue")
text(x=7, y=9,labels=paste("Cor=",round(cor(X, Y1),2),sep=""))
text(x=7, y=35,labels=paste("Cor=",round(cor(X, Y2),2),sep=""), col="blue")

cor(X, Y1)

cor(X, Y2)

# Adapter le modèle aux données pour obtenir des estimations
lm(V12.aosi.total_score_1_18~V12.mullen.composite_standard_score
   +V12.mullen.Candidate_Age, data= data_complete)

# Adapter le modèle aux donnéeset sauvegarder les résultats en tant qu'objets
aosi_exp1_fit <- lm(V12.aosi.total_score_1_18~V12.mullen.composite_standard_score
   +V12.mullen.Candidate_Age, data=data_complete)

summary(aosi_exp1_fit)

