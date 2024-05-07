library(ggplot2)

data_aosi <- read.csv("cross-sec_aosi.csv", stringsAsFactors = FALSE, na.strings = ".")

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = Gender))+
    geom_boxplot()

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = Gender))+
    geom_boxplot()+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD et Genre", caption = "Créé par Youned Dahami")

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = Gender))+
    geom_boxplot()+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD et Genre", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, color=V12.aosi.total_score_1_18))+
    geom_point()+
    labs(title = "Score Total d'AOSI au mois 12 coloré par la même variable",subtitle="Par ASD", caption="Créé par Younes Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

# voir la documentation de scale_color_gradient()
ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, color=V12.aosi.total_score_1_18))+
    geom_point()+
    labs(title = "Score Total d'AOSI au mois 12 coloré par la même variable",subtitle="Par ASD", caption="Créé par Younes Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")+
    scale_color_gradient(low="blue", high="red")

# nuage de point couleur continue
ggplot(data =  data_aosi, aes(x=V06.aosi.total_score_1_18, y=V12.aosi.total_score_1_18, shape = GROUP))+
    geom_point(size=3)+
        labs(title = "Score Total d'AOSI au mois 12 coloré par la même variable",subtitle="Par ASD", caption="Créé par Younes Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = Gender))+
    geom_boxplot()+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD et Genre", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = Gender))+
    geom_boxplot()+
    theme_bw()+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD et Genre", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = Gender))+
    geom_boxplot()+
    theme_minimal()+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD et Genre (Minimal Theme)", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = Gender))+
    geom_boxplot()+
    theme_classic()+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD et Genre (classic theme)", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = Gender))+
    geom_boxplot()+
    theme_bw()+
    theme(legend.position = "bottom",
          legend.title = element_text(face = "bold", size = 20))+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD et Genre", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = Gender))+
    geom_boxplot()+
    theme_bw()+
    theme(legend.position = "bottom",
          legend.title = element_text(face = "bold", size = 20),
          legend.text = element_text(face="bold", size=20),
          legend.key.size = unit(15,"mm"))+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD et Genre", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = Gender))+
    geom_boxplot()+
    theme_bw()+
    theme(legend.position = "bottom",
          legend.title = element_text(face = "bold", size = 20),
          plot.title = element_text(face="bold", size=20))+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD et Genre", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, fill=Gender))+
    geom_boxplot()+
    theme_bw()+
    theme(legend.position = "bottom",
         legend.title = element_text(face="bold", size=15),
         plot.title = element_text(face = "bold", size = 20))+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD et Genre", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")+
    coord_flip()

ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, fill=GROUP))+
    geom_boxplot()+
    theme_bw()+
    facet_wrap(~Gender)+ # Par sexe
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD et Genre", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, fill=GROUP))+
    geom_boxplot()+
    theme_bw()+
    facet_wrap(Gender~Study_Site, nrow = 2)+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD, Genre et Site", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, fill=GROUP))+
    geom_boxplot()+
    theme_bw()+
    facet_wrap(Gender~Study_Site, nrow = 2)+
    theme(axis.text.x = element_text(angle =90))+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD, Genre et Site", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, fill=GROUP))+
    geom_boxplot()+
    theme_bw()+
    facet_grid(Gender~Study_Site)+
    theme(axis.text.x = element_blank(),
         axis.ticks.x = element_blank())+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD, Genre et Site", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, fill=GROUP))+
    geom_boxplot()+
    theme_bw()+
    facet_wrap(~Study_Site)+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD, Genre et Site", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, fill=GROUP))+
    geom_boxplot()+
    theme_bw()+
    facet_wrap(Study_Site~.)+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD, Genre et Site", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, fill=GROUP))+
    geom_boxplot()+
    theme_bw()+
    facet_grid(Gender~Study_Site)+
    theme(axis.text.x=element_text(angle = 90))+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD, Genre et Site", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, fill=GROUP))+
    geom_boxplot()+
    theme_bw()+
    facet_grid(Study_Site~Gender)+
    theme(axis.text.x=element_text(angle = 90))+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD, Genre et Site", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x=GROUP, y=V12.aosi.total_score_1_18, fill=GROUP))+
    geom_boxplot()+
    theme_bw()+
    facet_grid(Gender~Study_Site)+
    theme(axis.text.x=element_text(angle = 90), strip.text = element_text(face="bold"))+
    labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD, Genre et Site", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")

ggplot(data = data_aosi, aes(x = GROUP, y = V12.aosi.total_score_1_18, fill = GROUP)) +
  geom_boxplot() +
  theme_bw() +
  facet_grid(Gender ~ Study_Site,
             labeller = labeller(
                            Gender = c("Femme" = "F", "Homme" = "M"),
                            Study_Site = c("PHI" = "PHI", "SEA" = "SEA", "STL" = "St. Louis", "UNC" = "UNC-CH")
              )) +
  theme(axis.text.x = element_text(angle = 90), strip.text = element_text(face = "bold")) +
  labs(title = "Le Score total d'AOSI au mois 12", subtitle = "Par ASD, Genre et Site", caption = "Créé par Youned Dahami", x = "ASD", y="Score Total d'AOSI (Mois 12)")


