data_aosi <- read.csv("cross-sec_aosi.csv", stringsAsFactors = FALSE, na.strings = ".")

# Table par sexe
table(data_aosi$Gender)

# Table par Site d'étude
table(data_aosi$Study_Site)

sort(table(data_aosi$Study_Site))

sort(table(data_aosi$Study_Site), decreasing = TRUE)

# table à deux voix pour sexe et site d'étude (two-way table)
table(data_aosi$Gender, data_aosi$Study_Site)

table(data_aosi$Gender, data_aosi$Study_Site, useNA = "ifany")

table(data_aosi$Gender, data_aosi$Study_Site, useNA = "always")

# Sauvons l'une de ces tables pour une utilisation ultérieure dans des exemples
table_exp <- table(data_aosi$Gender, data_aosi$Study_Site)


dimnames(table_exp)

names(dimnames(table_exp))

# changeons les noms

names(dimnames(table_exp)) <- c("Gender", "Site")
names(dimnames(table_exp))

table_exp

# Tableau croisé (2-way table) de pourcentage
prop_table_exp <- prop.table(table_exp)
prop_table_exp

summary(data_aosi$Gender)

library(questionr)

freq(data_aosi$Study_Site)

freq(data_aosi$Study_Site, cum=TRUE, total=TRUE, sor="inc", digits=2, exclude = NA)

data(fecondite)
questionr::describe(femmes$region)

freq(femmes$region)

freq(femmes$region, levels = "labels")

library(stats)

table_exp_xtabs <- xtabs(~Gender+Study_Site, data = data_aosi)
table_exp_xtabs

prop_table_exp_xtabs <- round(prop.table(table_exp_xtabs), digits = 2)
prop_table_exp_xtabs

prop_table_exp <- round(prop_table_exp, 2)
prop_table_exp

table_exp <- addmargins(table_exp)
table_exp_xtabs <- addmargins(table_exp_xtabs)
prop_table_exp <- addmargins(prop_table_exp)
prop_table_exp_xtabs <- addmargins(prop_table_exp_xtabs)

table_exp

table_exp_xtabs

prop_table_exp

prop_table_exp_xtabs

dimnames(prop_table_exp_xtabs)

data(fecondite)
questionr::describe(femmes$region)

xtabs(data = femmes, formula = ~educ+region)

ltabs(~educ+region, femmes)

tab <- table(data_aosi$Gender, data_aosi$Study_Site)
lprop(tab)

tab <- xtabs(~Gender+Study_Site, data_aosi)
lprop(tab)

cprop(tab)

prop(tab)

table_exp_xtabs

prop_table_exp_xtabs

# Construire un trableau de la même dimension que 'table_exp_xtabs'
expected_table <- table_exp_xtabs

# Peupler le tableau
sex_sums <- expected_table[,5]
site_sums <- expected_table[3,]
expected_table[1,1] <- 149*(235/587)
expected_table[2,1] <- 149*(352/587)

expected_table[1,2] <- 152*(235/587)
expected_table[2,2] <- 152*(352/587)

expected_table[1,3] <- 145*(235/587)
expected_table[2,3] <- 145*(352/587)

expected_table[1,4] <- 141*(235/587)
expected_table[2,4] <- 141*(352/587)

# Arrondissment
expected_table <- round(expected_table,2)

expected_table

# On élimine la ligne et colonne qui reporésentent la somme
# (Expected - Observed) :
expected_table[-3,-5]-table_exp_xtabs[-3,-5]

table_exp_xtabs <- xtabs(~Gender+Study_Site, data = data_aosi)
summary(table_exp_xtabs)

?fisher.test

fisher.test(table_exp_xtabs)


