clear;
clc;

N=20; % liczba duzych cykli
n=101; % liczba punktow siatki
b=4;  % definicja gornej granicy dziedziny rozwiazania <0,b>
x=linspace(0,b,n);  % generacja zmiennej x jako wektora od 0 do b, n punkt�w
t=linspace(0,b,n);  % generacja zmiennej t, jak x
dt=b/(n-1);            % obliczenie kroku dyskretyzacji
K=zeros(n,n);     % Inicjacja j�dra jako macierzy kwadratowej wype�nionej zerami.
L=2.*ones(n,1); % L(v)=2 - funkcja okre?laj?ca j?dro
% W poni�szej p�tli generujemy j�dro wg definicji: K(x,t)=L(x-t).
for i=1:n
    for j=1:n
        if j<=i
            K(i,j)=L(i-j+1); % modyfikujemy tylko elementy dla x-t>=0, bo pozosta�e elementy j�dra s� z def. r�wne 0.
        end
    end
end
%K=np.tril(K) - funkcja zeruj?ca, w razie potrzeby, g�rny prawy tr�jk?t j?dra.
disp('Rozwi�zanie dla danych z przyk�adu: lambda=3, f(x)=1, L(x-t)=2');
disp('Tak wygl�da j�dro:');
disp(K);
da=length(x);
y=zeros(da);  % warunek poczatkowy rozwiazania - funkcja zerowa
ynext=zeros(da); % zmienna pomocnicza do p�tli;
f=ones(da);   % funkcja f jest stala i rowna 1.
l=3;% ustalamy warto?? lambda
for k=1:N     % g��wna p�tla - duze cykle
    for i=1:n                % ma�e cykle - wyznaczanie warto�ci dla poszczeg�lnych x-s�w
        suma = 0;
        for j=1:i        % sumowanie po j-tach do i () jest r�wnowa�ne zerowaniu cz�ci j�dra funkcj� 'tril'
            suma=suma+K(i,j)*y(j)*dt;  % calkowanie metoda prostokatow
            ynext(i)=f(i)+l*suma;
        end% obliczenie nowego rozwiazania
        y=ynext;   % podstawienie nowego rozwi�zania w miejsce starego
    end
end
plot(x,y);
hold on;
e=exp(6*x);
plot(x,e,'.');
legend('Neuman','exp(6x)');