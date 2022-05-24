function [R,G,B] = seperate(im)
im=double(im);
M = size(im, 1);
N = size(im, 2);
red_mask = repmat([0 0; 0 1], M/2, N/2);
green_mask = repmat([0 1; 1 0], M/2, N/2);
blue_mask = repmat([1 0; 0 0], M/2, N/2);
R=im.*red_mask;
G=im.*green_mask;
B=im.*blue_mask;
end