# 1. Baixar e descompactar os dados
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "dataset.zip", method = "curl")
unzip("dataset.zip")

# 2. Ler os dados
features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$V2)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$V2)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")

# 3. Combinar os dados
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
merged_data <- cbind(Subject, Y, X)

# 4. Extrair apenas médias e desvios padrão
tidy_data <- merged_data[, c(1, 2, grep("mean\\(\\)|std\\(\\)", names(merged_data)))]

# 5. Usar nomes descritivos para atividades
tidy_data$activity <- activities[tidy_data$activity, 2]

# 6. Renomear variáveis com nomes descritivos
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))

# 7. Criar segundo conjunto de dados com médias por atividade e sujeito
library(dplyr)
final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# 8. Salvar o resultado
write.table(final_data, "tidy_dataset.txt", row.name = FALSE)
