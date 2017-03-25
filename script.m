%%%%%%%%%%%%%%%%%%%
%% Shayan Fazeli %%
%% 91102171      %%
%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 2                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In this question we were asked to implement one of other ideas
% that was discussed in the class. I choose "blending":

%preparing the script:
clear all;
close all;
clc;

%reading the pictures (ought to be grayscale):
im1 = (imread('img1.jpg'));
im2 = (imread('img2.jpg'));

%making their sizes the same:
im2 = imresize(im2,size(im1));

%now we need to create the mask, as in the slides:
mask = ones(size(im1));
mask(:,1:floor(size(im1,2)/2)) = 0;
%now the mask is created, going on.

%first we have to assign the number of levels needed for blending:
number_of_levels = 9;
%(the value above has been computed by the number of number_of_levels that will
%leave nothing of the picture, this value can be computed using lg(minimum
%of both dimension), and by lg i mean logarithm with the base = 2.

%now setting other parameters:
deviation = 3;
blocksize = 10;
deviation_mask = 15;
block_mask=46;
%building the pyramids:
gaussian_pyramid1 = GP(im1, number_of_levels, deviation, blocksize);
laplacian_pyramid1 = laplacian_pyramid(gaussian_pyramid1);
gaussian_pyramid2 = GP(im2, number_of_levels, deviation, blocksize);
laplacian_pyramid2 = laplacian_pyramid(gaussian_pyramid2);
gaussian_mask = GP(mask, number_of_levels, deviation_mask, block_mask);

%now using them, we obtain the blended pyramid:
bPyramid = blending_pyramid(laplacian_pyramid1, laplacian_pyramid2, gaussian_mask);

output = collapse_the_tower(bPyramid);
imshow(output); title('result');
imwrite(output, 'result.jpg');

%The End












