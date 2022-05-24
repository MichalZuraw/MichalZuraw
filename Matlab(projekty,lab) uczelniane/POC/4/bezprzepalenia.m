%Import obrazu wzgledem podanej scieżki
o=imread('okno.png');
i=rgb2gray(o);
imwrite(i,'oknogrey.png','png');
%Implementacja Otsu:
image_gt = graythresh(o);
OTSU = imbinarize(i, image_gt);
imwrite(OTSU,'oknoOTSU.png','png');
%Implementacja algorytmu Floyda-Steinberga:
img=double(i);
img_gt2=image_gt;
[y,x] = size(img);
zer=zeros(y+1,x+1);
for i=1:1:y
    for j=2:1:x
        if((img(i,j)+zer(i,j)) < img_gt2)
            FS(i,j) = 0;
            er = img(i,j)+ zer(i,j);
        else
            FS(i,j) = 255;
            er = img(i,j) + zer(i,j) - 255;
        end
        zer(i,j+1) = zer(i,j+1) + 7/16*er;
        zer(i+1,j-1) = zer(i+1,j-1) + 3/16*er;
        zer(i+1,j) = zer(i+1,j) + 5/16*er;
        zer(i+1,j+1) = zer(i+1,j+1) + 1/16*er;
    end
end
img=uint8(img);
OTSU =uint8(OTSU);
imwrite(FS,'oknoMLAB.png','png');
FS =uint8(FS);
PSNR_OTSU = psnr(OTSU,img) %PSNR względem oryginalu
PSNR_FS = psnr(FS,img) %PSNR względem oryginalu
