function modifiedImage = mybilinear(oldImage, dimensions)
%myimresize Converts a grayscale image to a binary image by using binary
%         dot patterns to render grayscale values.
%
%Syntax:
%
% modifiedIntensities mybilinear(oldImageLocations, modifiedImageLocations, oldImageIntensities)
%
%Input:
%
% oldImageLocations = the pixel locations from the input image 
%
% modifiedImageLocations = the desired pixel locations of the image we wish
%                          to fill 
%         
%
% oldImageIntensities = the intensity values from the pixel locations found
%                       in oldImageLocations
%
%Output:
%   modifiedIntensities = the new intensity values found from bilinear interpolation 
%
%History:
% A.Leon    10/6/2017   created

%storing the number of rows
mPrime = dimensions(1, 1);
%storing the number of columns
nPrime = dimensions(1, 2); 

%storing the dimensions of the input image
m = size(oldImage,1);
n = size(oldImage, 2); 
modifiedImage = uint8(zeros(mPrime, nPrime));

for i = 1:mPrime
    
   for j = 1: (nPrime)
   
    x = ((m / mPrime) * (i - 0.5)) + 0.5; 
    y = ((n / nPrime) * (j - 0.5)) + 0.5; 
    
    x1 = round(x,0);
    y1 = round(y,0);
    
    modifiedImage(i,j) = oldImage(x1,y1);
    
   end
end

return 