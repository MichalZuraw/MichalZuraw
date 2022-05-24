clear all
clc
close all
% Obrazy
im1G = imread('MG.png');
im1C = imread('MC.png');
im2G = imread('DG.png');
im2C = imread('DC.png');
% Szum 1%
im1Gsp1 = imnoise(im1G,'salt & pepper',0.01);
im1Csp1 = imnoise(im1C,'salt & pepper',0.01);
im2Gsp1 = imnoise(im2G,'salt & pepper',0.01);
im2Csp1 = imnoise(im2C,'salt & pepper',0.01);
% Szum 2%
im1Gsp2 = imnoise(im1G,'salt & pepper',0.02);
im1Csp2 = imnoise(im1C,'salt & pepper',0.02);
im2Gsp2 = imnoise(im2G,'salt & pepper',0.02);
im2Csp2 = imnoise(im2C,'salt & pepper',0.02);
% Szum 10%
im1Gsp10 = imnoise(im1G,'salt & pepper',0.1);
im1Csp10 = imnoise(im1C,'salt & pepper',0.1);
im2Gsp10 = imnoise(im2G,'salt & pepper',0.1);
im2Csp10 = imnoise(im2C,'salt & pepper',0.1);
% CROP
im1c = imcrop(im1G,[50 50 150 150]);
im1c=imresize(im1c,3,'nearest');
im1sp1c = imcrop(im1Gsp1,[50 50 150 150]);
im1sp1c=imresize(im1sp1c,3,'nearest');
im1sp2c = imcrop(im1Gsp2,[50 50 150 150]);
im1sp2c=imresize(im1sp2c,3,'nearest');
im1sp10c = imcrop(im1Gsp10,[50 50 150 150]);
im1sp10c=imresize(im1sp10c,3,'nearest');

im2c = imcrop(im1C,[50 50 150 150]);
im2c=imresize(im2c,3,'nearest');
im2sp1c = imcrop(im1Csp1,[50 50 150 150]);
im2sp1c=imresize(im2sp1c,3,'nearest');
im2sp2c = imcrop(im1Csp2,[50 50 150 150]);
im2sp2c=imresize(im2sp2c,3,'nearest');
im2sp10c = imcrop(im1Csp10,[50 50 150 150]);
im2sp10c=imresize(im2sp10c,3,'nearest');

im3c = imcrop(im2G,[100 100 200 200]);
im3c=imresize(im3c,3,'nearest');
im3sp1c = imcrop(im2Gsp1,[100 100 200 200]);
im3sp1c=imresize(im3sp1c,3,'nearest');
im3sp2c = imcrop(im2Gsp2,[100 100 200 200]);
im3sp2c=imresize(im3sp2c,3,'nearest');
im3sp10c = imcrop(im2Gsp10,[100 100 200 200]);
im3sp10c=imresize(im3sp10c,3,'nearest');

im4c = imcrop(im2C,[100 100 200 200]);
im4c=imresize(im4c,3,'nearest');
im4sp1c = imcrop(im2Csp1,[100 100 200 200]);
im4sp1c=imresize(im4sp1c,3,'nearest');
im4sp2c = imcrop(im2Csp2,[100 100 200 200]);
im4sp2c=imresize(im4sp2c,3,'nearest');
im4sp10c = imcrop(im2Csp10,[100 100 200 200]);
im4sp10c=imresize(im4sp10c,3,'nearest');

imwrite(im1c,'im1c.png');
imwrite(im1sp1c,'im1sp1c.png');
imwrite(im1sp2c,'im1sp2c.png');
imwrite(im1sp10c,'im1sp10c.png');
imwrite(im2c,'im2c.png');
imwrite(im2sp1c,'im2sp1c.png');
imwrite(im2sp2c,'im2sp2c.png');
imwrite(im2sp10c,'im2sp10c.png');
imwrite(im3c,'im3c.png');
imwrite(im3sp1c,'im3sp1c.png');
imwrite(im3sp2c,'im3sp2c.png');
imwrite(im3sp10c,'im3sp10c.png');
imwrite(im4c,'im4c.png');
imwrite(im4sp1c,'im4sp1c.png');
imwrite(im4sp2c,'im4sp2c.png');
imwrite(im4sp10c,'im4sp10c.png');