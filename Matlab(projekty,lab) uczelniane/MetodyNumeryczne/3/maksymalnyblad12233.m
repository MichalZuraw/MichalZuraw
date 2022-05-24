function max = maksymalnyblad(a,b,n)
%wprowadzenie danych
a=input('Podaj dolna granice wielomianu:'); %dolna wartosc predzialu
b=input('Podaj gorna granice wielomianu:'); %gorna wartosc przedzialu
n=input('Podaj stopien wielomianu:'); %stopien wielomianu
w=zeros();
c=zeros();
max=0;
maxr=0;
epsilon=a;%przypisanie wartosci dolnej granicy wielomianu do epsilon
epsilonr=a;
for i=1:n+1     % wyznaczanie wartosci wezlow czebyszewa
  c(i)=cos((2*(i-1)+1)/(2*n+2)*pi);   
  w(i)=0.5*((b-a)*c(i)+(a+b));
end
y=abs(w); %obliczenie wartosci funkcji w wezlach
l=length(w); 

z=a;
w=zeros();     

for i=1:n+1   %wyznaczanie wartosci wezlow rownoodleglych
    if(i==1)
    wr(i)=a;
    else
    wr(i)=z+(b-a)/n;
    z=wr(i);
    end 
    end
yr=abs(wr); %obliczenie wartosci funkcji w wezlach
l=length(wr);

for k=1:l %pêtla dla kolejnych wêz³ów w celu wyznaczenia max b³êdu
  epsilon=w(k);             %przypisany epsilon dla kolejnch wêz³ów
  epsilonr=wr(k);
  licznik=1; %jedynkowanie licznika w celu uzyskania wyniku dla poj. wêz³a
  suma=0;
  
  licznikr=1; %jedynkowanie licznika w celu uzyskania wyniku dla poj. wêz³a
  sumar=0;
            for i=1:l   %zastosowanie wzoru Lagrange
                if k~=i
                    mianownik=1;
                    licznik=licznik*(epsilon-w(i));   
                    
                    mianownikr=1;
                    licznikr=licznikr*(epsilonr-wr(i)); 
                            
                                for j=1:l
                                if i~=j
                                mianownik=mianownik*(w(i)-w(j));  
                                mianownikr=mianownikr*(wr(i)-wr(j)); 
                                end
                            end
                    mianownik=mianownik*(epsilon-w(i));
                    suma=suma+y(i)/mianownik;
                    
                    mianownikr=mianownikr*(epsilonr-wr(i));
                    sumar=sumar+yr(i)/mianownikr;
                end
            wynik=licznik*suma;  %wartosc funji w kolejnym wezle
            
            wynikr=licznikr*sumar;  %wartosc funji w kolejnym wezle
                    if max<abs(y(k)-wynik) %warunek przypisywania max
                    max=abs(y(k)-wynik); %obliczenie maksimum
                    end
                    if maxr<abs(yr(k)-wynikr) %warunek przypisywania max
                    maxr=abs(yr(k)-wynikr); %obliczenie maksimum
                    end
            end
end
disp(max); %wyswietlenie maksimum
disp(maxr); %wyswietlenie maksimum