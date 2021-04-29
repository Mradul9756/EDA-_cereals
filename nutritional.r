########################################################################################
# program: Training.r
# author: Mradul Mourya
# purpose: The purpose of this exercise in R is to demonstrate why we don't recommend 
# deleting any outliers during the EDA stage. The reason we don't do this is because it 
# changes the nature of our data set.
########################################################################################

# install the ggplot pacakages for plotting graphs
install.packages("ggplot2")

library(ggplot2)

# setting the path
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# read in the training data set as training_data
training_data <- read.csv("/Users/mmourya23/Documents/Intro to Data Science/LM3/training.csv")

# Standardize numeric fields using R
# Scale will center the variable by subtracting the mean
# and scale it by dividing by the standard deviation
# also creates new column in the data set named capital.loss_z
training_data$capital.loss_z <- scale(x = training_data$capital.loss)

# identify the outliers in the capital-loss
capital.loss_outliers <- training_data[ which(training_data$capital.loss_z < -3 | training_data$capital.loss_z > 3), ]

# displaying the capital-loss outliers
capital.loss_outliers ##There are total 679 capital_loss outliers

# make a bar graph of the Income variable for the outliers data set you created in step 1
ggplot(capital.loss_outliers, aes(income)) + geom_bar() + coord_flip()

# make a bar graph of the Income variable for the entire data set as whole
ggplot(training_data, aes(income)) + geom_bar() + coord_flip()

# Conclusion:
   ## Diffrences between both the graphs: In the outliers data set, around 350 people earn more than 50K a year and around 325 people earn less than or equal
   ## to 50K a year. However, in the entire data set, around 4000 people earn more than 50K a year and around 11000 people fall in the bracket of less than or 
   ## equal to 50K a year. As we can see, in the outliers data set the distribution is roughly the same but in the entire data set, there’s a huge difference.

# Outliers:
   ## If we were to delete the outliers, the gap between the people who earns 50K or less and the people who earn more than 50K would increase. Also, we would not
   ## be considering people who have lost their capital which could results in the skew and other variability issues. At the EDA stage, out should not be removed 
   ## because it normalized in the data and does not provide a complete analysis.      
