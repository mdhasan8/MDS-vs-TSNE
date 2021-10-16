# MDS-vs-TSNE
In this project, I applied the unspervised machine learning techniques of Principal Component Analysis, Multi-Dimensional Scaling, and t-SNE methods using the Handwritten Digits dataset from UCI Machine Learning Repository. I found that both PCA and MDS could identify the digits clusters but cannot separate them well as tSNE does. 

![image](https://user-images.githubusercontent.com/52440384/137576537-31be346f-24ca-4e6b-a3cb-a01082487b60.png)

From the above figure we can see that digit 2 and digit 3, digit 7 and digit 9 are too close and digit 2 and digit 4 are not close. Digit 9 is available in the center. There is a pattern for all the digits to exists in a group.

![image](https://user-images.githubusercontent.com/52440384/137576549-533b9999-7675-42c7-9ae0-f7cf01f49338.png)

This non MDS method did not set different digit apart. There is a pattern for all the digits to exists in a group. We can see that digit 5, digit 9 digit 2, and digit 1 are too close and digit 3 and digit 4, and digit 6 and digit 7 are not too close.

![image](https://user-images.githubusercontent.com/52440384/137576562-480d3aed-f3ed-4fc6-9a0a-4da67894efeb.png)

This tSNE plot illustrates that each different digit makes different cluster and within cluster they are similar but between clusters they are different. The similarity within cluster and dissimilarity between clusters is more previous figures.
