function [dokl, cal, rest, roz] = wzorsimpsona(a,b)
% dokl - ca�ka dok�adna
% cal - ca�ka numeryczna
% rest - reszta numeryczna
% roz - reszta dok�adna
a=input('Podaj dolna granice przedzialu:');
b=input('Podaj gorna granice przedzialu:');
h=(b-a)/2; %wsp�czynnik h, krok
dokl=exp(b)-exp(a);   %g�rna granica - dolna granica
cal=h*(exp(b)+exp(a)+4*exp(a+h))/3; %obliczenie warto��i ca�ki wed�ug wzoru
rest=(-1/90)*h^5*exp(b); %obliczenie reszty
roz=dokl-cal; %obliczenie roznicy w wartosciach
display(dokl);
display(cal);
display(rest);
display(roz);
end