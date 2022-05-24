close all
clear all
clc
im1G = imread('DG.png');
im1GS1 = imnoise(im1G,'salt & pepper',0.01);

im1L0 = lum2(im1GS1,0);
im1L1 = lum2(im1GS1,1);
im1L2 = lum2(im1GS1,2);
im1L3 = lum2(im1GS1,3);
im1L4 = lum2(im1GS1,4);
pssz = psnr(im1GS1,im1G)
ps0  = psnr(im1L0,im1G)
ps1  = psnr(im1L1,im1G)
ps2  = psnr(im1L2,im1G)
ps3  = psnr(im1L3,im1G)
ps4  = psnr(im1L4,im1G)

zad2b  = imcrop(im1G,[50 50 150 150]);
zad2bS  = imcrop(im1GS1,[50 50 150 150]);
zad2bL0 = imcrop(im1L0,[50 50 150 150]);
zad2bL1 = imcrop(im1L1,[50 50 150 150]);
zad2bL2 = imcrop(im1L2,[50 50 150 150]);
zad2bL3 = imcrop(im1L3,[50 50 150 150]);
zad2bL4 = imcrop(im1L4,[50 50 150 150]);
imwrite(zad2b,"zad22b.png");
imwrite(zad2bS,"zad22bS.png");
imwrite(zad2bL0,"zad22bL0.png");
imwrite(zad2bL1,"zad22bL1.png");
imwrite(zad2bL2,"zad22bL2.png");
imwrite(zad2bL3,"zad22bL3.png");
imwrite(zad2bL4,"zad22bL4.png");
%  
% figure;imshow(im1L0);
% figure;imshow(im1L1);
% figure;imshow(im1L2);
% figure;imshow(im1L3);
% figure;imshow(im1L4);