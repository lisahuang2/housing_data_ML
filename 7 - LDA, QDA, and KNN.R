##### 7 - Linear Discriminant Analysis, Quadratic Discriminant Analysis, and K-Nearest Neighbors #####


#We'll use LDA, QDA, and KNN to predict our dichotomous price2 variable 
#(see the "6 - logistic regression" script) based on other predictors in the data set. 



##-- a. Linear Discriminant Analysis (LDA) --##


#Use the lda() function from the MASS library to perform LDA.  
library(MASS)

#Separate the data into a training set and a test set.
set.seed(9)
train <- sample(nrow(king), nrow(king)/2)
test <- king[-train,]

#Fit the LDA model, predicting price2 from sqft_living, grade, and waterfront.
lda.fit1 <- lda(price2 ~ sqft_living + grade + waterfront, data=king[train,])

#Call the model name to see the prior probabilities, the means of each predictor separated by
#group, and the coefficients of the linear discriminants
lda.fit1    
#prior probabilities are 70.52% for group 0 and 29.48% for group 1

#Obtain predictions on the training data, and compare them to the observed values to determine
#the model's accuracy.
lda.pred1 <- predict(lda.fit1, king[train,])
table(lda.pred1$class)    
#8559 observations assigned to class 0 
#2247 observations assigned to class 1
table(predicted=lda.pred1$class, observed=king[train,]$price2)
mean(lda.pred1$class==king[train,]$price2)    #82.87% accuracy rate
mean(lda.pred1$class!=king[train,]$price2)    #17.13% error rate  

#Obtain predictions on the test data, and compare them to the observed values to determine
#the model's accuracy.
lda.pred2 <- predict(lda.fit1, test)
table(lda.pred2$class)  
#8609 observations assigned to class 0 
#2198 observations assigned to class 1
table(predicted=lda.pred2$class, observed=test$price2)
mean(lda.pred2$class==test$price2)    #82.83% accuracy rate
mean(lda.pred2$class!=test$price2)    #17.17% error rate   

#Among the observations that are in class 1 (>= $600,00), almost half of them were predicted to 
#be in class 0. 
#To change the false positive rate, false negative rate, or sensitivity and specificity of the 
#predictions, you can change the threshold of the posterior probabilities.  
#In this case, lower the threshold of belonging to class 1 by assigning an observation to 
#group 1 if the probability is > .3
posteriors <- lda.pred2$posterior
pred.class <- rep("0", nrow(test))
pred.class[posteriors[,2]>.3] <- "1"
table(pred.class)    
#7558 observations assigned to class 0
#3249 observations assigned to class 1

#Now compare the predictions against the observed values.
table(predicted=pred.class, observed=test$price2)   

#Now a greater proportion of the observations in group 1 are actually being assigned to group 1.
#However, this comes at the expense of slightly lower overall accuracy:
mean(pred.class==test$price2)    #81.74% accuracy rate
mean(pred.class!=test$price2)    #18.26% error rate   

#Note - for some applications of data, it might be worth trading overall accuracy to lower either 
#the false positive rate or the false negative rate. This depends on the cost of false positives or
#false negatives for your particular application.



##-- b. Quadratic Discriminant Analysis (QDA) --##


#Use the qda() function from the MASS library to fit a QDA model.
library(MASS)

#Separate the data into a training set and a test set.
set.seed(9)
train <- sample(nrow(king), nrow(king)/2)
test <- king[-train,]

#Fit a QDA model to the training set.
qda.fit1 <- qda(price2 ~ sqft_living + grade + waterfront, data=king[train,] )

#Call the model name to see the prior probabilities and the means of each predictor, separated by
#group
qda.fit1
#prior probabilities are 70.52% for group 0 and 29.48% for group 1

#Obtain predictions on the training data, and compare them to the observed values to determine
#the model's accuracy.
qda.pred1 <- predict(qda.fit1, king[train,])
table(qda.pred1$class)    
#9341 observations assigned class 0
#1465 observations assigned class 1
table(predicted=qda.pred1$class, observed=king[train,]$price2)
mean(qda.pred1$class==king[train,]$price2)    #80.72% accuracy rate
mean(qda.pred1$class!=king[train,]$price2)    #19.28% error rate  

#Obtain predictions on the test data, and compare them to the observed values to determine
#the model's accuracy.
qda.pred2 <- predict(qda.fit1, test)
table(qda.pred2$class)
#9384 observations assigned to class 0 
#1423 observations assigned to class 1
table(predicted=qda.pred2$class, observed=test$price2)
mean(qda.pred2$class==test$price2)    #80.78% accuracy rate
mean(qda.pred2$class!=test$price2)    #19.22% error rate   



##-- c. K-Nearest Neighbors (KNN) --##


#Use the knn() function from the class library to run k-nearest neighbors.
library(class)

#knn() requires four inputs:
#   - a matrix containing the predictors associated with the training data
#   - a matrix containing the predictors associated with the test data
#   - a vector containing the class labels for the training observations
#   - a value for K, the number of nearest neighbors to be used by the classifier 

#Using KNN, we will predict price2 from sqft_living, grade, and waterfront. First, the predictors 
#must be standardized prior to running the model. Create a separate matrix containing only the 
#predictors to be used in the model, then use the scale() function to standardize those predictors. 
stand.x <- scale(king[,c("sqft_living", "grade", "waterfront")])

#Check that all the columns have a mean of 0 and standard deviation of 1
apply(stand.x, 2, mean)
apply(stand.x, 2, sd)

#Now create a matrix containing the predictors associated with the training data
set.seed(9)
samp <- sample(nrow(stand.x), nrow(stand.x)/2)
train.x <- stand.x[samp,]
head(train.x)  

#Create a matrix containing the predictors associated with the test data
test.x <- stand.x[-samp,]
head(test.x)

#Create a vector containing the class labels for the training observations
train.y <- king[samp,]$price2

#Run KNN with k=5 
set.seed(9)
knn.fit1 <- knn(train.x, test.x, train.y, k=5) 

#Compare the predicted outcomes to the observed outcomes in the test set. 
test <- king[-samp,]
table(knn.fit1, test$price2) 
mean(knn.fit1==test$price2)    #accuracy = 81.81%
mean(knn.fit1!=test$price2)    #error = 18.19%

#Run KNN with k=10 
set.seed(9)
knn.fit2 <- knn(train.x, test.x, train.y, k=10) 

#Compare the predicted outcomes to the observed outcomes in the test set. 
table(knn.fit2, test$price2) 
mean(knn.fit2==test$price2)    #accuracy = 81.84%
mean(knn.fit2!=test$price2)    #error = 18.16%   






