# Problem (1)

train <- read.table(file=
                      "http://archive.ics.uci.edu/ml/machine-learning-databases/optdigits/optdigits.tra",
                    sep=",", header = FALSE, na.strings = c("NA", "", " "),
                    col.names = c(paste("x", 1:64, sep=""), "digit"))
test <- read.table(file=
                     "http://archive.ics.uci.edu/ml/machine-learning-databases/optdigits/optdigits.tes",
                   sep=",", header = FALSE, na.strings = c("NA", "", " "),
                   col.names = c(paste("x", 1:64, sep=""), "digit"))
dim(train); dim(test)

#Concatenate both data sets into one, call it dat.

dat <- rbind(train, test); dim(dat)

# Problem (2)

dat0 <- data.matrix(dat[order(dat$digit), -65])
n <- NROW(dat0)
color <- rainbow(n, alpha = 0.8)
heatmap(dat0, col=color, scale="column", Rowv=NA, Colv=NA,
        labRow=FALSE, margins=c(4,4), xlab="Image Variables", ylab="Samples",
        main="Heatmap of Handwritten Digit Data")

dat1 <- data.matrix(dat0[,c(-1,-40)])
heatmap(dat1, col=color, scale="column", Rowv=NA, Colv=NA,
        labRow=FALSE, margins=c(4,4), xlab="Image Variables", ylab="Samples",
        main="Heatmap of Handwritten Digit Data")

# Problem (3)


dat1.scaled <- data.frame(apply(dat[,c(-65,-1,-40)],2,scale))
pca.res1 <- prcomp(dat1.scaled, retx=TRUE) 
#pca.res1
plot(pca.res1) 
screeplot(pca.res1); 
screeplot(pca.res1, type="lines")

PC.directions <- pca.res1$rotation
a1.a2 <- pca.res1$rotation[,1:6]
head(a1.a2)



pca.res1$x[,1:2]
dat$digit <- as.factor(dat$digit)
colors = rainbow(10)
plot(pca.res1$x[,1:2], pch="", main="PC2 vs PC1")
text(pca.res1$x[,1:2],labels=dat$digit, col=colors[dat$digit])


# Problem (4)

library(MASS)

my_data <- data.matrix(dat[,-65])
colnames(my_data)
d1 <- dist(my_data)
fit1<- isoMDS(d1,k=2) 
x1 <- fit1$points[,1]; y1 <- fit1$points[,2]
plot(x1,y1, pch="", xlab=expression(z[1]), ylab=expression(z[2]),main=" Nonmetric MDS data", type="n")
text(x1, y1, labels=dat$digit, col=colors[dat$digit])


# Problem (5)

library(Rtsne)
tsne <- Rtsne(dat[,-65], dims = 2, perplexity=30, verbose=TRUE, max_iter = 500)
plot(tsne$Y, t='n', main="tsne")
text(tsne$Y, labels=dat$digit, col=colors[dat$digit])

