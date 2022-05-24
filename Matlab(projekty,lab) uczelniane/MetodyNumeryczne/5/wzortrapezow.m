function [dokl, cal, rest, roz] = wzortrapezow(a,b)
% dokl - ca³ka dok³adna
% cal - ca³ka numeryczna
% rest - reszta numeryczna
% roz - reszta dok³adna
a=input('Podaj dolna granice przedzialu:');
b=input('Podaj gorna granice przedzialu:'); %obliczanie dla funkcji exp(x)
h=b-a;%wspó³czynnik h, krok
dokl=exp(b)-exp(a); %górna granica - dolna granica
cal=0.5*h*(exp(b)+exp(a)); %obliczenie wartoœæi ca³ki wed³ug wzoru
rest=-h^3*exp(b)/12; %obliczenie reszty
roz=dokl-cal; %obliczenie roznicy w wartosciach
display(dokl);
display(cal);
display(rest);
display(roz);
end