obraz=uint16(imread('widok.png'));
rgb=uint16(zeros(256,256,256)); %stworzenie pustej macierzy wielkosci obrazu
kolory = 0;
tic
for x = 1:512;
for y = 1:512;
 if(rgb(obraz(x,y,1)+1,obraz(x,y,2)+1,obraz(x,y,3)+1)==0)%jeśli w macierzy nie ma wpisanego koloru
 kolory=kolory+1;%dodaj kolor
end
rgb(obraz(x,y,1)+1,obraz(x,y,2)+1,obraz(x,y,3)+1)=1;%wstaw jedynke w odpowiednim miejsciu pustej macierzy
end
end
kolory
toc


