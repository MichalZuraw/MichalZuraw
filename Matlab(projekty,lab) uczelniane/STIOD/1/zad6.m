file=fopen('33_tekst.txt');
hasla = load('hasla.mat').hasla;
szyfr=fread(file);%odczytanie pliku
szyfr=double(szyfr);%odczytanie szyfrów i zapis w postaci double

for i=1:5000 
    klucz=hasla{i};
    klucz=double(klucz);%przepisanie konkretnetego klucza jako double
    reszta=mod(length(szyfr),length(klucz));%obliczenie reszty z dzielenia szyfru przez klucz
    x=length(szyfr)/length(klucz);%obliczenie ile pelnych razy klucz miesci sie w szyfrze
    klucz2=klucz;
for j=1:x-1
    klucz2=[klucz2 klucz];%wydluzenie klucza bez reszty
end

klucz2=[klucz2 klucz(1,1:reszta)];%wydluzenie klucza z reszta

for k=1:length(szyfr)

    tekst(k)=mod(szyfr(k)-klucz2(mod(k-1,length(klucz2))+1),256);%deszyfrowanie

    if((tekst(k)>32 && tekst(k)<90) || (tekst(k)>96 && tekst(k)<123)) %sprawdzenie czy w odszyfrowanym tekscie sa litery male i duze
    else
        break;
    end
end
if(k==length(szyfr))
    fprintf('klucz na miejscu %d\n',i);%wypisanie miejsca klucza
    line=fopen('33.txt','w');
    fwrite(line,tekst);%zapis odszyfrowanego tekstu w pliku
    fclose(line);
end
end








