obraz=imread('szak.png');
obrazh=rgb2hsv(obraz);
marcinh=kwantyzacjaHSV(obrazh,10,5,5);
marcin=hsv2rgb(marcinh);
imshow(marcin);
imwrite(marcin,'szakhsv10x5.png','png');
marcin=uint8(marcin);
