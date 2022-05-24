clear
n=input('Podaj rozmiar macierzy A:');
A=zeros(n,n); % Macierz wejœciowa A
for i=1:n     % Wype³nianie macierzy A
    for j=1:n
    A(i,j)=input(sprintf('Podaj wspolczynniki macierzy A[%d][%d]: ' ,i ,j));
    end 
end
disp('Macierz A=');
disp(A);
yo(n,1)=zeros; % stworzenie wektora pocz¹tkowego y0
yo(1,1)=1;
disp('Wektor pocz¹tkow y0=');
disp (yo);
a=zeros(n,n);  %  Stworzenie macierzy a - macierz uk³adu równañ liniowych 
for i=1:n-1    %  Obliczanie kolejnych kolumn macierzy a ze wzoru yi = A*y(i-1) dla i = 1,2...,n-1
    if(i==1)
    y=yo;
    a(:,n)= y;
    end
y=A*y;
a(:,n-i)=y;
end
disp('Macierz a='); % Wyœwietlenie macierzy a
disp (a);
y=A*y; % Obliczenie ostatniej kolumny uk³adu równañ liniowych - wektor b
b=-1*y; 
disp('Wektor b=');
disp (b);
pe=a\b; % Obliczenie macierzy zawieraj¹cej wspó³czynniki równania charakterystycznego
disp(pe);
p=zeros(n+1,1);
for i=1:n
    p(i,1)=pe(i,1);
end
disp(pe);
for i=n+1:-1:1 % Dodajemy wspó³czynnik 1 do pocz¹tku wektora p
    if (i~=1)
    p(i,1)= p(i-1,1);
    end
    if (i==1)
    p(i,1)=1;
    end
end
disp('Macierz a=')
disp (a);
disp('Wektor b=')
disp (b);
disp('Wektor wspó³czynników p=');
disp(p);
wartosci=roots(p); %obliczenie wartoœci w³asnych macierzy
disp('Wartosci wlasne macierzy ='); %wyœwietlenie wartoœci w³asnych macierzy
Wartosci2=sort(wartosci,'ascend'); %sortowanie rosn¹co wartoœci w³asnych
disp(Wartosci2);

