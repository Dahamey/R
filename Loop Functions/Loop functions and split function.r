x <- sample(letters, 100, rep=T)
table(x)
tapply(x, x, length)

?lapply

# Creating a list
x <- list(a=1:5, b=rnorm(10))
x

# lapply will loop over the elements of the list 'x' and apply the 'mean' function
lapply(x, mean)

# rnorm(nb of simulations, mean)
(x <- list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5)))

lapply(x, mean)

# 'lapply' will loop over the elements of 'x' & generate random outcomes from the uniform distribution
x <- 1:4
lapply(x, runif)

(x <- list(a = matrix(1:4,2,2), b=matrix(1:6,3,2)))

# extracting the first column of each matrix in the list 'x'
lapply(x, function (elt) elt[,1])

# extracting the first row of each matrix in the list 'x'
lapply(x, function (elt) elt[1,])

# Creating a list
x <- list(a=1:5, b=rnorm(10))
# sapply will loop over the elements of the list 'x' and apply the 'mean' function, and return a vector
sapply(x, mean)

# Creating a list of matrices having the same number of columns (2)
x <- list(a = matrix(1:4,2,2), b=matrix(1:6,3,2))
# extracting the first row of each matrix in the list 'x', sapply will return a matrix
sapply(x, function (elt) elt[1,])

library(lattice)

x <- list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
densityplot(x$d)

sapply(x, mean)

str(apply)

x <- matrix(rnorm(200), 20, 10)

# calculating the sum on each column
apply(x, 2, sum)

# calculating the mean on each row 
apply(x, 1, mean)

any(colMeans(x) == apply(x, 2, mean))

# 'quantile' function has a 'probs' argument
?quantile

# How to use the additional 'probs' argument in apply
x <- matrix(rnorm(200), 20,10)
apply(x, 1, quantile, probs = c(0.25,0.75))

# Creating a 2x2x10 array
(a <- array(rnorm(2*2*10), c(2,2,10)))
class(a <- array(rnorm(2*2*10), c(2,2,10)))
dim(a <- array(rnorm(2*2*10), c(2,2,10)))

# calculating the average in each 2x2 array in 'a' :
apply(a, c(1,2), mean)  # 1 for the 1st dimension, 2 for the 2nd dimension

rowMeans(a, dim = 2)

str(mapply)

list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))

mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd){
    rnorm(n, mean, sd)
}

noise(5,1,2)

noise(1:5, 1:5, 2)

list(noise(1,1,2), noise(2,2,2), noise(3,3,2), noise(4,4,2), noise(5,5,2))

mapply(noise, 1:5, 1:5, 2)

# 10 nbs from standard distribution N(0,1), 10 from uniform distribution, 10 from N(1,1)
(x <- c(rnorm(10), runif(10), rnorm(10,1)))

?gl

# generating a factor : 3 levels, each level is repeated 10 times
f <- gl(3,10)
f

# taking group means
tapply(x, f, mean)

# taking group means without simplification
tapply(x, f, mean, simplify = FALSE)

# find group ranges
tapply(x, f, range)

min(x[1:10])
max(x[1:10])

str(split)

(x <- c(rnorm(10), runif(10), rnorm(10,1)))

# generating a factor : 3 levels, each level is repeated 10 times
f <- gl(3,10)
f

# splitting x using the factor 'f'
split(x, f)

# Calculating the mean of each level : the 'split+ lapply' here is equivalent to 'tapply'
lapply(split(x,f), mean)

tapply(x, f, mean)

library(datasets)
head(airquality)

# Splitting the dataframe by 'Month'
(s <- split(airquality, airquality$Month))

lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

# Example dataframe
df <- data.frame(
  Gender = c("Male", "Male", "Female", "Female", "Male", "Female"),
  Race = c("White", "Black", "White", "Black", "White", "Black"),
  Age = c(25, 30, 35, 40, 45, 50)
)

# Splitting by 'Gender' and 'Race', and calculating mean 'Age' for each combination
(split_groups <- split(df, list(df$Gender, df$Race)))

print("--------------------------------------------------------")

# Using 'lapply' to calculate mean 'Age' for each split group
mean_age_lapply <- lapply(split_groups, function(x) mean(x$Age))

# Using 'sapply' to calculate mean 'Age' for each split group
mean_age_sapply <- sapply(split_groups, function(x) mean(x$Age))

# Output
mean_age_lapply
mean_age_sapply



