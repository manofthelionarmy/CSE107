function histogram = compute_histogram(img)

oldImage = img;

checkifString = ischar(oldImage);

if checkifString 
    oldImage = imread(oldImage);
end

m = size(oldImage,1);
n = size(oldImage, 2); 

histogram = double(zeros(1, 256));

for i=1: m

    for j=1: n
        index = oldImage(i,j);
        histogram(1, (index + 1)) = histogram(1, (index + 1)) + 1; 
    end
end 

histogram = histogram / (m*n);
return; 