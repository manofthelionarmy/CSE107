function modifiedImage = equalize(img)

    histogram = compute_histogram(img);

    plot_histogram(histogram);
    
    transform = histogram_transform(histogram);
    
    checkifString = ischar(img);

    if checkifString 
        oldImage = imread(img);
    end

    m = size(oldImage,1);
    n = size(oldImage, 2); 
    
    %always, always have the ModifiedImage casted to uint8!!!!!!!
    modifiedImage = uint8(zeros(m,n));
    
    for i=1: m
        for j=1: n
                
             index = oldImage(i,j);
             
             if index == 0
                index = 1;
             end
             
             value = transform(1, index+1);
             modifiedImage(i,j) = value;

              
        end
    end
    
    equalized_histogram = compute_histogram(modifiedImage);
    plot_histogram(equalized_histogram);
    
    figure, imshow(oldImage);
    figure, imshow(modifiedImage);
    
    input_mean = mean(double(oldImage(:)));
    input_std = std(double(oldImage(:)));
    
    fprintf('mean: %.2f\nstd deviation: %.2f\n', input_mean, input_std);
    
    equalized_mean = mean(double(modifiedImage(:)));
    equalized_std = std(double(modifiedImage(:)));
    
    fprintf('mean: %.2f\nstd deviation: %.2f\n', equalized_mean, equalized_std);

return 