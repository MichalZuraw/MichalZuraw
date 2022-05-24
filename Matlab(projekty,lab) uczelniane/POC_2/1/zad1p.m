clear all
clc
close all
% Obrazy
O1 = imread('im4c.png');
O1SZ1 = imread('im4sp1c.png');
O1SZ2 = imread('im4sp2c.png');
O1SZ10 = imread('im4sp10c.png');
O1=im2double(O1);
O1SZ1=im2double(O1SZ1);
O1SZ2=im2double(O1SZ2);
O1SZ10=im2double(O1SZ10);
%ODEJMUJEMY OD SIEBIE DWA OBRAZY W TEN SPOSOB ZNAJDUJEMY PIKSELE W KTORYCH
%NIE JEST WARTOSC 0 A TYM SAMYM JEST SZUM
szumsprawdzenie1=O1SZ1-O1;
szumsprawdzenie2=O1SZ2-O1;
szumsprawdzenie10=O1SZ10-O1;
szum1=0;
szum2=0;
szum10=0;
%obrazy sa te same wiec wystarczy jeden for
[M,N,L]=size(szumsprawdzenie1);
for i = 1 : M
for j = 1 :N
if(szumsprawdzenie1(i,j,1)+szumsprawdzenie1(i,j,2)+szumsprawdzenie1(i,j,3))~=0
szum1=szum1+1;
end
if(szumsprawdzenie2(i,j,1)+szumsprawdzenie2(i,j,2)+szumsprawdzenie2(i,j,3))~=0
szum2=szum2+1;
end
if(szumsprawdzenie10(i,j,1)+szumsprawdzenie10(i,j,2)+szumsprawdzenie10(i,j,3))~=0
szum10=szum10+1;
end
end
end
poziomszumu1=szum1/(M*N*L)
poziomszumu2=szum2/(M*N*L)
poziomszumu10=szum10/(M*N*L)