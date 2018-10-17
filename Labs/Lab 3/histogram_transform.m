function transform = histogram_transform(histogram)

L = 256; 
transform = zeros(1, 256); 

s0 = histogram(1, 1) * (L-1);
for i=2: L
     
    transform(1, i) =  round(s0 + (L-1)*histogram(1,i));
    
    s0 = histogram(1, i) * (L-1);
end
return