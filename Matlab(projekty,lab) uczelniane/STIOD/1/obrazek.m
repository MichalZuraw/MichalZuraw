pic=imread('33.png');
hasla = load('hasla.mat').hasla;
pic=double(pic);
picpic=reshape(pic,1,[]);%zmiama macierzy na wektor
k=1;
key=[];
%autocorr(black,35) %haslo ma dlugosc 30
%seleckja kluczy o dlugosci 30
for i=1:5000    
   if length(hasla{i})==30
    key{k}=hasla{i};
    k=k+1;
   end
end
klucz=double(key{1});
%odszyfrowanie obrazu 1 kluczem
odsz=fDejednorazowy(picpic, klucz);
hOdsz=histogram(odsz,255).Values(255);
%odszyfrowanie obrazu pozostalymi kluczami
for h=2:length(key)
    klucz=double(key{h});
    odsz=fDejednorazowy(picpic, klucz);
    old=histogram(odsz,255).Values(255);
    %sprawdzenie czy po odszyfrowaniu obraz ma najmniej bialego koloru
    %niz pozostale i zapamiętanie indeksu
    if old<hOdsz
        hOdsz=old;
        bestH=h;
    end
    
end
%odszyfrowanie obrazu prawidlowym kluczem
klucz=double(key{bestH});
odsz=fDejednorazowy(picpic, klucz);
odsz=reshape(odsz,size(pic));
imshow(uint8(odsz));
colormap('gray'); 
imwrite(uint8(odsz), 'obrazeczek.jpg');
