function [tekst]=fDejednorazowy(szyfr, klucz)
tekst=zeros(1,length(szyfr));%zmienna do przechowania odszyfrowanego tekstu
%szyfrowanie tekstu
for i=1:length(szyfr)
    tekst(i)=szyfr(i)-klucz(mod(i-1,length(klucz))+1);  
end
tekst=mod(tekst, 256);
end