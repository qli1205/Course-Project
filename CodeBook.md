**Variables in the Ouput Data**
- *Activity*        - the descriptive names of the activity
- *Activity Label*  - the label for the 6 activities
                    - 1 Walking
                    - 2 Walking Upstair
                    - 3 Walking Downstair
                    - 4 sitting
                    - 5 Standing
                    - 6 Laying
- *Subject*         - subject identities, who performed the activity

- Feature Names Rules    
    time domain signals (prefix 't' to denote time)
    fequency domain signals (prefix 'f' to denote time)
    body acceleration signal (labeled in the name with "Body")
    gravity acceleration signal (labeled in the name with "Gravity")
    accelerometer data (labeled in the name with "Acc")
    gyroscope data (labeled in the name with "Gyro")
    body linear acceleration in Jerk Signals (labeled in the name with "BodyAccJerk")
    body angular velocity in Jerk Signals (labeled in the name with "BodyGyroJerk")
    magnitude in Euclidean norm (labeled in the name with "Mag")
    -XYZ is used to denote 3-axial signals in the X, Y and Z directions



**Variables in Code**
- *x_train*         the data loaded from /train/X_train.txt, feature data for training
- *y_train*         the data loaded from /train/Y_train.txt, activity label data for training
- *sub_train*       the data loaded from /train/subject_traing.txt, the subject identity data for training

- *x_test*          the data loaded from /test/X_test.txt, feature data for testing
- *y_test*          the data loaded from /test/Y_test.txt, activity label data for testing
- *sub_test*        the data loaded from /test/subject_test.txt, the subject identity data for testing

- *features*        the data loaded from /features.txt, the name of the 561 features

- *x_all*           the merged feature data
- *y_all*           the merged activity label data
- *sub_all*         the merged subject data

- *data_all*        the merged data set from training and testing, including activity label, subject and feature data
- *mean_std_index*  the index of the variables with "mean()" or "std()"
- *data_sub*        the extracted dataset from data_all, with the variables only for mean() and std()

- *v_names*         the descriptive variable name, basically are the original variable in features, but without all the "()"

- *ave_data_sub*    the tidy data set with average of each variable for each activity and each subject
