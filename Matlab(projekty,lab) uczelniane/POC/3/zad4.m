obraz =imread('babon.png');
obrazh =rgb2hsv(obraz);
obrazh(:,:,1)=round(obrazh(:,:,1)*360);
obrazh(:,:,2)=round(obrazh(:,:,2)*255);
obrazh(:,:,3)=round(obrazh(:,:,3)*255);
%2x2x2
osiem =(zeros(512,512,3));
for x = 1:512;
for y = 1:512;
osiem(x,y,1)=180*round((obrazh(x,y,1)+90)/180)-90;
osiem(x,y,2)=128*round((obrazh(x,y,2)+64)/128)-64;
osiem(x,y,3)=128*round((obrazh(x,y,3)+64)/128)-64;
end
end
osiem(:,:,1)=osiem(:,:,1)/360;
osiem(:,:,2)=osiem(:,:,2)/255;
osiem(:,:,3)=osiem(:,:,3)/255;
%4x4x4
szesc =(zeros(512,512,3));
for x = 1:512;
for y = 1:512;
szesc(x,y,1)=90*round((obrazh(x,y,1)+45)/90)-45;
szesc(x,y,2)=64*round((obrazh(x,y,2)+32)/64)-32;
szesc(x,y,3)=64*round((obrazh(x,y,3)+32)/64)-32;
end
end
szesc(:,:,1)=szesc(:,:,1)/360;
szesc(:,:,2)=szesc(:,:,2)/255;
szesc(:,:,3)=szesc(:,:,3)/255;

%4x6x4
sto =(zeros(512,512,3));
for x = 1:512;
for y = 1:512;
sto(x,y,1)=90*round((obrazh(x,y,1)+45)/90)-45;
sto(x,y,2)=42*round((obrazh(x,y,2)+21)/42)-21;
sto(x,y,3)=64*round((obrazh(x,y,3)+32)/64)-32;
end
end
sto(:,:,1)=sto(:,:,1)/360;
sto(:,:,2)=sto(:,:,2)/255;
sto(:,:,3)=sto(:,:,3)/255;

%10x5x5+6
cudak =(zeros(512,512,3));
for x = 1:512;
for y = 1:512;
if(cudak(x,y,2)==0)
 cudak(x,y,1)=obrazh(x,y,1);
 cudak(x,y,2)=obrazh(x,y,2);
 cudak(x,y,3)=43*round((obrazh(x,y,3)+22)/43)-22;
else
cudak(x,y,1)=36*round((obrazh(x,y,1)+18)/36)-18;
cudak(x,y,2)=50*round((obrazh(x,y,2)+25)/50)-25;
cudak(x,y,3)=50*round((obrazh(x,y,3)+25)/50)-25;
end
end
end

cudak(:,:,1)=cudak(:,:,1)/360;
cudak(:,:,2)=cudak(:,:,2)/255;
cudak(:,:,3)=cudak(:,:,3)/255;


% osiem=hsv2rgb(osiem);
% osiem=im2uint8(osiem);
% imwrite(osiem,'lenahsv8.png','png');
% dwaxdwa=psnr(osiem,obraz)
% %
% szesc=hsv2rgb(szesc);
% szesc=im2uint8(szesc);
% imwrite(szesc,'lenahsv64.png','png');
% czteryxczter=psnr(szesc,obraz)
% %
% sto=hsv2rgb(sto);
% sto=im2uint8(sto);
% imwrite(sto,'lenahsv96.png','png');
% czteryxszesc=psnr(sto,obraz)
%
cudak=hsv2rgb(cudak);
cudak=im2uint8(cudak);
imwrite(cudak,'kamilowy.png','png');
dziesiecxpiec=psnr(cudak,obraz)