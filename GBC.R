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


# Confusion Matrix
tab <- table(pred$class, test$Species)
caret::confusionMatrix(tab)  

# Plot density of each feature using nb_mod
opar = par(mfrow=c(2, 2), mar=c(4,0,0,0))
plot(nb_mod, main="")  
par(opar)

# Plot the Confusion Matrix
library(ggplot2)
test$pred <- pred$class
ggplot(test, aes(Species, pred, color = Species)) +
  geom_jitter(width = 0.2, height = 0.1, size=2) +
  labs(title="Confusion Matrix", 
       subtitle="Predicted vs. Observed from Iris dataset", 
       y="Predicted", 
       x="Truth",
       caption="Naive Bayes Clasifier")