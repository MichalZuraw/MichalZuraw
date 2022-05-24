%zad1
clc;
%Dane wejsciowe
xo=0;        %warunek pocz¹tkowy na x
yo=1;        % %warunek pocz¹tkowy na y
xmax=3;      % xmax – wartoœæ koñcowa x
n=2;         %liczba punktów równo roz³o¿onych pomiêdzy x0 a xmax


h=(xmax-xo)/(n+1);    %obliczanie sta³ego kroku obliczeñ
x=zeros(n+2,1);       %wektor x o dlugosci n+2
ye=zeros(n+2,1);      %wektor ye o dlugosci n+2
yd=zeros(n+2,1);      %wektor yd dlugosci n+2
blad_Eulera=zeros(n+2,1);   %wektor bledu Eulera

x(1)=xo;              %przypisanie pierwszej wartosci x0
ye(1)=yo;             %przypisanie pierwszej wartosci ye
yd(1)=yo;             %przypisanie pierwszej wartosci yd
blad_Eulera(1)=ye(1)-yd(1);      %obliczenie pierwszej wartosci bledu Eulera

for i=2:n+2 
  deltay=0.1*x(i-1)*ye(i-1)*h; %obliczenie delta y 
  x(i)=x(i-1)+h;               %obliczenie nastêpnych wartoœci x
  ye(i)=ye(i-1)+deltay;        %obliczenie nastepnych wartosci y - numeryczne
  
  C=yo/exp(0.05*xo^2);         
  yd(i)=C*exp(0.05*x(i)^2);    %obliczenie nastepnych wartosci y - dokladne
  
  blad_Eulera(i)=ye(i)-yd(i);  %obliczenie b³êdu Eulera
end
format long;
T=table(x,ye,yd,blad_Eulera);   %tworzenie tablicy z wynikami
display(T);