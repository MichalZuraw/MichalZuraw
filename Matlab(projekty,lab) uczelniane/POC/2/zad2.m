function int=zad2(image)
[R,G,B]=seperate(image);
[wiersz,kolumna] = size(image);

RR=zeros([wiersz,kolumna]);
GG=zeros([wiersz,kolumna]);
BB=zeros([wiersz,kolumna]);

for i = 1:wiersz-1
    for j = 1:kolumna-1
        %R
        if i==wiersz && j~=kolumna
        if(R(i,j)==0)
              RR(i,j)=R(i,j+1);
              else
              RR(i,j)=R(i,j);
        end
        elseif i~=wiersz && j==kolumna
        if(R(i,j)==0)
              RR(i,j)=R(i+1,j);
              else
              RR(i,j)=R(i,j);
              end
        elseif i==wiersz && j==kolumna
        RR(i,j)=R(i,j); 
        
        else 
            if(R(i,j)==0)
               if R(i,j+1)~=0
                  RR(i,j) = R(i,j+1);
               elseif R(i+1,j+1)~=0
                  RR(i,j)=R(i+1,j+1);
               else
                  RR(i,j)=R(i+1,j);
               end
            else 
               RR(i,j)=R(i,j);
            end
        end 
        end
end

    
for i = 1:wiersz-1
    for j = 1:kolumna-1
        %G
        if i==wiersz && j~=kolumna
        if(G(i,j)==0)
              GG(i,j)=G(i,j+1);
              else
              GG(i,j)=G(i,j);
        end
        elseif i~=wiersz && j==kolumna
        if(G(i,j)==0)
              GG(i,j)=G(i+1,j);
              else
              GG(i,j)=G(i,j);
              end
        elseif i==wiersz && j==kolumna
        GG(i,j)=G(i,j); 
        
        else 
            if(G(i,j)==0)
               if G(i,j+1)~=0
                  GG(i,j) = G(i,j+1);
               elseif G(i+1,j+1)~=0
                  GG(i,j)=G(i+1,j+1);
               else
                  GG(i,j)=G(i+1,j);
               end
            else 
               GG(i,j)=G(i,j);
            end
        end 
        end
end
    
for i = 1:wiersz-1
    for j = 1:kolumna-1
        %B
        if i==wiersz && j~=kolumna
        if(B(i,j)==0)
              BB(i,j)=B(i,j+1);
              else
              BB(i,j)=B(i,j);
        end
        elseif i~=wiersz && j==kolumna
        if(B(i,j)==0)
              BB(i,j)=B(i+1,j);
              else
              BB(i,j)=B(i,j);
              end
        elseif i==wiersz && j==kolumna
        BB(i,j)=B(i,j); 
        
        else 
            if(B(i,j)==0)
               if B(i,j+1)~=0
                  BB(i,j) = B(i,j+1);
               elseif B(i+1,j+1)~=0
                  BB(i,j)=B(i+1,j+1);
               else
                  BB(i,j)=B(i+1,j);
               end
            else 
               BB(i,j)=B(i,j);
            end
        end 
        end
end
int(:,:,1)=RR;
int(:,:,2)=GG;
int(:,:,3)=BB;
int=uint8(int);
% imshow(int);
% title('Najblizszy sasiad');
end
