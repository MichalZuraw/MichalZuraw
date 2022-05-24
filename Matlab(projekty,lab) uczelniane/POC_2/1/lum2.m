function med=lum2(obraz,k)
[M,N] = size(obraz);
obrazek=ones(M+2,N+2)*(-1);
obrazek(2:M+1,2:N+1)=obraz;
for i=2:M+1
    for j=2:N+1
        mediana = obrazek(i-1:i+1,j-1:j+1);
        medianabez=sort(mediana(mediana>-1));
        srodek=ceil(length(medianabez)/2);
        if (srodek-k)<1
            min=medianabez(1);
        else
            min=medianabez(srodek-k);
        end
        if (srodek+k)>length(medianabez)
            max=medianabez(length(medianabez));
        else
            max=medianabez(srodek+k);
        end
        wartosc=obrazek(i,j);
        nowy(i-1,j-1)=uint8(median([min,wartosc,max]));
    end
end
med=nowy;
end

