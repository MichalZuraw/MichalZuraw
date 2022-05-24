clc;
clear all;
format long;
s=1; %zdefiniowanie zmiennej s
K=10; %wymiary siatki
L=10; %wymiary siatki

h=1/(K-1); %obliczenie wartoœci h
g=1/(L-1); %obliczenie wartoœci g
t=0:h:1; %obliczenie poszczegolnych wezlow siatki w (0;1)
x=0:g:1; %obliczenie poszczegolnych wezlow siatki w (0;1)
%Warunek poczatkowy i warunki brzegowe
warp=0;
for j=1:L
     y(1,j) = warp;
end
for i=1:K
     y(i,L)= 0;
     y(i,1)= 0;
end
%Rozwiazanie dokladne i ksi
for j=1:L
    for i=1:K
         ksi(i,j) = s*pi*sin(pi*x(j))*sin(s*pi*t(i))*exp(-pi*pi*t(i));
         yd(i,j) = sin(pi*x(j))*exp(-pi*pi*t(i))*(1-cos(s*pi*t(i)));
    end
end
%Parametry delta, A, B, C
delta=1/2-(g^2)/(12*h);
A=-delta/(g^2);
B=2*delta/(g^2)+1/h;
C=-delta/(g^2);
alfa(2)=0;
beta(2)=0;
%Obliczenie wartosci alfa i beta i wartosci wektora F
for i=1:K-1
        for j=2:L-1
            f(i,j) = -ksi(i,j)-((1-delta)/(g*g))*(y(i,j+1)+y(i,j-1))+(2*(1-delta)/(g*g)-1/h)*y(i,j);
            alfa(j+1) = C/(-B-alfa(j)*A);
            beta(j+1)=(A*beta(j)+f(i,j))/(-B-alfa(j)*A);
        end
        for j=L-1:-1:1
            y(i+1,j)=alfa(j+1)*y(i+1,j+1)+beta(j+1);
        end
end
%Wyswietlenie delty dla ktorej liczony jest blad
disp("Delta:");
disp(delta);
%Obliczenie bledu sredniokwadratowego
blad=0;
for i=1:K
     for j=1:L
        if(j<L)
             roz=y(i,j)-yd(i,j);
             blad=blad+(roz*roz);
        end
     end
end
blad=blad/(L*K);
disp("Blad sredniokwadratowy:");
disp(blad);
blad = immse(yd,y);
disp("Sprawdzenie immse:");%Sprawdzenie wartosci bledu funkcja immse
disp(blad);
%Petla realizujaca zad 3
pomtab(19)=zeros;
licznik=1;
errtab(19)=zeros;
delta=0;
while(delta<1)
delta=delta+0.05;
pomtab(licznik)=delta;
A=-delta/(g*g);
B=2*delta/(g*g) + 1/h;
C=A;
alfa(2)=0;
beta(2)=0;
for i=1:K-1
 for j=2:L-1
 f(i,j) = -ksi(i,j)-((1-delta)/(g*g))*(y(i,j+1)+y(i,j-1))+(2*(1-delta)/(g*g)-1/h)*y(i,j);
 alfa(j+1) = C/(-B-alfa(j)*A);
 beta(j+1)=(A*beta(j)+f(i,j))/(-B-alfa(j)*A);
 end
 for j=L-1:-1:1
 y(i+1,j)=alfa(j+1)*y(i+1,j+1)+beta(j+1);
 end
end
blad=0;
for i=1:K
 for j=1:L
 if(j<L)
 roz=y(i,j)-yd(i,j);
 blad=blad+(roz*roz);
 end
 end
end
errtab(licznik)=blad;
licznik=licznik+1;
end
%Wyswietlenie wykresow
figure(1)
surf(x,t,y)%rysowanie wykresu 3D rozwiazania przyblizonego
figure(2)
surf(x,t,yd-y)%rysowanie wykresu 3D bledu
figure(3)
plot(pomtab,errtab)%rysowanie wykresu b??du w funkcji parametru delta
figure(4)
%plot(pomtab,errtab) %rysowanie wykresu b??du w funkcji parametru delta w skali logarytmicznej