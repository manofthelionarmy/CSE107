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

%storing the number of rows
mPrime = dimensions(1, 1);
%storing the number of columns
nPrime = dimensions(1, 2); 

%storing the dimensions of the input image
m = size(oldImage,1);
n = size(oldImage, 2); 
modifiedImage = uint8(zeros(mPrime-1, nPrime-1));

for i = 1:1:(mPrime)
    x = ((m / mPrime) * (i - 0.5)) + 0.5;
    m1 = 0;
    m2 = 0; 
    
    if mod(x,1) == 0
            m1 = x;
            m2 = x;
    else
        if x < 1
            m1 = 1;
            m2 = 2; 
        elseif x > m
            m1 = m - 1; 
            m2 = m;
        else
            m1 = floor(x);
            m2 = ceil(x);
        end
        
        
    end
    
   for j = 1:1: (nPrime)
        n1 = 0; 
        n2 = 0; 
        
    y = ((n / nPrime) * (j - 0.5)) + 0.5; 
        
    if mod(y,1) == 0
        n1 = y;
        n2 = y;
    else
       if y < 1
          n1 = 1;
          n2 = 2; 
       elseif y > n
          n1 = n -1; 
          n2 = n;
       else
          n1 = floor(y);
          n2 = ceil(y);
       end
       
       modifiedImage(i, j) = oldImage(m1, n1);
    end
   end
end

%shows the resutls
%figure, imshow(modifiedImage); 
%figure, imshow(oldImage); 

end

