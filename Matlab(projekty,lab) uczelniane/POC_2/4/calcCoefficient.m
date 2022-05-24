function [K, M, MZ]=calcCoefficient(imIn)

imIn=double(imIn);
L=regionprops(imIn,"Perimeter");
L=struct2cell(L);
L=cell2mat(L);

S=regionprops(imIn,"Area");
S=struct2cell(S);
S=cell2mat(S);
%Compact coefficient 
K=(4*pi*S)/L^2;
%Malinowska's coefficient
M=L/(2*sqrt(pi*S))-1;
%MZ coefficient
MZ=(2*sqrt(pi*S))/L;

end