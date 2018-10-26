# housing_data_ML
machine learning and data visualization for king county housing data

In this project, I use statistical machine learning to predict housing prices, using a data set of houses located in King County, WA. The data were obtained from Kaggle at https://www.kaggle.com/harlfoxem/housesalesprediction. In this repository, the data are located in "kc_house_data.csv", and a description of the variables in the data set is located in "king county housing column reference.doc".  

The analyses in this project include supervised learning methods for regression and classification as well as unsupervised learning methods. Supervised regression methods include linear and nonlinear regression, subset selection, ridge regression and lasso, principal components regression, and decision trees such as bagging and random forests. Supervised categorization methods include logistic regression, linear and quadratic discriminant analysis, k-nearest neighbors, classification trees, and support vector machines. Unsupervised methods including principal components analysis and clustering. 

The primary resource I used for learning these techniques and implementing them in R come from a textbook called "An Introduction to Statistical Learning, with Applications in R," written by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani. A free pdf copy of the book is available at https://www-bcf.usc.edu/~gareth/ISL/. Free complementary lecture video are available through Stanford Online courses at https://lagunita.stanford.edu/courses/HumanitiesSciences/StatLearning/Winter2016/about. 

A side note related to analyses in this project - 


Below is a list of each of the script files included in this repository and a description of each of the files. 

1.  "1 - EDA and visualizations.R"

    Description:  Exploratory data analysis of King County housing data, with ggplot data visualizations
    
    Sub-sections:  
                   
                   a. Map the houses in King County
                   
                   b. Summary statistics and plots of each variable
                   
                   c. Plot the correlations among the variables
                   
                   d. Plot the relationship between sqrt_price (the outcome variable) and each predictor variable
                   

2.  "2 - linear regression.R"

    Description:  Simple and multiple linear regression, polynomial regression, and cross-validation
    
    Sub-sections:  
    
                   a. Simple linear regression
                   
                   b. Multiple linear regression
                   
                   c. Linear polynomial regression
                   
                   d. Using the validation set approach to select a polynomial term
                   
                   e. Using k-fold cross-validation to select a polynomial model
                   
                   f. Plotting the linear polynomial regression model
                   

3.  "3 - subset selection.R"

    Description:  Linear model selection using best subset selection and forward and backward stepwise regression
    
    Sub-sections:  
    
                   a. Best subset selection
                   
                   b. Forward stepwise selection
                   
                   c. Backward stepwise selection
                   
                   d. Choosing a model using the validation set approach
                   
                   e. Choosing a model using 10-fold cross-validation
                 

4.  "4 - ridge regression and lasso.R"
    
    Description:  Shrinkage in linear models using ridge regression and lasso 
    
    Sub-sections:  
    
                   a. Ridge regression
                   
                   b. Ridge regression with cross-validation
                   
                   c. Lasso
                   
                   d. Lasso with cross-validation
                   

5.  "5 - PCR and PLC.R"
    
    Description:  Dimension reduction in linear models using principal components regression and partial least squares 
    
    Sub-sections:  
    
                   a. Principal components regression (PCR)
                   
                   b. PCR with cross-validation
                   
                   c. Partial least squares (PLS) with cross-validation
                   
                   
6.  "6 - logistic regression.R"
    
    Description:  Categorization using logistic regression and logistic polynomial regression, with cross-validation 
    
    Sub-sections:  
    
                   a. Logistic regression
                   
                   b. Logistic regression with cross-validation
                   
                   c. Logistic polynomial regression
                   
                   d. Logistic polynomial regression with the validation set approach
                   
                   e. Plotting the logistic polynomial regression model
                                     
                   
7.  "7 - LDA, QDA, and KNN.R"
    
    Description:  Linear discriminant analysis, quadratic discriminant analysis, and k-nearest neighbors for categorization 
    
    Sub-sections:  
    
                   a. Linear Discriminant Analysis (LDA)
                   
                   b. Quadratic Discriminant Analysis (QDA)
                   
                   c. K-Nearest Neighbors (KNN)
                                     
                   
8.  "8 - decision trees.R"
    
    Description:  Decision trees for regression and classification, including bagging, random forests, and boosting
    
    Sub-sections:  
    
                   a. Classification trees
                   
                   b. Regression trees
                   
                   c. Bagging and random forests
                   
                   d. Boosting
                   
                   
9.  "9 - support vector machines.R"
    
    Description:  Support vector classifiers and support vector machines for classification
    
    Sub-sections:  
    
                   a. Support vector classifiers
                   
                   b. Support vector machines
                   

10.  "10 - unsupervised learning.R"

     Description:  Unsupervised learning methods, including principal components analysis (PCA), k-means clustering, and hierarchical clustering
     
     Sub-sections:  
    
                   a. Principal components analysis (PCA)
                   
                   b. K-means clustering
                   
                   c. Hierarchical clustering
                   
                
