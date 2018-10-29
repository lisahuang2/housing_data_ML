# housing_data_ML
machine learning and data visualization for king county housing data

In this project, I built statistical machine learning models to predict housing prices, using a data set of houses located in King County, WA. The data were obtained from Kaggle at https://www.kaggle.com/harlfoxem/housesalesprediction. Each observation in the data set represents a house located in King County. The goal was to predict house prices based on other features of the houses, including square footage, the number of bedrooms and bathrooms, and condition, among others. In this project, I also created graphical visualizations of the data and the relationships among the variables using ggplot in R.    

The models that I built come from supervised learning methods for regression and classification, as well as unsupervised learning methods. The supervised regression methods I used include linear and nonlinear regression, subset selection, ridge regression and lasso, principal components regression, and decision trees such as bagging and random forests. The supervised categorization methods I used include logistic regression, linear and quadratic discriminant analysis, k-nearest neighbors, classification trees, and support vector machines. The unsupervised methods include principal components analysis and clustering. 

Credit goes to "An Introduction to Statistical Learning, with Applications in R," written by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani, for guidance on building the machine learning models, and to "R Graphics Cookbook," by Winston Chang, for guidance on creating the ggplot visualizations.  

##

*A side note related to analyses in this project - Although the data lends itself best to using regression methods because the outcome variable of interest (price) is a continuous variable, I included classification and unsupervised learning methods in the analyses for a thorough demonstration of those techniques. I conducted classification by dichotomizing the price variable, then performing classification using this dichotomized variable. I would normally be more selective about the models I chose, but my goal here is to demonstrate a range of possible techniques.

##

Files included in this repository: 

- "kc_house_data.csv" - the data set on which the analyses and modeling were conducted

- "king county housing column reference.docx" - document containing a description of each of the variables in the data set 


R scripts:

- "1 - EDA and visualizations.R"

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
                   
                
