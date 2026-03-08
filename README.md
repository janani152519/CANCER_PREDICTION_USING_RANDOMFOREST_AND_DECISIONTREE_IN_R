# Breast Cancer Diagnosis Prediction

Predicts breast cancer diagnosis (Benign/Malignant) using Decision Tree and Random Forest, then selects the best model based on accuracy.

## Description
This R project trains two models—Decision Tree and Random Forest—on a breast cancer dataset, compares their performance, and prints the best model along with its accuracy.

## Features
- Handles missing or irrelevant data columns.
- Trains Decision Tree and Random Forest models.
- Evaluates using confusion matrix, accuracy, sensitivity, specificity, and Kappa.
- Automatically selects and prints the best-performing model.

## Requirements
- R (version 4.0+ recommended)
- R packages: `caret`, `rpart`, `randomForest`

## Usage
1. Load your breast cancer dataset into R as `data`.
2. Remove unnecessary columns if needed (e.g., index column `X`).
3. Run the script to:
   - Train Decision Tree and Random Forest models.
   - Evaluate their performance on test data.
   - Print the best model based on accuracy.

```r
# Example
source("breast_cancer_model.R")
