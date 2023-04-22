# Import Data
training <- read.csv('https://raw.githubusercontent.com/selva86/datasets/master/iris_train.csv')
test <- read.csv('https://raw.githubusercontent.com/selva86/datasets/master/iris_test.csv')

# Using klaR for Naive Bayes
library(klaR)
# Convert Species variable to factor
training$Species <- as.factor(training$Species)
test$Species <- as.factor(test$Species)

nb_mod <- NaiveBayes(Species ~ ., data=training)
pred <- predict(nb_mod, test)