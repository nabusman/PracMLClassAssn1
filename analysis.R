# Load Data
training <- read.csv("pml-training.csv")
testing <- read.csv("pml-testing.csv")

# Process Training Data for Analysis
training$X <- NULL
training$user_name <- as.factor(training$user_name)
training$kurtosis_roll_belt <- as.numeric(training$kurtosis_roll_belt)
training$kurtosis_picth_belt <- as.numeric(training$kurtosis_picth_belt)
training$skewness_roll_belt <- as.numeric(training$skewness_roll_belt)
training$skewness_roll_belt.1 <- as.numeric(training$skewness_roll_belt.1)
training$max_yaw_belt <- as.numeric(training$max_yaw_belt )
training$min_yaw_belt <- as.numeric(training$min_yaw_belt)
training$amplitude_yaw_belt <- as.numeric(training$amplitude_yaw_belt)
training$kurtosis_roll_arm <- as.numeric(training$kurtosis_roll_arm)
training$kurtosis_picth_arm <- as.numeric(training$kurtosis_picth_arm)
training$kurtosis_yaw_arm <- as.numeric(training$kurtosis_yaw_arm)
training$skewness_roll_arm <- as.numeric(training$skewness_roll_arm)
training$skewness_pitch_arm <- as.numeric(training$skewness_pitch_arm)
training$skewness_yaw_arm <- as.numeric(training$skewness_yaw_arm)
training$kurtosis_yaw_arm <- as.numeric(training$kurtosis_yaw_arm)
training$kurtosis_roll_dumbbell <- as.numeric(training$kurtosis_roll_dumbbell)
training$kurtosis_picth_dumbbell <- as.numeric(training$kurtosis_picth_dumbbell)
training$skewness_roll_dumbbell <- as.numeric(training$skewness_roll_dumbbell)
training$skewness_pitch_dumbbell <- as.numeric(training$skewness_pitch_dumbbell)
training$kurtosis_yaw_belt <- as.numeric(training$kurtosis_yaw_belt)
training$skewness_yaw_belt <- as.numeric(training$skewness_yaw_belt)
training$kurtosis_yaw_dumbbell <- as.numeric(training$kurtosis_yaw_dumbbell)
training$skewness_yaw_dumbbell <- as.numeric(training$skewness_yaw_dumbbell)
training$max_yaw_dumbbell <- as.numeric(training$max_yaw_dumbbell)
training$min_yaw_dumbbell <- as.numeric(training$min_yaw_dumbbell)
training$amplitude_yaw_dumbbell <- as.numeric(training$amplitude_yaw_dumbbell)
training$kurtosis_roll_forearm <- as.numeric(training$kurtosis_roll_forearm)
training$kurtosis_picth_forearm <- as.numeric(training$kurtosis_picth_forearm)
training$kurtosis_yaw_forearm <- as.numeric(training$kurtosis_yaw_forearm)
training$skewness_roll_forearm <- as.numeric(training$skewness_roll_forearm)
training$skewness_pitch_forearm <- as.numeric(training$skewness_pitch_forearm)
training$skewness_yaw_forearm <- as.numeric(training$skewness_yaw_forearm)
training$max_yaw_forearm <- as.numeric(training$max_yaw_forearm)
training$min_yaw_forearm <- as.numeric(training$min_yaw_forearm)
training$amplitude_yaw_forearm <- as.numeric(training$amplitude_yaw_forearm)

