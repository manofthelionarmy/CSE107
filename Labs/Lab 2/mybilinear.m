function modifiedIntensities = mybilinear(oldImageLocations, modifiedImageLocations, oldImageIntensities)
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

    %holds the coefficient values
    coefficients = []; 
    
    %needed to convert the values to double
    x1 = double(oldImageLocations(1,1)); 
    x2 = double(oldImageLocations(2,1)); 
    x3 = double(oldImageLocations(3,1)); 
    x4 = double(oldImageLocations(4, 1)); 
    
    %needed to convert the values to double
    y1 = double(oldImageLocations(1,2)); 
    y2 = double(oldImageLocations(2,2)); 
    y3 = double(oldImageLocations(3,2)); 
    y4 = double(oldImageLocations(4,2)); 
    
    %needed to calculate these values
    x1y1 = double(x1 * y1); 
    x2y2 = double(x2 * y2); 
    x3y3 = double(x3 * y3); 
    x4y4 = double(x3 * y4); 
    
    %storing values into a matrix
    A = [x1, y1, x1y1, 1.0; x2, y2, x2y2, 1.0; x3, y3, x3y3, 1.0; x4, y4, x4y4, 1.0]; 
    
    %calculating th coefficients by multiplying inverse matrix by matrix
    %containing the input image intensities
    coefficients = A \ double(oldImageIntensities); 
    
    %we needed to take the transpose
    coefficients = transpose(coefficients); 
    
    %storing the coefficient values
    a = coefficients(1); 
    b = coefficients(2); 
    c = coefficients(3); 
    d = coefficients(4); 
    
    %where we would like to caculate the intensities
    xPrime = modifiedImageLocations(1); 
    yPrime = modifiedImageLocations(2); 
    
    %calculating the intensity values for the outuput image
    modifiedIntensities = ceil(((a * xPrime) + (b * yPrime) + (c * xPrime * yPrime) + d));  
    
end