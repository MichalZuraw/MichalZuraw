close all
clear all
clc
%im1G = imread('MG.png');
im2G = imread('DG.png');
%im1S3 = imnoise(im1G,'salt & pepper',0.01);
im2S1 = imnoise(im2G,'salt & pepper',0.01);
%im1L = LUMFilter(im1S3,5,3);
im2L = LUMFilter(im2S1,5,3);
%im1C = imcrop(im1L,[50 50 150 150]);
im2C = imcrop(im2L,[50 50 150 150]);
%imwrite(im1C,"5x5malpa.png");
imwrite(im2C,"5x5dom.png");
%O1S  = psnr(im1L,im1G)
imshow(im2C)
O1M3 = psnr(im2L,im2G)



