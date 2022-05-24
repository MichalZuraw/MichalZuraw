function [K,M,MZ,C]=calc(img)
%Calc perimeter
perr=regionprops(img,"Perimeter");
perr=struct2cell(perr);
perr=cell2mat(perr);
perr=perr(255);
%Calc area
S=bwarea(img);
%Calc Compact coefficient 
K=4*pi*S/perr^2;
%Calc Malinowska's coefficient
M=perr/(2*sqrt(pi*S))-1;
%Calc MZ coefficient
MZ=(2*sqrt(pi*S))/perr;
C=perr/pi;

end



