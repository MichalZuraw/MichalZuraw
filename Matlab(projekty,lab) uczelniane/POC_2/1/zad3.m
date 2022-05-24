close all
clear all
clc
% WCZYTYWANIE OBRAZOW
im1G = imread('MG.png');
im2G = imread('DG.png');
im1S3 = imnoise(im1G,'salt & pepper',0.03);
im2S1 = imnoise(im2G,'salt & pepper',0.01);

im1S3med3 = mediana(im1S3,3);
im2S1med3 = mediana(im2S1,3);
im1mf3 = medfilt2(im1S3,[3,3]);
im2mf3 = medfilt2(im2S1,[3,3]);

im1S3med5 = mediana(im1S3,5);
im2S1med5 = mediana(im2S1,5);
im1mf5 = medfilt2(im1S3,[5,5]);
im2mf5 = medfilt2(im2S1,[5,5]);

im1S3med7 = mediana(im1S3,7);
im2S1med7 = mediana(im2S1,7);
im1mf7 = medfilt2(im1S3,[7,7]);
im2mf7 = medfilt2(im2S1,[7,7]);
% CROP
im1GC = imcrop(im1G,[50 50 150 150]);
im2GC = imcrop(im2G,[100 100 200 200]);
im1S3C = imcrop(im1S3,[50 50 150 150]);
im2S1C = imcrop(im2S1,[100 100 200 200]);

im1med3c = imcrop(im1S3med3,[50 50 150 150]);
im1medflt3c = imcrop(im1mf3,[50 50 150 150]);
im2med3c = imcrop(im2S1med3,[100 100 200 200]);
im2medflt3c = imcrop(im2mf3,[100 100 200 200]);

im1med5c = imcrop(im1S3med5,[50 50 150 150]);
im1medflt5c = imcrop(im1mf5,[50 50 150 150]);
im2med5c = imcrop(im2S1med5,[100 100 200 200]);
im2medflt5c = imcrop(im2mf5,[100 100 200 200]);

im1med7c = imcrop(im1S3med7,[50 50 150 150]);
im1medflt7c = imcrop(im1mf7,[50 50 150 150]);
im2med7c = imcrop(im2S1med7,[100 100 200 200]);
im2medflt7c = imcrop(im2mf7,[100 100 200 200]);

imwrite(im1GC,"zad2im1.png");
imwrite(im2GC,"zad2im2.png");
imwrite(im1S3C,"zad2im1c.png");
imwrite(im2S1C,"zad2im2c.png");
imwrite(im1med3c,"zad2im1med3c.png");
imwrite(im2med3c,"zad2im2med3c.png");
imwrite(im1med5c,"zad2im1med5c.png");
imwrite(im2med5c,"zad2im2med5c.png");
imwrite(im1med7c,"zad2im1med7c.png");
imwrite(im2med7c,"zad2im2med7c.png");


O1S  = psnr(im1S3,im1G)
O1M3 = psnr(im1S3med3,im1G)
O1M5 = psnr(im1S3med5,im1G)
O1M7 = psnr(im1S3med7,im1G)

O2S  = psnr(im2S1,im2G)
O2M3 = psnr(im2S1med3,im2G)
O2M5 = psnr(im2S1med5,im2G)
O2M7 = psnr(im2S1med7,im2G)

