function images = modifyIm(imIn)
images.o1=imrotate(imIn,30,'crop');

sc=int8(50-100*rand(4,2));
images.o2=imtranslate(imrotate(imIn,-110,'crop'),sc(1,:));

temp=imresize(imIn, 0.5);
[M,N]=size(temp);
m=round(M/2);
n=round(N/2);
images.o3=zeros(512, 512);
images.o3(256-m:256-m+M-1, 256-n:256-n+N-1)=temp;
images.o3=imtranslate(imrotate(images.o3,90,'crop'),sc(3,:));


temp=imresize(imIn, 0.9);
[M,N]=size(temp);
m=round(M/2);
n=round(N/2);
images.o4=zeros(512, 512);
images.o4(256-m:256-m+M-1, 256-n:256-n+N-1)=temp;
images.o4=imtranslate(imrotate(images.o4,-145,'crop'),sc(2,:));
end