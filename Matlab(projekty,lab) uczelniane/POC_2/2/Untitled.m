%% ================ ROTACJA ================
t1 = (imread('trojkat.png')); %trojkat , linie
t1=rgb2gray(t1);
j = 0;
figure(1);
for i = 1:45:91
j = j+1;
t1r = imrotate(t1,i-1,'crop');
L1 = fftshift(fft2(t1r));
subplot(3,4,j); imshow(t1r,[]);
s1 = strcat('kąt=',num2str(i-1));
title(s1);
subplot(3,4,j+4);
imshow(log(abs(L1)+1),[]);
subplot(3,4,j+8);
imshow(angle(L1),[]);
end
j = j+1;
i = 121;
t1r = imrotate(t1,i-1,'crop');
L1 = fftshift(fft2(t1r));
subplot(3,4,j); imshow(t1r,[]);
s1 = strcat('kąt=',num2str(i-1));
title(s1);
subplot(3,4,j+4);
imshow(log(abs(L1)+1),[]);
subplot(3,4,j+8);
imshow(angle(L1),[]);
subplot(3,4,5)
ylabel('widmo mocy')S
subplot(3,4,9)
ylabel('faza')
%% ================ TRANSLACJA ================
t1 = (imread('trojkat.png'));
t1=rgb2gray(t1);
j = 0;
figure(1);
sc = int8(-150 + 250.*rand(4,2));
for i = 1:4
j = j+1;
t1t = imtranslate(t1,sc(i,:));
L1 = fftshift(fft2(t1t));
subplot(3,4,j)
imshow(t1t,[])
subplot(3,4,j+4);
imshow(log(abs(L1)+1),[]);
subplot(3,4,j+8);
imshow(angle(L1),[]);
end
subplot(3,4,5)
ylabel('widmo mocy')
subplot(3,4,9)
ylabel('faza')
%% ================ RESIZE ================
t1 =(imread('kolo.png'));
t1=rgb2gray(t1);
j=0;
figure
for i=1:4
j=j+1;
t1t=imresize(t1,i);
[M,N] = size (t1t);
subplot(3,4,j);
m = M/2; n = N/2;
t1t = reshape(t1t(m-255:m+256,n-255:n+256),[512,512]);
L1 = fftshift(fft2(t1t));
nazwa=strcat('k',num2str(i-1));
imshow(t1t,[])
title(nazwa);subplot(3,4,j+4);
imshow(log(abs(L1)+1),[]);
subplot(3,4,j+8);
imshow(angle(L1),[]);
end
subplot(3,4,5)
ylabel('widmo mocy')
subplot(3,4,9)
ylabel('faza')
%% ================ Generacja sinusów ================
a=10*[1 -1 2 -4000];
b=5* [1 1 4 2];
subtitle('Sinus');
j=0;
for i=1:4
for u = 1:512
for v=1:512
a1(u,v)=uint8(127+128*sin(u/a(i)+v/b(i)));
end
end
imwrite(a1,"sin"+i+".png");
j=j+1;
subplot(1,4,j)
s1=strcat('a,b=',num2str(a(i)),',',num2str(b(i))) ;
imshow(a1,[])
title(s1);
end
clc; clear all; close all;
%% ================ SINUS ================
t1 =(imread('sin1.png'));
t2 =(imread('sin2.png'));
t3 =(imread('sin3.png'));
t4 =(imread('sin4.png'));
figure
subplot(3,4,1); imshow(t1,[]); title("sin1");
subplot(3,4,2); imshow(t2,[]); title("sin2");
subplot(3,4,3); imshow(t3,[]); title("sin3");
subplot(3,4,4); imshow(t4,[]); title("sin4");
subplot(3,4,5); L1 = fftshift(fft2(t1)); imshow(log(abs(L1)+1),[]);
subplot(3,4,6); L1 = fftshift(fft2(t2)); imshow(log(abs(L1)+1),[]);
subplot(3,4,7); L1 = fftshift(fft2(t3)); imshow(log(abs(L1)+1),[]);
subplot(3,4,8); L1 = fftshift(fft2(t4)); imshow(log(abs(L1)+1),[]);
subplot(3,4,9); L1 = fftshift(fft2(t1)); imshow(angle(L1),[]);
subplot(3,4,10); L1 = fftshift(fft2(t2)); imshow(angle(L1),[]);
subplot(3,4,11); L1 = fftshift(fft2(t3)); imshow(angle(L1),[]);
subplot(3,4,12); L1 = fftshift(fft2(t4)); imshow(angle(L1),[]);
subplot(3,4,5)
ylabel('widmo mocy')
subplot(3,4,9)
ylabel('faza')
