function [dokl, cal, rest, roz] = wzortrapezow(a,b)
% dokl - ca�ka dok�adna
% cal - ca�ka numeryczna
% rest - reszta numeryczna
% roz - reszta dok�adna
a=input('Podaj dolna granice przedzialu:');
b=input('Podaj gorna granice przedzialu:'); %obliczanie dla funkcji exp(x)
h=b-a;%wsp�czynnik h, krok
dokl=exp(b)-exp(a); %g�rna granica - dolna granica
cal=0.5*h*(exp(b)+exp(a)); %obliczenie warto��i ca�ki wed�ug wzoru
rest=-h^3*exp(b)/12; %obliczenie reszty
roz=dokl-cal; %obliczenie roznicy w wartosciach
display(dokl);
display(cal);
display(rest);
display(roz);
end