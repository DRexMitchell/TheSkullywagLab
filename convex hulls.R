# Import data
data(iris)

# Script as normal
plot(iris$Petal.Length, iris$Petal.Width, col = c("orange", "green", "purple")[iris$Species], pch=c(15,16,17)[iris$Species], cex=1, main = "Iris Petal Dimensions", xlab="Length (mm)", ylab="Width (mm)")

edge_points <- chull(iris$Petal.Length[which(iris$Species == "setosa")],iris$Petal.Width[which(iris$Species == "setosa")])
polygon(iris$Petal.Length[which(iris$Species == "setosa")][edge_points],iris$Petal.Width[which(iris$Species == "setosa")][edge_points], col = adjustcolor("orange", alpha.f = 0.3), border=FALSE)

edge_points <- chull(iris$Petal.Length[which(iris$Species == "versicolor")],iris$Petal.Width[which(iris$Species == "versicolor")])
polygon(iris$Petal.Length[which(iris$Species == "versicolor")][edge_points],iris$Petal.Width[which(iris$Species == "versicolor")][edge_points], col = adjustcolor("green", alpha.f = 0.3), border=FALSE)

edge_points <- chull(iris$Petal.Length[which(iris$Species == "virginica")],iris$Petal.Width[which(iris$Species == "virginica")])
polygon(iris$Petal.Length[which(iris$Species == "virginica")][edge_points],iris$Petal.Width[which(iris$Species == "virginica")][edge_points], col = adjustcolor("purple", alpha.f = 0.3), border=FALSE)


### Same script as loop ###

# Plot data
plot(iris$Petal.Length, iris$Petal.Width, col = c("orange", "green", "purple")[iris$Species], pch=c(15,16,17)[iris$Species], cex=1, main = "Iris Petal Dimensions", xlab="Length (mm)", ylab="Width (mm)")

colours <- c("orange", "green", "purple")
for (i in 1:nlevels(iris$Species)) {
  edge_points <- chull(iris$Petal.Length[which(iris$Species == levels(iris$Species)[i])],iris$Petal.Width[which(iris$Species == levels(iris$Species)[i])])
  polygon(iris$Petal.Length[which(iris$Species == levels(iris$Species)[i])][edge_points],iris$Petal.Width[which(iris$Species == levels(iris$Species)[i])][edge_points], col = adjustcolor(colours[i], alpha.f = 0.3), border=FALSE)
}

legend(1, 2.5, legend=c("I. setosa", "I. versicolor", "I. virginica"),
       col=c("orange","green","purple"), pch = c(15,16,17), cex=1.5, bty="n", text.font = 3)