clear all
clc
gwiazda=imbinarize(rgb2gray(imread("gwiazda.png")));
romb=imbinarize(rgb2gray(imread("romb.png")));
trojkat=imbinarize(rgb2gray(imread("trojkat.png")));
gwiazdaZestaw=modifyIm(gwiazda);
rombZestaw=modifyIm(romb);
trojkatZestaw=modifyIm(trojkat);
img1 = gwiazda;
img1_1 = gwiazdaZestaw.o1;
img1_2 = gwiazdaZestaw.o2;
img1_3 = gwiazdaZestaw.o3;
img1_4 = gwiazdaZestaw.o4;
img2 = romb;
img2_1 = rombZestaw.o1;
img2_2 = rombZestaw.o2;
img2_3 = rombZestaw.o3;
img2_4 = rombZestaw.o4;
img3 = trojkat;
img3_1 = trojkatZestaw.o1;
img3_2 = trojkatZestaw.o2;
img3_3 = trojkatZestaw.o3;
img3_4 = trojkatZestaw.o4;
W = licz_wskaznik(img1);
W1(1,:) = W;
W = licz_wskaznik(img1_1);
W1(2,:) = W;
W = licz_wskaznik(img1_2);
W1(3,:) = W;
W = licz_wskaznik(img1_3);
W1(4,:) = W;
W = licz_wskaznik(img1_4);
W1(5,:) = W;
W = licz_wskaznik(img2);
W2(1,:) = W;
W = licz_wskaznik(img2_1);
W2(2,:) = W;
W = licz_wskaznik(img2_2);
W2(3,:) = W;
W = licz_wskaznik(img2_3);
W2(4,:) = W;
W = licz_wskaznik(img2_4);
W2(5,:) = W;
W = licz_wskaznik(img3);
W3(1,:) = W;
W = licz_wskaznik(img3_1);
W3(2,:) = W;
W = licz_wskaznik(img3_2);
W3(3,:) = W;
W = licz_wskaznik(img3_3);
W3(4,:) = W;
W = licz_wskaznik(img3_4);
W3(5,:) = W;
figure
hold on
plot(W1(:,4),W1(:,5),'o','MarkerSize', 10);
plot(W2(:,4),W2(:,5),'*','MarkerSize', 10);
plot(W3(:,4),W3(:,5),'x','MarkerSize', 10);
xlabel("BB")
ylabel("D")
legend("gwiazda","romb","trojkat");
figure
hold on
plot(W1(:,7),W1(:,8),'o','MarkerSize', 10);
plot(W2(:,7),W2(:,8),'*','MarkerSize', 10);
plot(W3(:,7),W3(:,8),'x','MarkerSize', 10);
xlabel("M")
ylabel("Lp1")
legend("gwiazda","romb","trojkat");
figure
hold on
plot(W1(:,1),W1(:,10),'o','MarkerSize', 10);
plot(W2(:,1),W2(:,10),'*','MarkerSize', 10);
plot(W3(:,1),W3(:,10),'x','MarkerSize', 10);
xlabel("K")
ylabel("MZ")
legend("gwiazda","romb","trojkat");
figure

plot3(W1(:,4),W1(:,8),W1(:,10),'o','MarkerSize', 10);
hold on
grid on
plot3(W2(:,4),W2(:,8),W2(:,10),'*','MarkerSize', 10);
plot3(W3(:,4),W3(:,8),W3(:,10),'x','MarkerSize', 10);
xlabel("BB")
ylabel("Lp1")
zlabel("MZ")
legend("gwiazda","romb","trojkat");
