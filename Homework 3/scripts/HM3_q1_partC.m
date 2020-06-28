clear all;
%read image with imread
image = imread('jokerimage.png');
%convert image to double
imageD=double(image);
%size of the image
[m,n,l] = size(imageD);
%define a new array for padding
imagePadding = zeros(m+2, n+2, l);
imagePadding(2:m+1, 2:n+1, :) = imageD;
%declare the kernel
%kernel = [1, 0, -1; 1, 0, -1; 1, 0, -1];
kernel = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
%define output image
output = zeros(m,n,l);
for k = 1:l
    for i = 2:m+1
        for j = 2:n+1
            row1 = i-1;
            row2 = i+1;
            col1 = j-1;
            col2 = j+1;
    
            subImage = imagePadding(row1:row2, col1:col2, k).*kernel;
            output(i-1, j-1, k) = sum(subImage(:));
        end
    end
end
%convert back to int
output=uint8(output);
imshow(output);
%write image with imwrite
imwrite(output, 'edges.png');