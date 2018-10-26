##### 10 - Unsupervised Learning Methods #####


#Unsupervised learning methods look for patterns in the data, without taking into account
#how the predictors are related to the outcome of interest. To run unsupervised learning
#methods, we need to create a data frame from which to conduct these methods that contains 
#only the predictor variables: 
king4 <- king[,c("sqft_living", "sqft_lot", "sqft_living15", "sqft_lot15", "bedrooms", 
                 "bathrooms",  "floors", "waterfront", "condition", "grade", "yr_built")]



##-- a. Principal components analysis (PCA) --##


#Use the prcomp() function to perform PCA. By default, the prcomp() function centers the 
#variables to have a mean of zero. The argument scale=TRUE scales the variables to have a 
#standard deviation of one.
pc.fit1 <- prcomp(king4, scale=TRUE)

#Cal the model name to view the standard deviations and the loadings for each principal 
#component. Notice that the standard deviations decrease with each principal component because 
#they sucessively explain a smaller and smaller proportion of the variance in the data.
pc.fit1

#You can view the principal compoenent scores for each observation in the data frame by calling
#the x object:
head(pc.fit1$x) 

#Use the biplot() function to plot the first two principal components. The scale=0 argument 
#scales the arrows to represent the loadings.
biplot(pc.fit1, scale=0)

#To compute the proportion of variance explained by each principal component (PVE), compute 
#the variance by squaring the standard deviation, then dividing the variance by the sum of 
#the variance of all 11 principal components. Note that the sum of pve of all components 
#should equal 1.
pc.var <- pc.fit1$sdev^2
pve <- pc.var/sum(pc.var)
pve
sum(pve)

#Plot the PVE of each component and the cumulative PVE.
plot(pve, xlab="Principal Component", ylab="Variance Explained",
     ylim=c(0,1), type="b", col="blue")
lines(cumsum(pve), type="b", col="red")
legend("topleft", legend=c("PVE", "Cumulative PVE"), col=c("blue", "red"), pch=1)



##-- b. K-means clustering --##


#Use the function kmeans() to perform k-means clustering. We'll first perform k-means clustering 
#with k=2.
#(Note - The nstart argument specifies the number of clustering iterations to perform, each with 
#a random starting assignment for each observation. If nstart > 1, then the function will report
#the best results.)
set.seed(9)
km.fit1 <- kmeans(king4, 2, nstart=20)

#Call the object to view a summary of the clusters.
km.fit1    

#Examine the cluster sizes
km.fit1$size    
    #21236 observations in cluster 1
    #377 observations in cluster 2

#View the cluster means as follows:
km.fit1$centers
    #cluster 2 has larger values on almost all variables

#View the within-cluster and between-cluster sums of squares.
km.fit1$totss      #total SS = 5.321936e+13
km.fit1$withinss   #in cluster 1, within SS = 7.174853e+12; in cluster 2, within SS = 1.503263e+13
km.fit1$tot.withinss    #total within-cluster SS = 2.220749e+13
km.fit1$betweenss  #between SS = 3.101187e+13

#Calculate the within-cluster and between-cluster variability.
km.fit1$tot.withinss/km.fit1$totss  #within-cluster variability = 41.73%
km.fit1$betweenss/km.fit1$totss     #between-cluster variability = 58.27%

#Determine whether housing prices differ between clusters. First create a data frame combining
#the cluster assignment and the price of each house.
dat1 <- data.frame(king$price, km.fit1$cluster)
colnames(dat1) <- c("price", "cluster")

#Now calculate the mean of price for each cluster.
tapply(dat1$price, dat1$cluster, mean)  
    #cluster 1 - 537,827.5
    #cluster 2 - 667,424.9 

#Calculate the standard deviation for each cluster.
tapply(dat1$price, dat1$cluster, sd)    
    #cluster 1 - 366,889.8 
    #cluster 2 - 358,380.3  

#In conclusion, the second cluster is much smaller than the first cluster. In addition, the houses 
#in the second cluster compared to the houses in the first cluster have more living space, bigger 
#lot sizes, more bedrooms and bathrooms, and higher grade rating, and are more expensive. 


#Let's see what the clusters look like if we run k-means clustering with k=3.
set.seed(9)
km.fit2 <- kmeans(king4, 3, nstart=20)
km.fit2    

#Examine the cluster sizes
km.fit2$size    
    #20172 observations in cluster 1 
    #288 observations in cluster 2
    #1153 observations incluster 3

#View the cluster means as follows:
km.fit2$centers
    #compared to cluster 1, clusters 2 and 3 have more living space, larger lot sizes, more 
    #bathrooms, and a higher grade rating, and were built more recently. Cluster 2 compared to
    #the other clusters have much larger lot sizes.

#Calculate the within-cluster and between-cluster variability.
km.fit2$tot.withinss/km.fit2$totss  #within-cluster variability = 32.19%
km.fit2$betweenss/km.fit2$totss     #between-cluster variability = 67.81%

#Compare house prices among the clusters. First create a data frame combining the cluster 
#assignment and the price of each house.
dat2 <- data.frame(king$price, km.fit2$cluster)
colnames(dat2) <- c("price", "cluster")

#Now calculate the mean of price for each cluster.
tapply(dat2$price, dat2$cluster, mean)  
    #cluster 1 - 531,013.7 
    #cluster 2 - 673,724.6
    #cluster 3 - 665,467.8 

#Calculate the standard deviation of each cluster.
tapply(dat2$price, dat2$cluster, sd)
#cluster 1 - 360,713.0 
#cluster 2 - 358,527.7 
#cluster 3 - 443,479.0 


