data(state)

# dataframe
USA = as.data.frame(state.x77)
head(USA)

dim(USA)

# column names
colnames(USA)

# row names (50 states)
rownames(USA)

print(paste("The correlation between 'Illiteracy' and the 'Number of homicides' is:", cor(USA$Illiteracy, USA$Murder)))
print(paste("The correlation between 'Illiteracy' and the 'Percentage of high school graduates' is:", cor(USA$Illiteracy, USA$'HS Grad')))
print(paste("The correlation between 'Illiteracy' and 'Area' is:", cor(USA$Illiteracy, USA$Area)))

#installed.packages("FactoMineR")
require("FactoMineR")

data(state)
USA <- as.data.frame(state.x77)

colnames(USA)

?PCA

my_PCA = PCA(USA)

my_PCA$eig

# we extract the first 2 columns
barplot(height = my_PCA$eig[,2])

# information regarding individuals (print the first 4 rows)
my_PCA$ind$coord[1:4,]

# information regarding variables (print the first 4 rows)
my_PCA$var$coord[1:4,]

layout(matrix(1:2, nrow = 1))

plot(my_PCA, choix = "ind", cex = 0.7)  # 'ind' for the individuals
plot(my_PCA, choix = "var")            # 'var' for the variables

cor(USA$Illiteracy, USA$Murder)
cor(USA$Illiteracy,USA$'Life Exp')

cor(USA$Illiteracy, USA$Area)

# Contribution of the variables to PC1 and PC2 axis (the first 2 columns)
my_PCA$var$contrib[,1:2]

# Contribution of the variables to PC1 and PC2 axis (the first 2 columns)
my_PCA$var$cos2[,1:2]

levels(state.region)

# create a new dataset by concatenating the new column named 'region' and the dataframe 'USA'
USAr <- data.frame(region = state.region, USA)
head(USAr)

# Columns
print(colnames(USAr))

my_PCA <- PCA(X = USAr,
              quali.sup = 1,         # USAr$Region (qualitative variable)
              quanti.sup = c(2,9),   # USAr$Population and USAr$Area (supplementary variables)
              graph = FALSE)

layout(matrix(1:2, nrow = 1))

plot(my_PCA, choix = "ind", cex = .7, habillage = "region") # 'ind' for the individuals
plot(my_PCA, choix = "var")           # 'var' for the variables

#install.packages("explor")

#layout(matrix(1:2, nrow = 1))
#require("explor")  # charging 
#explor(my_PCA)

PCA(USA, scale.unit = FALSE)

PCA(USA, scale.unit = FALSE)$var$contrib[, 1:2]

my_PCA$var$contrib[,1:2]  # scale.unit is by default 'TRUE'

#install.packages("ade4")

library(ade4)
data(banque)
data <- banque

# dataframe
head(data)

observed_freq <- round(table(data$age, data$csp)*100/sum(table(data$age, data$csp)), 1)

# Create a table of observed frequencies with row and column sums
observed_freq_with_margins <- addmargins(observed_freq, FUN = list(column_sum= sum, line_sum = sum))

# Print the table with row and column sums and custom names
print(observed_freq_with_margins)

# Get the number of rows and columns in the table
num_rows <- nrow(observed_freq)
num_cols <- ncol(observed_freq)

# For that, we perform an exterior product between 'line_sum' and 'column_sum'
observed_freq <- round(outer(observed_freq_with_margins[,10], observed_freq_with_margins[6,])/100, 1)[1:num_rows-1, 1:num_cols-1]
observed_freq

outer(table(data$csp),observed_freq)



table(data$csp)




contingency_table = table(data$age,data$csp)
my_CA=CA(contingency_table)

table = data.frame(var=c("yoopi","boom","clop","clop","boing","boing","boom","yoopi"))
table

# the disjunctive table splits the qualitative variables into as many binary variables
tab.disjonctif(table)

data(tea)

my_MCA <- MCA(tea, quanti.sup = 19, quali.sup = 20:36, graph = FALSE)

print(dim(my_MCA$eig))
head(my_MCA$eig)

barplot(my_MCA$eig[,2])

# cumulative percentage of variance with 2 components
sum(my_MCA$eig[2, 3])

layout(matrix(1:4, nrow = 2))

plot(my_MCA)
plot(my_MCA, invisible = "ind")
plot(my_MCA, invisible = c("ind", "quali.sup"))
plot(my_MCA, invisible = c("ind", "quali.sup"), hab = "quali")

require(explor)

#explor(my_MCA)

?PCA

my_PCA <- PCA(USA, ncp = 2, graph = FALSE)
my_HCPC <- HCPC(my_PCA, nb.clust = 3, graph = FALSE)

plot(my_HCPC, choice = "tree")

plot(my_HCPC, choice = "map")


