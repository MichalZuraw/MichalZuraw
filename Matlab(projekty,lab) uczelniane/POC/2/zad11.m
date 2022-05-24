function [gbrg,bggr,grbg,rggb]=zad11 (image)
gbrg = demosaic(image,'gbrg');
bggr = demosaic(image,'bggr');
grbg = demosaic(image,'grbg');
rggb = demosaic(image,'rggb');
% figure
%  imshow(gbrg);
%  title('GBRG');
%  figure
%  imshow(bggr);
%  title('BGGR');
%  figure
%  imshow(grbg);
%  title('GRBG');
%  figure
%  imshow(rggb);
%  title('RGGB');
end