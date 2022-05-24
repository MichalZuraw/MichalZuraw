clear
n=input('Podaj rozmiar macierzy A:');
for i=1:n
for j=1:n
    A(i,j)=input(sprintf('Podaj wspolczynniki macierzy A[%d][%d]: ' ,i ,j));
end 
end
disp('macierz A=');
disp(A);
yo(n,1)=zeros;
yo(1)=1;
disp('y0=');
disp (yo);
a(i,j)=zeros;
for i=1:n-1
if(i==1)
y=yo;
a(:,n)= y;
end
y=A*y;
a(:,n-i)=y;
end
y=A*y;
macY(n,n)=zeros;
macY(:,1)=yo;
for i=1:n
macY(:,i)=a(:,n+1-i);
end
disp(macY);
b=-1*y;
p=a\b;
disp('macierz p=');
wartosci=eig(A);
disp('wartosci wlasne macierzy=');
disp(wartosci);
macg(n,n)=zeros;
macg(n,:)=1;
for i=1:n
for j=n-1:-1:1
macg(j,i)=macg(j+1,i)*wartosci(i)+p(n-j);  
end
end
disp ('macierz g:');
disp (macg);

x(n,n)=zeros;

for j=1:n
for i=1:n
if(n==5)
x(i,j)=macg(1,j) * macY(i,1)+macg(2,j) * macY(i,2)+macg(3,j) * macY(i,3)+macg(4,j) * macY(i,4)+macg(5,j) * macY(i,5);    
end
if(n==4)
x(i,j)=macg(1,j) * macY(i,1)+macg(2,j) * macY(i,2)+macg(3,j) * macY(i,3)+macg(4,j) * macY(i,4);
end
if(n==3)
x(i,j)=macg(1,j) * macY(i,1)+macg(2,j) * macY(i,2)+macg(3,j) * macY(i,3);
end
if(n==2)
x(i,j)=macg(1,j) * macY(i,1)+macg(2,j) * macY(i,2);
end
if(n==1)
x(i,j)=macg(1,j) * macY(i,1);
end
end
end
disp ('wynik:');
disp (x);

for j=1:n
max=0;
for i=1:n
if (abs(x(i,j))>abs(max))
max=x(i,j);
end
end
x(:,j)=x(:,j)/max;
end
disp(x);