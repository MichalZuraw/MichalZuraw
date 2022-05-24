clear all
obraz =imread('szak.png');
obrazh =rgb2hsv(obraz);
obrazh(:,:,1)=(obrazh(:,:,1)*360);
obrazh(:,:,2)=(obrazh(:,:,2)*255);
obrazh(:,:,3)=(obrazh(:,:,3)*255);
%2x2x2
osiem =(zeros(512,512,3));
h=2; 
s=2;
v=2;
osiem(:, :, 1) = floor(obrazh(:, :, 1)/round(360/h))*round(360/h) + floor(360/h/2);%wzor wraz z zaokragleniem
osiem(:, :, 2) = floor(obrazh(:, :, 2)/round(255/s))*round(255/s) + floor(255/s/2); %wzor wraz z zaokragleniem 
osiem(:, :, 3) = floor(obrazh(:, :, 3)/round(255/v))*round(255/v) + floor(255/v/2); %wzor wraz z zaokragleniem
osiem(:, :, 1) = osiem(:, :, 1)/360; %zamiana na wartosci z przecinkiem
osiem(:, :, 2) = osiem(:, :, 2)/255; %zamiana na wartosci z przecinkiem
osiem(:, :, 3) = osiem(:, :, 3)/255; %zamiana na wartosci z przecinkiem
%4x4x4
szesc =(zeros(512,512,3));
h=4;
s=4;
v=4;
szesc(:, :, 1) = floor(obrazh(:, :, 1)/round(360/h))*round(360/h) + floor(360/h/2); %wzor wraz z zaokragleniem
szesc(:, :, 2) = floor(obrazh(:, :, 2)/round(255/s))*round(255/s) + floor(255/s/2); %wzor wraz z zaokragleniem  
szesc(:, :, 3) = floor(obrazh(:, :, 3)/round(255/v))*round(255/v) + floor(255/v/2);  %wzor wraz z zaokragleniem
szesc(:, :, 1) = szesc(:, :, 1)/360;
szesc(:, :, 2) = szesc(:, :, 2)/255;
szesc(:, :, 3) = szesc(:, :, 3)/255;
%4x6x4
sto =(zeros(512,512,3));
h=4;
s=8;
v=4;
sto(:, :, 1) = floor(obrazh(:, :, 1)/round(360/h))*round(360/h) + floor(360/h/2);
sto(:, :, 2) = floor(obrazh(:, :, 2)/round(255/s))*round(255/s) + floor(255/s/2);  
sto(:, :, 3) = floor(obrazh(:, :, 3)/round(255/v))*round(255/v) + floor(255/v/2); 
sto(:, :, 1) = sto(:, :, 1)/360;
sto(:, :, 2) = sto(:, :, 2)/255;
sto(:, :, 3) = sto(:, :, 3)/255;
%10x5x5+6
dwiescie =(zeros(512,512,3));
h=10;
s=5;
v=5;
for i=1:512
   for j=1:512
       if(dwiescie(i,j,2)==0) %jeśli obraz ma głebie 0
           dwiescie(i, j, 1) = obrazh(i, j, 1); %przepisz nasycenie
           dwiescie(i, j, 2) = obrazh(i, j, 2); %przepisz glebie
           dwiescie(i, j, 3) = (floor(obrazh(i, j, 3)/ceil(255/6)))*(255/6) + (255/6/2);           
       else
           dwiescie(i, j, 1) = (floor(obrazh(i, j, 1)/ceil(360/h)))*(360/h) + (360/h/2);  
           dwiescie(i, j, 2) = (floor(obrazh(i, j, 2)/ceil(255/s)))*(255/s) + (255/s/2); 
           dwiescie(i, j, 3) = (floor(obrazh(i, j, 3)/ceil(255/v)))*(255/v) + (255/v/2); 
       end
   end
end  
 dwiescie(:, :, 1) = dwiescie(:, :, 1)/360;
 dwiescie(:, :, 2:3) = dwiescie(:, :, 2:3)/255;
%
osiem=hsv2rgb(double(osiem));
osiem1=im2uint8(osiem);
imwrite(osiem1,'szakhsv8.png','png');
dwaxdwa=psnr(osiem1,obraz)
%
szesc=hsv2rgb(double(szesc));
szesc1=im2uint8(szesc);
imwrite(szesc1,'szakhsv64.png','png');
czteryxczter=psnr(szesc1,obraz)
%
sto=hsv2rgb(double(sto));
sto1=im2uint8(sto);
imwrite(sto1,'szakhsv128.png','png');
czteryxszesc=psnr(sto1,obraz)
%
dwiescie=hsv2rgb(double(dwiescie));
dwiescie1=im2uint8(dwiescie);
imwrite(dwiescie1,'lenahsv10x5.png','png');
dziesiecxpiec=psnr(dwiescie1,obraz)