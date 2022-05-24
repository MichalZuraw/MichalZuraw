close all; clear all; clc
%% dolnoprzepustowy
k = 30; %parametr maski
t1 = imread('man.bmp');
figure;
L1 = fftshift(fft2(t1));
subplot(2,5,1); imshow(t1); xlabel("obraz wejsciowy");
subplot(2,5,2); imshow(log(1+abs(L1)),[]); xlabel("widmo mocy");
mask = zeros(size(L1,1),size(L1,2));
q = ceil(size(L1,1)/2);
p = ceil(size(L1,2)/2);
mask(q-k:q+k,p-k:p+k) = 1; %dolnoprzepustowa
L1 = fftshift(fft2(double(t1)/255));
subplot(2,5,3); imshow(mask); xlabel("maska 1");
subplot(2,5,4); imshow(log(1+abs(L1).*mask),[]);
A = ifft2(ifftshift(L1.*mask));
subplot(2,5,5); imshow(log(1+abs(A)),[]); xlabel("wynik");
% % ================= OBRAZ 2 =================
k = 60; %parametr maski
L1 = fftshift(fft2(t1));
subplot(2,5,6); imshow(t1); xlabel("obraz wejsciowy");
subplot(2,5,7); imshow(log(1+abs(L1)),[]); xlabel("widmo mocy");
mask = zeros(size(L1,1),size(L1,2));
q = ceil(size(L1,1)/2);
p = ceil(size(L1,2)/2);
mask(q-k:q+k,p-k:p+k) = 1; %dolnoprzepustowa
L1 = fftshift(fft2(double(t1)/255));
subplot(2,5,8); imshow(mask); xlabel("maska 2");
subplot(2,5,9); imshow(log(1+abs(L1).*mask),[]);
A = ifft2(ifftshift(L1.*mask));
subplot(2,5,10); imshow(log(1+abs(A)),[]); xlabel("wynik");
%% gornoprzepustowy
% k = 20; %parametr maski
% t1 = imread('man.bmp');
% figure;
% L1 = fftshift(fft2(t1));
% subplot(2,5,1); imshow(t1); xlabel("obraz wejsciowy");
% subplot(2,5,2); imshow(log(1+abs(L1)),'DisplayRange',[]); xlabel("widmo mocy");
% mask = ones(size(L1,1),size(L1,2));
% q = ceil(size(L1,1)/2);
% p = ceil(size(L1,2)/2);
% mask(q-k:q+k,p-k:p+k) = 0; %gornoprzepustowa
% L1 = fftshift(fft2(double(t1)/255));
% subplot(2,5,3); imshow(mask); xlabel("maska 1");
% subplot(2,5,4); imshow(log(1+abs(L1)).*mask,'DisplayRange',[]);
% A = ifft2(ifftshift(L1.*mask));
% subplot(2,5,5); imshow(log(1+abs(A)),[]); xlabel("wynik");
% % ================= OBRAZ 2 =================
% k = 50; %parametr maski
% L1 = fftshift(fft2(t1));
% subplot(2,5,6); imshow(t1); xlabel("obraz wejsciowy");
% subplot(2,5,7); imshow(log(1+abs(L1)),[]); xlabel("widmo mocy");
% mask = ones(size(L1,1),size(L1,2));
% q = ceil(size(L1,1)/2);
% p = ceil(size(L1,2)/2);
% mask(q-k:q+k,p-k:p+k) = 0; %gornoprzepustowa
% L1 = fftshift(fft2(double(t1)/255));
% subplot(2,5,8); imshow(mask); xlabel("maska 2");
% subplot(2,5,9); imshow(log(1+abs(L1).*mask),[]);
% A = ifft2(ifftshift(L1.*mask));
% subplot(2,5,10); imshow(log(1+abs(A)),[]); xlabel("wynik");