#To observe how the within-cluster variability changes for an increasing number of clusters, 
#write a loop to calculate the proportion of within-cluster SS for a range of k values.

withinSS <- rep(NA, 7)
for(k in 1:7){
  set.seed(9)
  km.fit <- kmeans(king4, k, nstart=20)
  withinSS[k] <-  km.fit$tot.withinss/km.fit$totss  
}
withinSS    
    #[1.0000000 0.4172821 0.3218839 0.1973594 0.1650306 0.1370191 0.1295150]
    #Notice how within-cluster SS decreases with an increasing number of clusters.)


#You can also run k-means clustering on principal component scores. Here, we'll cluster on
#the first two principal components that we obtained from running PCA above. First, subset 
#the loading scores for the first two principal components from the pc.fit1$x object.
scores <- pc.fit1$x[,1:2]
head(scores)

#Now run k-means clustering with k=2.
set.seed(9)
km.pc2 <- kmeans(scores, 2, nstart=20)
km.pc2

#Plot the two clusters against the two principal components. 
plot(scores, col=km.pc2$cluster, main="K-Means Clustering with K=2")
legend("bottomleft", legend=c("cluster 1", "cluster 2"), col=c("black", "red"), pch=1)

#From the plot, the clusters seem to be divided randomly. It doesn't seem to be a good way
#to group the data.

#Try k-means clustering with k=3.
set.seed(9)
km.pc3 <- kmeans(scores, 3, nstart=20)
km.pc3

#Plot the three clusters against the two principal components. 
plot(scores, col=km.pc3$cluster, main="K-Means Clustering with K=2")
legend("bottomleft", legend=c("cluster 1", "cluster 2", "cluster 3"), 
       col=c("black", "red", "green"), pch=1)

#Based on the plot, the third cluster at least seems to divide outlier observations (i.e.,
#observations with low scores on PC2) from the first two clusters.  



##-- c. Hierarchical clustering --##


#First, scale all the variables to have a mean of 0 and sd of 1.
king4.sc <- scale(king4)

#Double check that all means = 0 and sds = 1.
apply(king4.sc, 2, mean)
apply(king4.sc, 2, sd)

#Use the hclust() function to perform hierarchical clustering. The dist() function is used to 
#compute the inter-observation Euclidean distance matrix. First, we'll use the complete linkage
#method which calculates cluster distance using maximal intercluster dissimilarity. 
#(Note - the algorithm might take a while to run.)
hc.complete <- hclust(dist(king4.sc), method="complete")

#Plot the dendrogram using the plot() function. The numbers at the bottom of the plot identify 
#each observation.
#(In this data set, you can't see all the leaves at the bottom because there are too many 
#observations. However, you can still get a sense of the number of clusters to group by.)
plot(hc.complete, main="Complete Linkage", xlab="", sub="", cex=.5)

#Use the cutree() function to group the observations into a specified number of clusters.
#Here, we group into two clusters:
cutree(hc.complete, 2)          
table(cutree(hc.complete, 2))   
    #21576 observations in cluster 1
    #37 observations in cluster 2 

#Group the observations into three clusters:
cutree(hc.complete, 3)          
table(cutree(hc.complete, 3))   
    #21576 observations in cluster 1
    #30 observations in cluster 2 
    #7 observations in cluster 3 

#When we cut into two clusters, compare whether housing prices differ between the clusters. 
clusters <- cutree(hc.complete, 2)   
dat3 <- data.frame(king$price, clusters)
colnames(dat3) <- c("price", "cluster")
tapply(dat3$price, dat3$cluster, mean)  
    #cluster 1 mean = 539,656.6 
    #cluster 2 mean = 791,751.4 
tapply(dat3$price, dat3$cluster, sd)  
    #cluster 1 standard deviation = 366,858.7 
    #cluster 2 standard deviation = 437,518.9   


#Now perform clustering using the average linkage method. This method calculates distance 
#between clusters using mean intercluster dissimilarity.
#(Note - the algorithm might take a while to run.)
hc.average <- hclust(dist(king4.sc), method="average")

#Plot the dendrogram
plot(hc.average, main=" Average Linkage ", xlab="", sub="", cex=.5)

#Group the observations into two clusters:
cutree(hc.average, 2)         
table(cutree(hc.average, 2))   
    #21610 observations in cluster 1
    #3 observations in cluster 2 

#Group the observations into three clusters:
cutree(hc.average, 3)       
table(cutree(hc.average, 3))   
    #21599 observations in cluster 1
    #1 observation in cluster 2
    #2 observations in cluster 3


#Last, perform clustering with single linkage. This method calculates distance between clusters
#using minimal intercluster dissimilarity. This method is not recommended because it tends to 
#produce unbalanced trees.
#(Note - the algorithm might take a while to run.)
hc.single <- hclust(dist(king4), method="single")

#Plot the dendrogram
plot(hc.single, main=" Single Linkage ", xlab="", sub="", cex=.5)

#Group the observations into two clusters:
cutree(hc.single, 2)        
table(cutree(hc.single, 2))   
    #21612 observations in cluster 1
    #1 observation in cluster 2 

#Group the observations into three clusters:
cutree(hc.single, 3)          
table(cutree(hc.single, 3))   
    #21610 observations in cluster 1
    #1 observation in cluster 2
    #2 observations in cluster 3

#Overall, it doesn't seem like clustering is a good way to represent this data because most 
#observations fall into a single cluster. 



