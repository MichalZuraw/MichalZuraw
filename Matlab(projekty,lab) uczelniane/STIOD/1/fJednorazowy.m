function [szyfr]=fJednorazowy(tekst, klucz)
szyfr=zeros(1,length(tekst));%zmienna do przechowania zaszyfrowanego tekstu
%szyfrowanie tekstu
for i=1:length(tekst)
    szyfr(i)=tekst(i)+klucz(mod(i-1,length(klucz))+1);  
end
szyfr=mod(szyfr, 256);
end