obraz=(imread('lena.png'));
obr =(rgb2hsv(obraz));
obr(:,:,1)=im2uint16(obr(:,:,1));%pozwalamy by bylo wiecej wartosci niz 360
obr(:,:,2)=round(obr(:,:,2)*255);% mnozymy aby wartosci nie byly po przecinku
obr(:,:,3)=round(obr(:,:,3)*255);
hsv=zeros(65536,256,256,'logical'); %interesuje nas tylko wartosc 0 i 1 
kolory_h = 0;
tic
for x = 1:512
for y = 1:512
if(hsv(obr(x,y,1)+1,obr(x,y,2)+1,obr(x,y,3)+1)==0) %jesli w macierzy nie ma wpisanego koloru
kolory_h=kolory_h+1; %dodaj kolor
end
hsv(obr(x,y,1)+1,obr(x,y,2)+1,obr(x,y,3)+1)=1; %wpisz kolor
end
end
obr(:, :, 1) = obr(:, :, 1)/65536; %konwertujemy do wartosci po przecinku
obr(:, :, 2) = obr(:, :, 2)/255;
obr(:, :, 3) = obr(:, :, 3)/255;
obrazhsv=hsv2rgb(obr);
imwrite(obrazhsv,'lenahsv2.png','png');
toc
kolory_h
