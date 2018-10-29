# housing_data_ML
machine learning and data visualization for king county housing data (July - October 2018)

In this project, I built statistical machine learning models to predict housing prices, using a data set of houses located in King County, WA. The data were obtained from Kaggle at https://www.kaggle.com/harlfoxem/housesalesprediction. Each observation in the data set represents a house located in King County. The goal was to predict house prices based on features of the houses, including square footage, the number of bedrooms and bathrooms, and condition, among others. In this project, I also created graphical visualizations of the data and the relationships among the variables using ggplot in R.    

The models that I built come from supervised learning methods for regression and classification, as well as unsupervised learning methods. The supervised regression methods I used include linear and nonlinear regression, subset selection, ridge regression and lasso, principal components regression, and decision trees such as bagging and random forests. The supervised categorization methods I used include logistic regression, linear and quadratic discriminant analysis, k-nearest neighbors, classification trees, and support vector machines. The unsupervised methods include principal components analysis and clustering. 

Credit goes to "An Introduction to Statistical Learning, with Applications in R," written by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani, for guidance on building the machine learning models, and to "R Graphics Cookbook," by Winston Chang, for guidance on creating the ggplot visualizations.  

##

*A side note related to analyses in this project - Although the data lends itself best to using regression methods because the outcome variable of interest (price) is a continuous variable, I included classification and unsupervised learning methods in the analyses for a thorough demonstration of those techniques. I conducted classification by dichotomizing the price variable, then performing classification using this dichotomized variable. I would normally be more selective about the models I chose, but my goal here is to demonstrate a range of possible techniques.

##

Data files in this repository: 

- "kc_house_data.csv" - the data set on which the analyses and modeling were conducted
- "king county housing column reference.docx" - document containing a description of each of the variables in the data set 

Features in the data set include:

- price - price of each house
- sqrt_price* - the square root of the price
- price2** - dichotomous price variable, with 0 representing houses that are <$600,00, and 1 representing houses that are <=$600,000
- sqft_living - square footage of the house
- sqft_lot - square footage of the lot
- sqft_above - square footage of the house apart from the basement
- sqft_basement - square footage of the basement
- sqft_living15 - square footage of the house in 2015 (implies renovations)
- sqft_lot15 - square footage of the lot in 2015 (implies renovations)
- bedrooms - number of bedrooms in each house
- bathrooms - number of bathrooms in each house
- floors - number of floors in each house
- waterfront - whether the house has a waterfront view (0 if no, 1 if yes)
- condition - the condition of the house, on a 1-5 scale
- grade - overall grade given to the house, based on the King County grading system (higher values indicate a nicer house)
- yr_built - year the house was built
- zipcode - zipcode in which the house is located
- lat - latitude coordinate of the house
- long - longitude coordinate of the house

*sqrt_price is a transformation that I had performed on the original price variable in order to fit regression models (see the "1 - EDA and visualizations.R" script). I created predictions on a square root transformation of price because the original price variable is heavily positively skewed.

**price2 is a dichotomized price variable that I had created in order to fit categorization models (see the "6 - logistic regression.R" script).

##

Included in this repository are a sample of the plots I made, showing the distribution of variables and their relationships (see the "1 - EDA and visualization.R" script): 

- "plot1 - geographic map of houses.png" - uses a map shapefile to plot the locations of the houses across the county. Houses are color-coded by price.
- "plot2 - correlation plot.png"
- "plot3 - distribution of price.png"
- "plot4 - distribution of sqrt_price.png"
- "plot5 - distribution of sqft_living.png"
- "plot6 - counts of bedrooms.png"
- "plot7 - counts of bathrooms.png"
- "plot8 - counts of waterfront.png"
- "plot9 - counts of grade.png"
- "plot10 - relationship between sqft_living and sqrt_price.png"
- "plot11 - relationship between bedrooms and sqrt_price.png"
- "plot12 - relationship between bathrooms and sqrt_price.png"
- "plot13 - relationship between waterfront and sqrt_price.png"
- "plot14 - relationship between grade and sqrt_price.png"

