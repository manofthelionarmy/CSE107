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
        
        m1 = 0;
        m2 = 0; 
        n1 = 0; 
        n2 = 0; 
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
        
        p1 = (oldImage(m1, n1));
        p2 = (oldImage(m1, n2));
        p3 = (oldImage(m2, n1));
        p4 = (oldImage(m2, n2));
        
        ratio1 = ((x - m1)/(m2 -m1));
        
        difference1 = double((p3 - p1));
        pPrime1 = ((difference1 * ratio1) + double(p1));
        
        difference2 = double((p4 - p2)); 
        pPrime2 = ((difference2 * ratio1) + double(p2)); 
        
       
        ratio2 = (y - n1) / (n2 - n1);
        difference3 = double((pPrime2 - pPrime1));
        p = ((difference3 * ratio2) + pPrime1);
        
        p = round(p,0);
        modifiedImage(i,j) = p;

        end
    end
end
    
return