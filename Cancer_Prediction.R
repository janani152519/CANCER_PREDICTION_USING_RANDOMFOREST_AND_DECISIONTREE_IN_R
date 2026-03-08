# ==============================
# CANCER PREDICTION (Decision Tree + Random Forest)
# ==============================

# 1 Load required packages
packages <- c("caret", "rpart", "rpart.plot", "randomForest")
for(pkg in packages){
  if(!require(pkg, character.only = TRUE)){
    install.packages(pkg, dependencies = TRUE)
    library(pkg, character.only = TRUE)
  }
}

# 2 Load dataset
data <- read.csv("C:/Users/Janani Prakash/Downloads/data.csv", stringsAsFactors = FALSE)

# 3 Preprocess data
data$id <- NULL                            
data$diagnosis <- factor(data$diagnosis, levels = c("B","M"))

# Handle missing values by median imputation
preProc <- preProcess(data, method = "medianImpute")
data <- predict(preProc, data)

# 4️ Split data into train/test sets
set.seed(123)
trainIndex <- createDataPartition(data$diagnosis, p = 0.8, list = FALSE)
trainData <- data[trainIndex, ]
testData  <- data[-trainIndex, ]

# 5️ DECISION TREE
dt_model <- rpart(diagnosis ~ ., data = trainData, method = "class")
dt_pred  <- predict(dt_model, testData, type = "class")
dt_cm    <- confusionMatrix(dt_pred, testData$diagnosis)
cat("\n=== DECISION TREE RESULTS ===\n")
print(dt_cm)

# rpart.plot(dt_model, main = "Decision Tree")
trainData$X <- NULL
testData$X  <- NULL


# 6️ RANDOM FOREST
set.seed(123)
rf_model <- randomForest(diagnosis ~ ., data = trainData, ntree = 200)
rf_pred  <- predict(rf_model, testData)
rf_cm    <- confusionMatrix(rf_pred, testData$diagnosis)
cat("\n=== RANDOM FOREST RESULTS ===\n")
print(rf_cm)

# ---- COMPARE ACCURACY AND PRINT BEST MODEL ----
dt_acc <- dt_cm$overall['Accuracy']
rf_acc <- rf_cm$overall['Accuracy']

cat("\n--- Best Model ---\n")
if (rf_acc > dt_acc) {
  cat("Random Forest is the best model with Accuracy =", round(rf_acc, 4), "\n")
} else {
  cat("Decision Tree is the best model with Accuracy =", round(dt_acc, 4), "\n")
}