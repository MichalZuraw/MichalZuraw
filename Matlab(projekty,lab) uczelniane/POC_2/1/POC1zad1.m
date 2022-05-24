clc;
clear;

O1m=imread('lenna_512x512.png');
O1n1m= imnoise(O1m,'salt & pepper',0.01);
O1n2m= imnoise(O1m,'salt & pepper',0.03);
O1n3m= imnoise(O1m,'salt & pepper',0.15);

im1zm=[O1m(250:400,250:400,:),O1n1m(250:400,250:400,:),O1n2m(250:400,250:400,:),O1n3m(250:400,250:400,:)];
im1am=imresize(im1zm,3,'nearest');
imwrite(im1am,'zad1am.png');

O2m=imread('woman_512x512.png');
O2n1m= imnoise(O2m,'salt & pepper',0.01);
O2n2m= imnoise(O2m,'salt & pepper',0.03);
O2n3m= imnoise(O2m,'salt & pepper',0.15);

im1bzm=[O2m(250:400,250:400,:),O2n1m(250:400,250:400,:),O2n2m(250:400,250:400,:),O2n3m(250:400,250:400,:)];
im1bm=imresize(im1bzm,3,'nearest');
imwrite(im1bm,'zad1bm.png');

O1=imread('baboon_512x512.png');
O1n1= imnoise(O1,'salt & pepper',0.01);
O1n2= imnoise(O1,'salt & pepper',0.03);
O1n3= imnoise(O1,'salt & pepper',0.15);

im1z=[O1(250:400,250:400,:),O1n1(250:400,250:400,:),O1n2(250:400,250:400,:),O1n3(250:400,250:400,:)];
im1a=imresize(im1z,3,'nearest');
imwrite(im1a,'zad1a.png');

O2=imread('img_010.png');
O2n1= imnoise(O2,'salt & pepper',0.01);
O2n2= imnoise(O2,'salt & pepper',0.03);
O2n3= imnoise(O2,'salt & pepper',0.15);

im1bz=[O2(250:400,250:400,:),O2n1(250:400,250:400,:),O2n2(250:400,250:400,:),O2n3(250:400,250:400,:)];
im1b=imresize(im1bz,3,'nearest');
imwrite(im1b,'zad1b.png');

szumsprawdzenie=im2double(O2n1)-im2double(O2);

szum=0;
[M,N,L]=size(szumsprawdzenie);
for i = 1 : M
        for j = 1 :N
                 if (szumsprawdzenie(i,j,1)+szumsprawdzenie(i,j,2)+szumsprawdzenie(i,j,3))~=0 
                 szum=szum+1;
                 end
        end
end


poziomszumu=szum/(M*N*L); 

