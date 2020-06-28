clear all;
%read the cropped image
cropedImage = imread('cropedImage.png');
figure;
imshow(cropedImage);
title('Croped Image');

%read the joker image
jokerImage = imread('jokerimage.png');
figure;
imshow(jokerImage);
title('Image of Joker');

%convert images to gray scale
cropedGRAY = rgb2gray(cropedImage);
jokerGRAY = rgb2gray(jokerImage);

%detect features of the cigarette and the joker
cigarette = detectSURFFeatures(cropedGRAY);
joker = detectSURFFeatures(jokerGRAY);

%plot the strongest points
figure;
imshow(cropedGRAY);
title('100 Strongest Feature Points from Box Image');
hold on;
plot(selectStrongest(cigarette, 100));

figure;
imshow(jokerGRAY);
title('300 Strongest Feature Points from Scene Image');
hold on;
plot(selectStrongest(joker, 300));

%extract feature descriptors
[boxFeatures, cigarette] = extractFeatures(cropedGRAY, cigarette);
[sceneFeatures, joker] = extractFeatures(jokerGRAY, joker);

%match the features using descriptors and plot them
boxPairs = matchFeatures(boxFeatures, sceneFeatures);

matchedBoxPoints = cigarette(boxPairs(:, 1), :);
matchedScenePoints = joker(boxPairs(:, 2), :);
figure;
showMatchedFeatures(cropedGRAY, jokerGRAY, matchedBoxPoints, matchedScenePoints, 'montage');
title('Putatively Matched Points (Including Outliers)');

%locate points and get the coordinates
[tform, inlierBoxPoints, inlierScenePoints] = estimateGeometricTransform(matchedBoxPoints, matchedScenePoints, 'affine');
figure;
showMatchedFeatures(cropedGRAY, jokerGRAY, inlierBoxPoints, inlierScenePoints, 'montage');
title('Matched Points (Inliers Only)');

boxPolygon = [1, 1;...                           % top-left
        size(cropedImage, 2), 1;...                 % top-right
        size(cropedImage, 2), size(cropedImage, 1);... % bottom-right
        1, size(cropedImage, 1);...                 % bottom-left
        1, 1];                   % top-left again to close the polygon

newBoxPolygon = transformPointsForward(tform, boxPolygon);

figure;
imshow(jokerGRAY);
hold on;
line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), 'Color', 'y');
title('Detected Box');

%read the flower image
figure;
flowerImage = imread('rose.png');

imshow(flowerImage);
title('Flower Image');

%declare boundaries
x_upperBound = uint16(max(newBoxPolygon(:, 2)));
x_lowerBound = uint16(min(newBoxPolygon(:, 2)));
y_upperBound = uint16(max(newBoxPolygon(:, 1)));
y_lowerBound = uint16(min(newBoxPolygon(:, 1)));

%replace selected coordinates with the flower image
figure;
jokerImage(x_lowerBound:x_upperBound, y_lowerBound:y_upperBound, :) = flowerImage;
imshow(jokerImage);
title('New Image of Joker');
imwrite(jokerImage, 'newJoker.png');
