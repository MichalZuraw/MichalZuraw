pic=imread('33.png');
hasla = load('hasla.mat').hasla;
pic=double(pic);
picpic=reshape(pic,1,[]);
figure;
hist(pic);
title('pic');
figure;
hist(picpic);
title('picpic');
k=1;
key=[];
%autocorr(black,35) %haslo ma dlugosc 30
for i=1:5000    
   if length(hasla{i})==30
    key{k}=hasla{i};
    k=k+1;
   end
end
klucz=double(key{1});
odsz=fDejednorazowy(picpic, klucz);
hOdsz=histogram(odsz,255).Values(255);

for h=2:length(key)
    klucz=double(key{h});
    odsz=fDejednorazowy(picpic, klucz);
    old=histogram(odsz,255).Values(255);
    if old<hOdsz
        hOdsz=old;
        bestH=h;
    end
    
end
klucz=double(key{bestH});
odsz=fDejednorazowy(picpic, klucz);
figure;
hist(odsz);
title('odsz przed reshape');
odsz=reshape(odsz,size(pic));
figure;
hist(odsz);
title('odsz');
imshow(uint8(odsz));
colormap('gray'); 
imwrite(uint8(odsz), 'obrazeczek.jpg');
