function rmse =  myRMSE(x,y)
%myimresize Converts a grayscale image to a binary image by using binary
%         dot patterns to render grayscale values.
%
%Syntax:
%
% rmse = myRMSE(x, y)
%
%Input:
%
% x = image 1 
%
% y = image 2 
%
%
%Output:
%   rmse = root mean square error 
%
%History:
% A.Leon    10/6/2017   created

%storing the dimensions of image 1
M = size(x, 1);
N = size(x, 2); 

%checking just in case the dimensions of image 2 are the same as image 1
if size(y,1) ~= M || size(y,2) ~= N
    rmse = -1; 
else
    rmse = 0 ;
    for i = 1: M
        for j = 1: N

            %sum up the ssquare difference
            rmse = rmse + (((double(x(i,j)) - double(y(i,j)))^2)); 
            %divide by the total number of pixels
            rmse = (1/M*N) * rmse;
            %take the square root
            rmse = sqrt(rmse);
        end
    end
    
     
   
    
end


end