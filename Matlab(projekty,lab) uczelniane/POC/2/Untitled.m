function zad1= bayer (image)
gbrg = demosaic(image,'gbrg');
bggr = demosaic(image,'bggr');
grbg = demosaic(image,'grbg');
rggb = demosaic(image,'rggb');
figure
imshow(gbrg);
title('GBRG');
figure
imshow(bggr);
title('BGGR');
figure
imshow(grbg);
title('GRBG');
figure
imshow(rggb);
title('RGGB');

image2 = imread("IMG_7116_srgb_CFA.png");
gbrg = demosaic(image2,'gbrg');
bggr = demosaic(image2,'bggr');
grbg = demosaic(image2,'grbg');
rggb = demosaic(image2,'rggb');
figure
imshow(gbrg);
title('GBRG');
figure
imshow(bggr);
title('BGGR');
figure
imshow(grbg);
title('GRBG');
figure
imshow(rggb);
title('RGGB');