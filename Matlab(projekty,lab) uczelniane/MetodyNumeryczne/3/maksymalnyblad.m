function x = maksymalnyblad(a,b,n)

a=input('Podaj dolna granice wielomianu:'); %dolna wartosc predzialu
b=input('Podaj gorna granice wielomianu:'); %gorna wartosc przedzialu
n=input('Podaj stopien wielomianu:'); %stopien wielomianu
z=a;
w=zeros();     
max=-1;

for i=1:n+1   %wyznaczanie wartosci wezlow rownoodleglych
    if(i==1)
    w(i)=a;
    else
    w(i)=z+(b-a)/n;
    z=w(i);
    end 
end

y=abs(w); %obliczenie wartosci funkcji w wezlach
l=length(w); 
wc=zeros(1,n+1);     
cc=zeros(1,n+1);

for i=1:n+1
  cc(i)=cos(pi*(2*(i-1)+1)/(2*n+2));   
  wc(i)=0.5*((b-a)*cc(i)+(a+b)); %tworzenie wezlow Czebyszewa
end
yc=abs(wc);
maxc=-1;
for k=1:l
  epsilon=w(k);     %obliczenie epsilon dla kolejnych wezlow rownoodleglych
  epsilonc=wc(k);   %obliczenie epsilon dla kolejnych wezlow Czebyszewa        
  
  wynik=1;
  licznik=1;
  suma=0;
  
  wynikc=1;
  licznikc=1;
  sumac=0;
  
  for i=1:l   %zastosowanie wzoru Lagrange
  if k~=i
   mianownik=1;
   licznik=licznik*(epsilon-w(i)); 
   
   mianownikc=1;
   licznikc=licznikc*(epsilonc-wc(i));  
   
  for j=1:l
    if i~=j
      mianownik=mianownik*(w(i)-w(j)); 
      
      mianownikc=mianownikc*(wc(i)-wc(j)); 
    end
    end
      mianownik=mianownik*(epsilon-w(i));
      suma=suma+y(i)/mianownik;
      
      mianownikc=mianownikc*(epsilonc-wc(i));
      sumac=sumac+yc(i)/mianownikc;
    end
  wynik=licznik*suma;  %wartosc funckji w kolejnym wezle rownoodleglym
  
  wynikc=licznikc*sumac;  %wartosc funckji w kolejnym wezle Czebyszewa
    
    if max<abs(y(k)-wynik)
    
    max=abs(y(k)-wynik); %obliczenie maksimum
    end
    
    if max<abs(yc(k)-wynikc)
    
    maxc=abs(yc(k)-wynikc); %obliczenie maksimum
    end
  end
end
disp('wynik maksimum dla wezlow rownoodleglych /n');
disp(max);
disp('wynik maksimum dla wezlow Czebyszewa /n');
disp(maxc); 