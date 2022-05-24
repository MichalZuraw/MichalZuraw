
% dz1=(imread('man.bmp'));
% A=figure;
% subplot(2,5,1)
% imshow(dz1)
% xlabel('Oryginał 1(O1)');
% ylabel('O1');
% 
% L1=fftshift(fft2(dz1));
% widmo = log(1+abs(L1));
% subplot(2,5,6)
% imshow((widmo),[]);
% ylabel('Widmo mocy');
% 
% z=1;
% for i=1:10
%     if(i==1||i==2||i==5||i==10)
%         z=z+1; 
%         h = fspecial('gaussian',i,2);
%         subplot(2,5,z)
%         impofiltrze = imfilter(dz1, h);
%         
%         s1=strcat('Iteracja',num2str(i));
%         imshow(impofiltrze,[])
%         xlabel(s1);
% 
%         subplot(2,5,z+5)
%         L1=fftshift(fft2(impofiltrze));
%         widmo = log(1+abs(L1));
%         imshow((widmo),[]);
%     end
% end
% saveas(A,'manrozmytyzad3.png');
% imwrite(impofiltrze,'rozmyty10iteracjaman.png'); 
%Wczytanie obrazów i wyostrzenie
%OBRAZ 1
dz1=(imread('lena.bmp'));
rozmytydz1=(imread('rozmyty10iteracjalena.png'));
A=figure;
subplot(2,5,1)
imshow(dz1)
xlabel('Oryginał 1(O1)');
ylabel('O1');
L1=fftshift(fft2(dz1));
widmo = log(1+abs(L1));
subplot(2,5,6)
imshow((widmo),[]);
ylabel('Widmo mocy');
for i=1:4
    h = fspecial('laplacian');
    if (i==1)
        impofiltrze = imfilter(rozmytydz1, h);
        obraz=rozmytydz1-impofiltrze;
    end
    if (i~=1)
        impofiltrze = imfilter(impofiltrze, h);
        obraz=rozmytydz1-impofiltrze;
    end
        subplot(2,5,i+1)
        s1=strcat('Iteracja',num2str(i));
        imshow(obraz,[])
        xlabel(s1);
        subplot(2,5,i+6)
        L1=fftshift(fft2(obraz));
        widmo = log(1+abs(L1));
        imshow((widmo),[]);
end
saveas(A,'wyostrzonydzzad3lena.png');


