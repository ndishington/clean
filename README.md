The run_analysis.R script creates a summary of the dataset supplied by a study of 30 subjects 
performing activities while carrying a smartphone. The original data can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The script takes the following input files:

./test/X_test.txt
./test/y_test.txt
./test/subject_test.txt
./train/X_train.txt
./train/y_train.txt
./train/subject_train.txt
./features.txt
./activity_labels.txt

These are all provided in the download of the dataset from the above website. After downloading 
the dataset, unzip it and set the working directory to the directory you downloaded the Dataset.

The script creates an output file called results.txt. This contains the mean of all the mean and 
standard deviation measurements in the dataset files group by activity and subject.
