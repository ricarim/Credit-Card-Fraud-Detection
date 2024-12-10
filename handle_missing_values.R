library(VIM)
setwd("~/Desktop/uni/mestrado/fraude/project/")
data <- read.csv("X_train_with_missing_values.csv", na.strings = c("NA", "?", ""))

numeric_cols <- sapply(data, is.numeric)

scaling_params <- data.frame(
     mean = sapply(data[, numeric_cols], mean, na.rm = TRUE),
     sd = sapply(data[, numeric_cols], sd, na.rm = TRUE)
 )


data[numeric_cols] <- scale(data[numeric_cols])
data_imputed <- kNN(data, k = 5)
data_imputed <- data_imputed[, !grepl("_imp", names(data_imputed))]

for (col in names(data)[numeric_cols]) {
     data_imputed[[col]] <- (data_imputed[[col]] * scaling_params[col, "sd"]) + scaling_params[col, "mean"]
 }
write.csv(data_imputed, "X_train_without_missing_values.csv", row.names = FALSE, quote = FALSE)


