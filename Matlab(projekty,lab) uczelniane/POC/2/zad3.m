function w=zad3(image)
[R,G,B]=seperate(image);
[wiersz,kolumna] = size(image);
RR=zeros([wiersz,kolumna]);
GG=zeros([wiersz,kolumna]);
BB=zeros([wiersz,kolumna]);
for i = 2:wiersz-1
for j = 2:kolumna-1
    
if G(i,j)==0  
  GG(i,j)=(G(i-1,j)+G(i+1,j)+G(i,j-1)+G(i,j+1))/4;
else
    GG(i,j)=G(i,j);
end

if R(i,j)==0 && R(i-1,j-1)~=0 && R(i+1,j+1)~=0 && R(i+1,j-1)~=0 && R(i-1,j+1)~=0 
  RR(i,j)=(R(i-1,j-1) + R(i+1,j+1) + R(i+1,j-1) + R(i-1,j+1))/4;
elseif R(i+1,j)~=0 
      RR(i,j)=(R(i-1,j)+R(i+1,j))/2;
elseif R(i,j+1)~=0 && R(i,j-1)~=0
      RR(i,j)=(R(i,j+1)+R(i,j-1))/2;
else
    RR(i,j)=R(i,j);
end
 
if B(i,j)==0 && B(i-1,j-1)~=0 && B(i+1,j+1)~=0 && B(i+1,j-1)~=0 && B(i-1,j+1)~=0 
  BB(i,j)=(B(i-1,j-1) + B(i+1,j+1) + B(i+1,j-1) + B(i-1,j+1))/4;
elseif B(i+1,j)~=0 
      BB(i,j)=(B(i-1,j)+B(i+1,j))/2;
elseif B(i,j+1)~=0 && B(i,j-1)~=0
      BB(i,j)=(B(i,j+1)+B(i,j-1))/2;
else
    BB(i,j)=B(i,j);
end

end
end
w(:,:,1)=RR;
w(:,:,2)=GG;
w(:,:,3)=BB;
w=uint8(w);
%imshow(w);

end
