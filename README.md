# run_analisis_r
Description of what the R code does to reach the result:
1) Export the files in txt format of the trainings, tests, activity labels and the subject who performed the activity.
2) combines the activity files, variables and subjects in a single data frame for both training and testing.
3) unifies training and tests in a single data frame.
4) change the name of each column to a more descriptive one: subjects, activities and the characteristics according to the features.txt file
5) Only the columns containing the words mean and standard deviation are extracted, as well as activity and subject.
6) the data frame is grouped by the activity and subject variables to generate a data frame grouped by these variables.
