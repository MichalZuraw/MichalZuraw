clear all
obraz=imread('szak.png');
%2x4x2
osiem=uint8(zeros(512,512,3)); %zaokraglenie wartosci
for x = 1:512;
for y = 1:512;
osiem(x,y,1)=128*((obraz(x,y,1)+64)/128)-64;%dzielimy zbior na dwa podzbiory
osiem(x,y,2)=64*((obraz(x,y,2)+32)/64)-32;
osiem(x,y,3)=128*((obraz(x,y,3)+64)/128)-64;
end
end
dwaxdwa=psnr(osiem,obraz)
% %4x4x4
% szesnascie =uint8(zeros(512,512,3)); %zaokraglenie wartosci
% for x = 1:512;
% for y = 1:512;
% szesnascie(x,y,1)=64*((obraz(x,y,1)+32)/64)-32;%dzielimy zbior na cztery podzbiory
% szesnascie(x,y,2)=64*((obraz(x,y,2)+32)/64)-32;
% szesnascie(x,y,3)=64*((obraz(x,y,3)+32)/64)-32;
% end
% end
% czteryxcztery=psnr(szesnascie,obraz)
% %4x8x4
% sto =uint8(zeros(512,512,3)); %zaokraglenie wartosci
% for x = 1:512;
% for y = 1:512;
% sto(x,y,1)=64*((obraz(x,y,1)+32)/64)-32;%dzielimy zbior na cztery podzbiory
% sto(x,y,2)=32*((obraz(x,y,2)+16)/32)-16;%dzielimy zbior na osiem podzbiory
% sto(x,y,3)=64*((obraz(x,y,3)+32)/64)-32;%dzielimy zbior na cztery podzbiory
% end
% end
% czteryxczesc=psnr(sto,obraz)
% %8x8x4
% dwiescie =uint8(zeros(512,512,3));%zaokraglenie wartosci
% for x = 1:512;
% for y = 1:512;
% dwiescie(x,y,1)=32*((obraz(x,y,1)+16)/32)-16;%dzielimy zbior na osiem podzbiory
% dwiescie(x,y,2)=32*((obraz(x,y,2)+16)/32)-16;%dzielimy zbior na osiem podzbiory
% dwiescie(x,y,3)=64*((obraz(x,y,3)+32)/64)-32;%dzielimy zbior na cztery podzbiory
% end
% end
% osiemxosiem=psnr(dwiescie,obraz)
imwrite(osiem,'szakrgb16.png','png');
% imwrite(szesnascie,'peppersrgb64.png','png');
% imwrite(sto,'peppersrgb128.png','png');
% imwrite(dwiescie,'peppersrgb256.png','png');