# Apply the Same Processing to Test Data
testing$X <- NULL
testing$user_name <- as.factor(testing$user_name)
testing$kurtosis_roll_belt <- as.numeric(testing$kurtosis_roll_belt)
testing$kurtosis_picth_belt <- as.numeric(testing$kurtosis_picth_belt)
testing$skewness_roll_belt <- as.numeric(testing$skewness_roll_belt)
testing$skewness_roll_belt.1 <- as.numeric(testing$skewness_roll_belt.1)
testing$max_yaw_belt <- as.numeric(testing$max_yaw_belt )
testing$min_yaw_belt <- as.numeric(testing$min_yaw_belt)
testing$amplitude_yaw_belt <- as.numeric(testing$amplitude_yaw_belt)
testing$kurtosis_roll_arm <- as.numeric(testing$kurtosis_roll_arm)
testing$kurtosis_picth_arm <- as.numeric(testing$kurtosis_picth_arm)
testing$kurtosis_yaw_arm <- as.numeric(testing$kurtosis_yaw_arm)
testing$skewness_roll_arm <- as.numeric(testing$skewness_roll_arm)
testing$skewness_pitch_arm <- as.numeric(testing$skewness_pitch_arm)
testing$skewness_yaw_arm <- as.numeric(testing$skewness_yaw_arm)
testing$kurtosis_yaw_arm <- as.numeric(testing$kurtosis_yaw_arm)
testing$kurtosis_roll_dumbbell <- as.numeric(testing$kurtosis_roll_dumbbell)
testing$kurtosis_picth_dumbbell <- as.numeric(testing$kurtosis_picth_dumbbell)
testing$skewness_roll_dumbbell <- as.numeric(testing$skewness_roll_dumbbell)
testing$skewness_pitch_dumbbell <- as.numeric(testing$skewness_pitch_dumbbell)
testing$kurtosis_yaw_belt <- as.numeric(testing$kurtosis_yaw_belt)
testing$skewness_yaw_belt <- as.numeric(testing$skewness_yaw_belt)
testing$kurtosis_yaw_dumbbell <- as.numeric(testing$kurtosis_yaw_dumbbell)
testing$skewness_yaw_dumbbell <- as.numeric(testing$skewness_yaw_dumbbell)
testing$max_yaw_dumbbell <- as.numeric(testing$max_yaw_dumbbell)
testing$min_yaw_dumbbell <- as.numeric(testing$min_yaw_dumbbell)
testing$amplitude_yaw_dumbbell <- as.numeric(testing$amplitude_yaw_dumbbell)
testing$kurtosis_roll_forearm <- as.numeric(testing$kurtosis_roll_forearm)
testing$kurtosis_picth_forearm <- as.numeric(testing$kurtosis_picth_forearm)
testing$kurtosis_yaw_forearm <- as.numeric(testing$kurtosis_yaw_forearm)
testing$skewness_roll_forearm <- as.numeric(testing$skewness_roll_forearm)
testing$skewness_pitch_forearm <- as.numeric(testing$skewness_pitch_forearm)
testing$skewness_yaw_forearm <- as.numeric(testing$skewness_yaw_forearm)
testing$max_yaw_forearm <- as.numeric(testing$max_yaw_forearm)
testing$min_yaw_forearm <- as.numeric(testing$min_yaw_forearm)
testing$amplitude_yaw_forearm <- as.numeric(testing$amplitude_yaw_forearm)

# Data Exploration
library(corrplot)
corrSubset <- subset(training[,sapply(training,is.numeric)], 
                     select = -c(kurtosis_yaw_belt, 
                                 skewness_yaw_belt, 
                                 kurtosis_yaw_dumbbell, 
                                 skewness_yaw_dumbbell, 
                                 kurtosis_yaw_forearm, 
                                 skewness_yaw_forearm))
correlation <- cor(corrSubset, use = "na.or.complete")
corrplot(correlation, order = "hclust", tl.pos = "n")

classeCor <- sapply(names(corrSubset), function(col) {
    cor(corrSubset[,col], as.numeric(training$classe))
})
classeCor <- classeCor[!is.na(classeCor)]
classeCor <- classeCor[abs(classeCor) >= 0.05]
classeCor <- classeCor[order(abs(classeCor), decreasing = TRUE)]
correlatedVars <- names(classeCor)

# Data Modeling
library(caret)
library(doMC)
registerDoMC()
set.seed(1031)

controlObject <- trainControl(method = "cv", number = 10, verboseIter=TRUE)

## CART Model Using Highly Correlated Variables
cartModelCorVar <- train(x = subset(training, select = correlatedVars),
                         y = training$classe,
                         method = "rpart",
                         trControl = controlObject)
print(cartModelCorVar)

## CART Model Using All Variables
cartModel <- train(x = subset(training, select = -classe),
                   y = training$classe,
                   method = "rpart",
                   trControl = controlObject)
print(cartModel)

## Bagged CART Model Using Highly Correlated Variables
baggedCartModel <- train(x = subset(training, select = correlatedVars),
                         y = training$classe,
                         method = "treebag",
                         trControl = controlObject)
print(baggedCartModel)

# Data Prediction

predictions <- predict(baggedCartModel, newdata = testing)
