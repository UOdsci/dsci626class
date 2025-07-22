###### Principal Component Analysis (PCA) for a chemical analysis of wine


## Read in the data

wine <- read.table("wine.tsv", header=TRUE)

head(wine)



## Use princomp() to generate the PCs, etc.
pcs <- princomp(wine[,-1])
biplot(pcs, cex=0.4)

## do PCA using a correlation matrix (variation on same scale across 13 vars.)
wine_pcs <- princomp(wine[,-1], cor=TRUE)
biplot(wine_pcs, cex=0.4)
pairs(wine_pcs$scores[,1:3], col=wine[,1])


str(wine_pcs)


## Can look at the loadings on the first 3 PCs
wine_pcs$loadings[,1:3]
sort(wine_pcs$loadings[,1])
sort(wine_pcs$loadings[,2])
sort(wine_pcs$loadings[,3])


## What about variation explained by each PC?
wine_pcs$sdev

#to get the eigenvalues
wine_pcs$sdev^2

#to plot the total proportion of variation explained by each PC ("scree plot")
wine_pcs$sdev^2/sum(wine_pcs$sdev^2)

barplot(wine_pcs$sdev^2/sum(wine_pcs$sdev^2),
        cex.names=0.4, ylim=c(0,0.4))


## Make a prettier plot

plot(x=wine_pcs$scores[,1], y=wine_pcs$scores[,2],
     xlab="PC 1 (36.20%)", ylab="PC2 (19.21%)",
     col=wine$Vineyard)
#default color order: black, red, green, etc.

text(x=-1,y=2,labels = "Vineyard 3", cex=0.75, col="green")
text(x=2,y=3,labels = "Vineyard 1", cex=0.75, col="black")
text(x=-2,y=-3,labels = "Vineyard 2", cex=0.75, col="red")


head(wine_pcs$scores)

plot(x=wine_pcs$scores[,3], y=wine_pcs$scores[,6],
     col=wine$Vineyard)



