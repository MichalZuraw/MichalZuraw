function x = interpolacja(a,b,n,epsilon)

a=input('Podaj dolna granice wielomianu:');
b=input('Podaj gorna granice wielomianu:');
n=input('Podaj stopien wielomianu:');
epsilon=input('Podaj punkt:');
w=zeros();
z=a;
licznik=1
for i=1:n+1   %wyznaczanie warto�ci w�z��w
    if(i==1)
    w(i)=a;
    else
    w(i)=z+(b-a)/n;
    z=w(i);
    end
end
disp(w);
l=length(w);
y=w;
l=length(w); %pobranie ilo�ci w�z��w
suma=0;
for i=1:l   %obliczanie warto�ci wielomianu ze wzoru interpolacyjnego Lagrange'a
    mianownik=1;%
    licznik=licznik*(epsilon-w(i));
    for j=1:l
        if (i~=j)
        mianownik=mianownik*(w(i)-w(j));
        end
    end
    suma=suma+y(i)/(mianownik*(epsilon-w(i)));
end
wartosc=suma*licznik;
disp(wartosc);
end
