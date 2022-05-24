img=imread('oknogrey.png');
%Implementacja Otsu:
image_gt = graythresh(img);
OTSU = im2uint8(imbinarize(img, image_gt));
wartosc=psnr(OTSU,img);
imwrite(OTSU,'oknoOTSU.png','png');