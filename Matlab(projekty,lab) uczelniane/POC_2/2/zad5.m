obraz=imread('lena.bmp');
a=20;
b=20;
j=0;
for u = 1:512
for v=1:512
szumik(u,v)=uint8(127+128*sin(u/a+v/b));
end
end
zaklocony=obraz+(szumik*0.5);
imshow(zaklocony);
s = fftshift(fft2(zaklocony));
o = fftshift(fft2(obraz));
widmoz=log(1+abs(s));
widmonormalne=log(1+abs(o));
figure
imshow(widmoz,[])
figure
imshow(widmonormalne,[])


img = im2double ( imread(’C:\Users\flami\OneDrive\Pulpit\POC\POC8\obrazy oryginalne\boat.bmp’));
a = 0.75;
b = 5;
z = zeros(512);
%zakłócenie sinus
for u = 1:512
for v=1:512
z(u,v)=uint8(127+128*sin(u/a(1)+v/b(1)));
end
end
z = double(z)/255;
z = z/5;
z = z-max(z(:))/2;
img = img+z;
%filtr pasmowozaporowy
for i = 1:512
for j = 1:512
gauss(i,j) = normpdf(norm([i-256,j-256]),110,30) ;
end
end
gauss = gauss - min(gauss(:));
gauss = gauss / max(gauss(:));
mask = imcomplement(gauss);
%Widmo
L1 = fftshift(fft2(img));
figure;
imshow(log(1+abs(L1)),[]) ;
%Filtracja
L1 = L1 .* maska ;
figure;
imshow(log(1+abs(L1)),[]) ;
%Wynik
img = real(ifft2(ifftshift(L1)));
figure;
imshow(img);




