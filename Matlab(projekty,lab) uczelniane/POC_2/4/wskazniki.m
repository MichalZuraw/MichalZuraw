function [K, M, MZ]=wskazniki(img)
img=double(img);

%Wyznaczenie obwodu
L=regionprops(img,"Perimeter");
L=struct2cell(L);
L=cell2mat(L);

%Wyznaczenie Pola
S=regionprops(img,"Area");
S=struct2cell(S);
S=cell2mat(S);

%Wspolczynnik kompaktowosci
K=(4*pi*S)/L^2;
%wspolczynnik Malinowskiej
M=L/(2*sqrt(pi*S))-1;
%wspolczynnik Mz
MZ=(2*sqrt(pi*S))/L;
end