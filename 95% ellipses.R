library(SIBER)

# raw code

data <- iris[,3:4]
plot(data, col=c("orange","green","purple")[iris$Species], pch=c(15,16,17)[iris$Species], xlab = "Petal Length", ylab = "Petal Width")

mn <- colMeans(data[1:50,])
sd <- cov(data[1:50,]) 
addEllipse(mn, sd, p.interval = 0.95, col = "orange", lty = 1, lwd=3)

mn <- colMeans(data[51:100,])
sd <- cov(data[51:100,]) 
addEllipse(mn, sd, p.interval = 0.95, col = "green", lty = 1, lwd=3)

mn <- colMeans(data[101:150,])
sd <- cov(data[101:150,]) 
addEllipse(mn, sd, p.interval = 0.95, col = "purple", lty = 1, lwd=3)


# As loop
col <- c("orange","green","purple")

plot(data, col=col[iris$Species], pch=c(15,16,17)[iris$Species], xlab = "Petal Length", ylab = "Petal Width", ylim=c(0,3))

for (i in 1:nlevels(iris$Species)) {
    mn <- colMeans(data[which(iris$Species==levels(iris$Species)[i]),])
    sd <- cov(data[which(iris$Species==levels(iris$Species)[i]),])
    addEllipse(mn, sd, p.interval = 0.95, col = col[i], lty = 1, lwd=3)
}