##

The R scripts I wrote are meant to be followed sequentially, but they should be easy to follow if you want to skip around. Below are the names and descriptions of the scripts included in this repository:

- "1 - EDA and visualizations.R"

    Description:  Exploratory data analysis of King County housing data, with ggplot data visualizations. (see the image files in this repository for a sample of the plots.)
    
    Sub-sections:  
                   
                   a. Map the houses in King County
                   
                   b. Summary statistics and plots of each variable 
                   
                   c. Plot the correlations among the variables 
                   
                   d. Plot the relationship between sqrt_price (the outcome variable) and each predictor variable
                   

-  "2 - linear regression.R"

    Description:  Simple and multiple linear regression, polynomial regression, and cross-validation
    
    Sub-sections:  
    
                   a. Simple linear regression
                   
                   b. Multiple linear regression
                   
                   c. Linear polynomial regression
                   
                   d. Using the validation set approach to select a polynomial term
                   
                   e. Using k-fold cross-validation to select a polynomial model
                   
                   f. Plotting the linear polynomial regression model
                   

-  "3 - subset selection.R"

    Description:  Linear model selection using best subset selection and forward and backward stepwise regression
    
    Sub-sections:  
    
                   a. Best subset selection
                   
                   b. Forward stepwise selection
                   
                   c. Backward stepwise selection
                   
                   d. Choosing a model using the validation set approach
                   
                   e. Choosing a model using 10-fold cross-validation
                 

-  "4 - ridge regression and lasso.R"
    
    Description:  Shrinkage in linear models using ridge regression and lasso 
    
    Sub-sections:  
    
                   a. Ridge regression
                   
                   b. Ridge regression with cross-validation
                   
                   c. Lasso
                   
                   d. Lasso with cross-validation
                   

-  "5 - PCR and PLC.R"
    
    Description:  Dimension reduction in linear models using principal components regression and partial least squares 
    
    Sub-sections:  
    
                   a. Principal components regression (PCR)
                   
                   b. PCR with cross-validation
                   
                   c. Partial least squares (PLS) with cross-validation
                   
                   
-  "6 - logistic regression.R"
    
    Description:  Categorization using logistic regression and logistic polynomial regression, with cross-validation 
    
    Sub-sections:  
    
                   a. Logistic regression
                   
                   b. Logistic regression with cross-validation
                   
                   c. Logistic polynomial regression
                   
                   d. Logistic polynomial regression with the validation set approach
                   
                   e. Plotting the logistic polynomial regression model
                                     
                   
-  "7 - LDA, QDA, and KNN.R"
    
    Description:  Linear discriminant analysis, quadratic discriminant analysis, and k-nearest neighbors for categorization 
    
    Sub-sections:  
    
                   a. Linear Discriminant Analysis (LDA)
                   
                   b. Quadratic Discriminant Analysis (QDA)
                   
                   c. K-Nearest Neighbors (KNN)
                                     
                   
-  "8 - decision trees.R"
    
    Description:  Decision trees for regression and classification, including bagging, random forests, and boosting
    
    Sub-sections:  
    
                   a. Classification trees
                   
                   b. Regression trees
                   
                   c. Bagging and random forests
                   
                   d. Boosting
                   
                   
-  "9 - support vector machines.R"
    
    Description:  Support vector classifiers and support vector machines for classification
    
    Sub-sections:  
    
                   a. Support vector classifiers
                   
                   b. Support vector machines
                   

-  "10 - unsupervised learning.R"

     Description:  Unsupervised learning methods, including principal components analysis (PCA), k-means clustering, and hierarchical clustering
     
     Sub-sections:  
    
                   a. Principal components analysis (PCA)
                   
                   b. K-means clustering
                   
                   c. Hierarchical clustering
                   
                
