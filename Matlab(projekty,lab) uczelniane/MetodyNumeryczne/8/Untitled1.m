clear
n=input('Podaj rozmiar macierzy P:');
for i=1:n
    A(i,1)=input(sprintf('Podaj wspolczynniki macierzy A[%d]: ' ,i));
end 
war=roots(A);
