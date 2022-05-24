%Zad2.
clc
%Dane wejsciowe
xo=0;        %warunek pocz¹tkowy na x
yo=1;        % %warunek pocz¹tkowy na y
xmax=3;      % xmax – wartoœæ koñcowa x
n=2;         %liczba punktów równo roz³o¿onych pomiêdzy x0 a xmax

k=zeros(4,1);         %wektor wartosci wspol k
h=(xmax-xo)/(n+1);            %obliczanie sta³ego kroku obliczeñ
x=zeros(n+2,1);               %wektor x o dlugosci n+2
yrk=zeros(n+2,1);             %wektor yrk o dlugosci n+2
yd=zeros(n+2,1);              %wektor yd o dlugosci n+2
blad_RungKut=zeros(n+2,1);    %wektor bledu Rungego-Kutty

x(1)=xo;                      %przypisanie pierwszej wartosci x0                     
yrk(1)=yo;                    %przypisanie pierwszej wartosci y0
yd(1)=yo;                     %przypisanie pierwszej wartosci y0
blad_RungKut(1)=yrk(1)-yd(1); %obliczenie pierwszej wartosci bledu Rungego-Kutty


for i=2:n+2
  %obliczanie wspolczynnikow k  
  k(1)=0.1*x(i-1)*yrk(i-1)*h;          
  k(2)=0.1*(x(i-1)+0.5*h)*(yrk(i-1)+0.5*k(1))*h;
  k(3)=0.1*(x(i-1)+0.5*h)*(yrk(i-1)+0.5*k(2))*h;
  k(4)=0.1*(x(i-1)+h)*(yrk(i-1)+k(3))*h;
  
  deltay=(k(1)+2*k(2)+2*k(3)+k(4))/6;    %obliczenie deltay
  x(i)=x(i-1)+h;                         %obliczenie nastepnych wartoœci x
  yrk(i)=yrk(i-1)+deltay;                %obliczenie nastepnych wartosci yrk 
  
  C=yo/exp(0.05*xo^2);                   
  yd(i)=C*exp(0.05*x(i)^2);              %obliczenie nastepnych wartosci yd
  
  blad_RungKut(i)=yrk(i)-yd(i);               %obliczenie bledu Rungego-Kutty
end
format long;
T=table(x,yrk,yd,blad_RungKut);
display(T);