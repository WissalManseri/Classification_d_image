# Classification of shapes using wavelets and K-nearest neighbors :

This is a MATLAB project that uses wavelet transforms and K-nearest neighbors classification to identify shapes in images. The project consists of the following steps:

1. Load training and test images: The code assumes that there are two image files named 'formes_train.jpg' and 'formes_test.jpg' in the same directory as the MATLAB script.

2. Convert images to grayscale: The code uses the 'rgb2gray' function to convert the loaded images to grayscale.

3. Apply Haar wavelet transform: The code uses the 'wavedec2' function to apply a 2-level Haar wavelet transform to the grayscale training image.

4. Select significant wavelet coefficients: The code sets a threshold based on 5% of the maximum absolute value of the wavelet coefficients and sets to zero all coefficients with absolute value below the threshold.

5. Reconstruct image from filtered coefficients: The code uses the 'waverec2' function to reconstruct the filtered image from the selected wavelet coefficients.

6. Extract shape features: The code uses the 'regionprops' function to extract shape features from the filtered image. Specifically, it computes the area, perimeter, and bounding box of each connected component with pixel values above 0.5.

7. Save features to a data matrix: The code saves the extracted shape features to a data matrix, where each row corresponds to a different shape and the columns correspond to the area and perimeter of the shape.

8. Apply same procedure to test image: The code applies the same procedure as steps 3-7 to the grayscale test image.

9. Train K-nearest neighbors classifier: The code uses the 'fitcknn' function to train a K-nearest neighbors classifier on the training data. Specifically, it sets the number of neighbors to 3 and assigns a label of 1 to the first 5 shapes in the training data and a label of 2 to the remaining 5 shapes.

10. Predict labels of test data: The code uses the 'predict' function to predict the labels of the test data using the trained K-nearest neighbors classifier.

11. Display test images with predicted labels: The code displays the original test image and the filtered test image side-by-side using the 'subplot' and 'imshow' functions. It also displays the predicted labels as text on top of the filtered test image using the 'text' function.

# how to use
To run the code, simply save the MATLAB script and the two image files in the same directory and run the script in MATLAB. Note that the code assumes that the Image Processing Toolbox and the Statistics and Machine Learning Toolbox are installed in MATLAB.

# License
This project is licensed under the MIT License. You can read the full license in the LICENSE file.
