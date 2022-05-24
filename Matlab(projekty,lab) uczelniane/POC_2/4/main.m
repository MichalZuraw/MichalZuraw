clear all
clc
close all
img=rgb2gray(imread("O1.png"));
img1=rgb2gray(imread("O2.png"));
img2=rgb2gray(imread("O3.png"));
O1op=graythresh(img)*255;
O2op=graythresh(img1)*255;
O3op=graythresh(img2)*255;
img=binarka(img,O1op);
img1=binarka(img1,O2op);
img2=binarka(img2,O3op);

 [K,M,MZ,C]=calc(img);
 [K1,M1,MZ1,C1]=calc(img1);
 [K2,M2,MZ2,C2]=calc(img2);
 
zdjecie=img;
zdjecie1=img1;
zdjecie2=img2;
% coefficientVector=zeros(360,4);
% coefficientVector1=zeros(360,4);
% coefficientVector2=zeros(360,4);
%  
% for i=1:360
%     zdjecie=imrotate(img,i);
%     [coefficientVector(i,1),coefficientVector(i,2),coefficientVector(i,3),coefficientVector(i,4)]=calc(zdjecie);
% end
% for j=1:360
%     zdjecie1=imrotate(img1,j);
%     [coefficientVector1(j,1),coefficientVector1(j,2),coefficientVector1(j,3),coefficientVector1(j,4)]=calc(zdjecie1);
% end
% for k=1:360
%     zdjecie2=imrotate(img2,k);
%     [coefficientVector2(k,1),coefficientVector2(k,2),coefficientVector2(k,3),coefficientVector2(k,4)]=calc(zdjecie2);
% end
% 
% figure
% plot(1:360,coefficientVector(:,1));
% hold on
% plot(1:360,coefficientVector1(:,1));
% hold on
% plot(1:360,coefficientVector2(:,1));
% title('rotacja-K coefficient');
% legend("trojkat","kwadrat","gwiazda");
% 
% figure(2);
% plot(1:360,coefficientVector(:,2));
% hold on
% plot(1:360,coefficientVector1(:,2));
% hold on
% plot(1:360,coefficientVector2(:,2));
% title('rotacja-M coefficient');
% legend("trojkat","kwadrat","gwiazda");
% 
% figure(3);
% plot(1:360,coefficientVector(:,3));
% hold on
% plot(1:360,coefficientVector1(:,3));
% hold on
% plot(1:360,coefficientVector2(:,3));
% title('rotacja-MZ coefficient');
% legend("trojkat","kwadrat","gwiazda");
% 
% figure(4);
% plot(1:360,coefficientVector(:,4));
% hold on
% plot(1:360,coefficientVector1(:,4));
% hold on
% plot(1:360,coefficientVector2(:,4));
% title('rotacja-C coefficient');
% legend("trojkat","kwadrat","gwiazda");
% 
% coefficientVector=zeros(16,4);
% coefficientVector1=zeros(16,4);
% coefficientVector2=zeros(16,4);
% 
% for i=1:16
%    % K, Mz, C, M, Lp
%     size1=imresize(zdjecie,i);
%     [M,N] = size (size1);
%     m = M/2; 
%     n = N/2;
%     size1 = reshape(size1(m-255:m+256,n-255:n+256),[512,512]);
%     [coefficientVector(i,1), coefficientVector(i,2), coefficientVector(i,3), coefficientVector(i,4)]=calc(size1);
% end
% 
% for i=1:16
%     %K, Mz, C, M, Lp
%     size2=imresize(zdjecie1,i);
%     [M,N] = size (size2);
%     m = M/2; 
%     n = N/2;
%     size2 = reshape(size2(m-255:m+256,n-255:n+256),[512,512]);
%     [coefficientVector1(i,1), coefficientVector1(i,2), coefficientVector1(i,3), coefficientVector1(i,4)]=calc(size2);
% end
% 
% for i=1:16
%     %K, Mz, C, M, Lp
%     size3=imresize(zdjecie2,i);
%     [M,N] = size (size3);
%     m = M/2; 
%     n = N/2;
%     size3 = reshape(size3(m-255:m+256,n-255:n+256),[512,512]);
%     [coefficientVector2(i,1), coefficientVector2(i,2), coefficientVector2(i,3), coefficientVector2(i,4)]=calc(size3);
% end
% 
% figure
% plot(1:16,coefficientVector(:,1));
% hold on
% plot(1:16,coefficientVector1(:,1));
% hold on
% plot(1:16,coefficientVector2(:,1));
% title('resize-K coefficient');
% legend("trojkat","kwadrat","gwiazda");
% 
% figure(2);
% plot(1:16,coefficientVector(:,2));
% hold on
% 
% plot(1:16,coefficientVector1(:,2));
% hold on
% 
% plot(1:16,coefficientVector2(:,2));
% title('resize-M coefficient');
% legend("trojkat","kwadrat","gwiazda");
% % 
% 
% figure(3);
% plot(1:16,coefficientVector(:,3));
% hold on
% plot(1:16,coefficientVector1(:,3));
% hold on
% 
% plot(1:16,coefficientVector2(:,3));
% title('resize-MZ coefficient');
% legend("trojkat","kwadrat","gwiazda");
% figure(4);
% 
% plot(1:16,coefficientVector(:,4));
% hold on
% plot(1:16,coefficientVector1(:,4));
% hold on
% 
% plot(1:16,coefficientVector2(:,4));
% title('resize-C coefficient');
% legend("trojkat","kwadrat","gwiazda");

coefficientVector=zeros(50,4);
coefficientVector1=zeros(50,4);
coefficientVector2=zeros(50,4); 
random = int8(-150 + 250.*rand(50,2));


for i=1:50
    %K, Mz, C, M, Lp
    zdjecie=imtranslate(zdjecie,[1,1]);
    [coefficientVector(i,1), coefficientVector(i,2), coefficientVector(i,3), coefficientVector(i,4)]=calc(zdjecie);
    
end

for i=1:50
    %K, Mz, C, M, Lp
    zdjecie1=imtranslate(zdjecie1,[1,1]);
    [coefficientVector1(i,1), coefficientVector1(i,2), coefficientVector1(i,3), coefficientVector1(i,4)]=calc(zdjecie1);
    
end

for i=1:50
    %K, Mz, C, M, Lp
    zdjecie2=imtranslate(zdjecie2,[1,1]);
    [coefficientVector2(i,1), coefficientVector2(i,2), coefficientVector2(i,3), coefficientVector2(i,4)]=calc(zdjecie2);
    
end
figure
plot(1:50,coefficientVector(:,1));
hold on
plot(1:50,coefficientVector1(:,1));
hold on
plot(1:50,coefficientVector2(:,1));
title('translate-K coefficient');
legend("trojkat","kwadrat","gwiazda");

figure(2);
plot(1:50,coefficientVector(:,2));
hold on

plot(1:50,coefficientVector1(:,2));
hold on

plot(1:50,coefficientVector2(:,2));
title('translate-M coefficient');
legend("trojkat","kwadrat","gwiazda");


figure(3);
plot(1:50,coefficientVector(:,3));
hold on
plot(1:50,coefficientVector1(:,3));
hold on

plot(1:50,coefficientVector2(:,3));
title('translate-MZ coefficient');
legend("trojkat","kwadrat","gwiazda");
figure(4);

plot(1:50,coefficientVector(:,4));
hold on
plot(1:50,coefficientVector1(:,4));
hold on

plot(1:50,coefficientVector2(:,4));
title('translate-C coefficient');
legend("trojkat","kwadrat","gwiazda");