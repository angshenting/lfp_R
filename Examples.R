library(datasets) # This is how you load packages; datasets loads some example datasets

# This is a comment

# Reading in files

htwt <- read.csv(file="simple.csv",head=TRUE,sep=",")
htwt
summary(htwt)

tree <- read.csv(file="trees.csv",header=TRUE,sep=",");

# Numbers
a <- 5
a + 2

# Strings

b <- c("hello","there")
b

typeof(a)
typeof(b)

# Factors
summary(tree$CHBR)

tree$C 
summary(tree$C)

tree$C <- factor(tree$C)# makes this into a factor
tree$C

summary(tree$C)
levels(tree$C)

# Data Frames

a <- c(1,2,3,4)
b <- c(2,4,6,8)
levels <- factor(c("A","B","A","B"))
dataFrame<- data.frame(first=a,second=b,f=levels)
dataFrame
summary(dataFrame)

dataFrame$first # This is how you select a column for dataframes
dataFrame$second

dataFrame$f

# Indexing

a <- c(1,2,3,4,5)
b <- c(TRUE,FALSE,FALSE,TRUE,FALSE)
a[b]

a[!b]
max(a)

# Probability distributions
dnorm(0.5)
dnorm(0.5,mean=0.5,sd= 4)
qnorm(0.025)
qnorm(0.025,lower.tail=FALSE)

# Linear Regression on Iris dataset
fit <- lm(iris$Petal.Length~iris$Sepal.Length,data=iris)

fit # Gives you the parameters of the model
fit$coefficients # Returns the coefficients
fit$coefficients["Sepal.Length"] # What does this do? What happens if you use fit$coefficients$Sepal.Length?

plot(iris$Sepal.Length,iris$Petal.Length)
abline(fit,col="blue")

summary(iris[iris$Species=="setosa"])

summary(iris$Sepal.Length)

prd<-predict(fit,interval = c("confidence"), level = 0.95,type="response")
lines(iris$Sepal.Length,prd[,2],col="red",lty=2)
lines(iris$Sepal.Length,prd[,3],col="red",lty=2)
# Choppy? 

# Alternative method - creates a new sequence to remove the issue of multiple data points resulting in choppiness

y <- iris$Petal.Length
x <- iris$Sepal.Length
fit <- lm(y~x)
plot(x,y)
abline(fit,col="blue")
newx <- seq(4,8,0.05) # Creates a sequence from 4 to 8 with step 0.05
prd<-predict(fit,newdata=data.frame(x=newx),interval= c("confidence"), level = 0.95,type="response")
lines(newx,prd[,2],col="red",lty=2)
lines(newx,prd[,3],col="red",lty=2)

