%function med=medianowakolor(obraz)
obraz= imread('MC.png');
[M,N,K] = size(obraz);
obrazek=ones(M+2,N+2)*(-1);
obrazek(2:M+1,2:N+1,1:K)=obraz;
for i=2:M+1
    for j=2:N+1
        for k=1:3
            mediana=obrazek(i:i+1,j:j+1,k);
            nowy(i-1,j-1,k)=median(mediana);
        end
    end
end
med=uint8(nowy);
%end
