% modifiedImage1 = myimresize('Lab_02_image1.tif', [425,600], 'nearest');
% modifiedImage2 = myimresize(modifiedImage1, [300,300], 'nearest');
% 
% modifiedImage3 = myimresize('Lab_02_image1.tif', [40,75], 'nearest');
% modifiedImage4 = myimresize(modifiedImage3, [300,300], 'nearest');



modifiedImage5 = myimresize('Lab_02_image1.tif', [425,600], 'bilinear');
modifiedImage6 = myimresize(modifiedImage5, [300,300], 'bilinear');

modifiedImage7 = myimresize('Lab_02_image1.tif', [40,75], 'bilinear');
modifiedImage8 = myimresize(modifiedImage7, [300,300], 'bilinear');