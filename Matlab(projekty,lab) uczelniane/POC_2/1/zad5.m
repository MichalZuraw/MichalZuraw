close all
clear all
clc
im1G = imread('MC.png');
im1S1 = imnoise(im1G,'salt & pepper',0.01);
im1S2 = imnoise(im1G,'salt & pepper',0.02);
im1S10 = imnoise(im1G,'salt & pepper',0.1);

im1S1med = medianowakolor(im1S1);
im1S2med = medianowakolor(im1S2);
im1S10med = medianowakolor(im1S10);
im1mf1 = medfilt2(im1S1,[3,3]);
im1mf2 = medfilt2(im1S2,[3,3]);
im1mf10 = medfilt2(im1S10,[3,3]);

im1GC = imcrop(im1G,[50 50 150 150]);
im1S1C = imcrop(im1S1,[50 50 150 150]);
im1S2C = imcrop(im1S2,[50 50 150 150]);
im1S10C = imcrop(im1S10,[50 50 150 150]);

im1mft1c = imcrop(im1mf1,[50 50 150 150]);
im1mft2c = imcrop(im1mf2,[50 50 150 150]);
im1mft10c = imcrop(im1mf10,[50 50 150 150]);

im1med1c = imcrop(im1S1med,[50 50 150 150]);
im1med2c = imcrop(im1S2med,[50 50 150 150]);
im1med10c = imcrop(im1S10med,[50 50 150 150]);

imwrite(im1G,"zad4.png");
imwrite(im1S1,"zad4s1.png");
imwrite(im1S2,"zad4s2.png");
imwrite(im1S10,"zad4s10.png");
imwrite(im1med1c,"zad4s1m.png");
imwrite(im1med2c,"zad4s2m.png");
imwrite(im1med10c,"zad4s10m.png");

S1   = psnr(im1S1,im1G)
S2   = psnr(im1S2,im1G)
S10  = psnr(im1S10,im1G)
S1M  = psnr(im1med1c,im2G)
S2M  = psnr(im1med2c,im2G)
S10M = psnr(im1med10c,im2G)
