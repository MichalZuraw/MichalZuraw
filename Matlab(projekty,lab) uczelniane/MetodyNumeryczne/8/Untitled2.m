clear
n=input('Podaj rozmiar macierzy A:');
A=zeros(n,n); % Macierz wej�ciowa A
for i=1:n     % Wype�nianie macierzy A
    for j=1:n
    A(i,j)=input(sprintf('Podaj wspolczynniki macierzy A[%d][%d]: ' ,i ,j));
    end 
end
disp('Macierz A=');
disp(A);
yo(n,1)=zeros; % stworzenie wektora pocz�tkowego y0
yo(1,1)=1;
disp('Wektor pocz�tkow y0=');
disp (yo);
a=zeros(n,n);  %  Stworzenie macierzy a - macierz uk�adu r�wna� liniowych 
for i=1:n-1    %  Obliczanie kolejnych kolumn macierzy a ze wzoru yi = A*y(i-1) dla i = 1,2...,n-1
    if(i==1)
    y=yo;
    a(:,n)= y;
    end
y=A*y;
a(:,n-i)=y;
end
disp('Macierz a='); % Wy�wietlenie macierzy a
disp (a);
y=A*y; % Obliczenie ostatniej kolumny uk�adu r�wna� liniowych - wektor b
b=-1*y; 
disp('Wektor b=');
disp (b);
pe=a\b; % Obliczenie macierzy zawieraj�cej wsp�czynniki r�wnania charakterystycznego
disp(pe);
p=zeros(n+1,1);
for i=1:n
    p(i,1)=pe(i,1);
end
disp(pe);
for i=n+1:-1:1 % Dodajemy wsp�czynnik 1 do pocz�tku wektora p
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
disp('Wektor wsp�czynnik�w p=');
disp(p);
wartosci=roots(p); %obliczenie warto�ci w�asnych macierzy
disp('Wartosci wlasne macierzy ='); %wy�wietlenie warto�ci w�asnych macierzy
Wartosci2=sort(wartosci,'ascend'); %sortowanie rosn�co warto�ci w�asnych
disp(Wartosci2);

