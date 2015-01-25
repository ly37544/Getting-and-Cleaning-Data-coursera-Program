# Getting-and-Cleaning-Data-coursera-Program
The R script in the repo first load into R all dataset needed for analysis like X_train,y_train, subject_train, subject_test and so on. 
Then merge the train dataset and test dataset into one variable correspondingly.
Next map each column with correct names referred in the features.txt and specifically annotate the activity and subject columns with appropriate name.
Split the merged data according to subject and then compute the column means in terms of activity factor.
Rbind each result of last step into one tidy dataset of 180 * 68 dimensions.