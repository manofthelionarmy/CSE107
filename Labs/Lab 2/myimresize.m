function modifiedImage = myimresize(img, dimensions, input)
%myimresize Converts a grayscale image to a binary image by using binary
%         dot patterns to render grayscale values.
%
%Syntax:
%
% modifiedImage myimresize(image, size, input)
%
%Input:
%
% image = the grayscale image file to be resized. 
%
% size  = a vector with 2 elements. The 1st element is the number of rows
%         for the resized image. The 2nd element is the number of columns
%         for the resized image. 
%
% input = the string value 'nearest' or 'bilinear'
%
%Output:
%   modifiedImage = the grayscale, resized image. 
%
%History:
% A.Leon    10/6/2017   created


%store the value
oldImage = img; 

%if are resizing, we just want to check if oldImage is a string or a matrix

checkIfString = ischar(oldImage); 

%if it is, we store the pixel values from image file 
if checkIfString
    
    oldImage = imread(img);    
end

if strcmp(input,'nearest') == 0
    modifiedImage = nearestNeighbor(oldImage, dimensions);
elseif strcmp(input, 'bilinear') == 0
    modifiedImage = mybilinear(oldImage, dimensions);
end

%shows the resutls
figure, imshow(modifiedImage); 
%figure, imshow(oldImage); 

end

