# Import data
data(iris)

# Script as normal
plot(iris$Petal.Length, iris$Petal.Width, col = c("orange", "green", "purple")[iris$Species], pch=c(15,16,17)[iris$Species], cex=1, main = "Iris Petal Dimensions", xlab="Length (mm)", ylab="Width (mm)")

xcoords <- iris$Petal.Length[1:50]
ycoords <- iris$Petal.Width[1:50]
lm_temp <- lm(ycoords~xcoords)
segments(min(xcoords), lm_temp$coefficients[1] + lm_temp$coefficients[2]*min(xcoords), max(xcoords), lm_temp$coefficients[1] + lm_temp$coefficients[2]*max(xcoords),lwd=4, col="orange")

xcoords <- iris$Petal.Length[51:100]
ycoords <- iris$Petal.Width[51:100]
lm_temp <- lm(ycoords~xcoords)
segments(min(xcoords), lm_temp$coefficients[1] + lm_temp$coefficients[2]*min(xcoords), max(xcoords), lm_temp$coefficients[1] + lm_temp$coefficients[2]*max(xcoords),lwd=4, col="green")

xcoords <- iris$Petal.Length[101:150]
ycoords <- iris$Petal.Width[101:150]
lm_temp <- lm(ycoords~xcoords)
segments(min(xcoords), lm_temp$coefficients[1] + lm_temp$coefficients[2]*min(xcoords), max(xcoords), lm_temp$coefficients[1] + lm_temp$coefficients[2]*max(xcoords),lwd=4, col="purple")

# As loop
col <- c("orange", "green", "purple")

plot(iris$Petal.Length, iris$Petal.Width, col = c("orange", "green", "purple")[iris$Species], pch=c(15,16,17)[iris$Species], cex=1, main = "Iris Petal Dimensions", xlab="Length (mm)", ylab="Width (mm)")

lm_temp <- NULL
xcoords <- vector()
ycoords <- vector ()

# this loop plots regression lines for each species
for (i in 1: length(levels (iris$Species))){
  xcoords <- subset(iris$Petal.Length, iris$Species == levels (iris$Species)[i])
  ycoords <- subset(iris$Petal.Width, iris$Species == levels (iris$Species)[i])
  lm_temp <- lm(ycoords~xcoords)
  segments(min(xcoords), lm_temp$coefficients[1] + lm_temp$coefficients[2] *min(xcoords), max(xcoords), lm_temp$coefficients[1] + lm_temp$coefficients[2] *max(xcoords), lwd = 4, col= col[i])
}
