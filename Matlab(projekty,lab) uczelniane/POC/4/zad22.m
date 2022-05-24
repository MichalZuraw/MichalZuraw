%clc 
%clear all 
img=imread('lena.png');
M = size(double(img), 1);
N = size(double(img), 2);

rk = 2;
gk = 4;
bk = 2;
kwant_tab = zeros(rk,gk,bk);
colors_rgb = zeros(rk,gk,bk,3);
colors_rgb_fs = 0;
img_rgb_fs = double(img);
red = 256/rk;
green = 256/gk;
blue = 256/bk;

for i=1:1:rk
    for j=1:1:gk
        for k=1:1:bk
        colors_rgb(i,j,k,1)=round((i-1)*red+red/2);    
        colors_rgb(i,j,k,2)=round((j-1)*green+green/2);
        colors_rgb(i,j,k,3)=round((k-1)*blue+blue/2);  
        end
    end
end

for i=1:1:M
    for j=1:1:N
        wym1 = 1+floor(img_rgb_fs(i,j,1)/red);
        wym2 = 1+floor(img_rgb_fs(i,j,2)/green);
        wym3 = 1+floor(img_rgb_fs(i,j,3)/blue);

        if(wym1 > rk)
            wym1=rk;
        end
        if(wym2 > gk)
            wym2=gk;
        end
        if(wym3 > bk)
            wym3=bk;
        end
         
        old1=img_rgb_fs(i,j,1);
        old2=img_rgb_fs(i,j,2);
        old3=img_rgb_fs(i,j,3);
        
        new1=colors_rgb(wym1,wym2,wym3,1);
        new2=colors_rgb(wym1,wym2,wym3,2);
        new3=colors_rgb(wym1,wym2,wym3,3);

        img_rgb_fs(i,j,1)=new1;
        img_rgb_fs(i,j,2)=new2;
        img_rgb_fs(i,j,3)=new3;
        
        if(i~=1 && i~=M && j~=1 && j~=N)
            pic1= old1-new1;
            pic2= old2-new2;
            pic3= old3-new3;
            
            img_rgb_fs(i,j+1,1) = round(img_rgb_fs(i,j+1,1) + 7/16*pic1);
            img_rgb_fs(i,j+1,2) = round(img_rgb_fs(i,j+1,2) + 7/16*pic2);
            img_rgb_fs(i,j+1,3) = round(img_rgb_fs(i,j+1,3) + 7/16*pic3);
            img_rgb_fs(i+1,j-1,1) = round(img_rgb_fs(i+1,j-1,1) + 3/16*pic1);
            img_rgb_fs(i+1,j-1,2) = round(img_rgb_fs(i+1,j-1,2) + 3/16*pic2);
            img_rgb_fs(i+1,j-1,3) = round(img_rgb_fs(i+1,j-1,3) + 3/16*pic3);
            img_rgb_fs(i+1,j,1) = round(img_rgb_fs(i+1,j,1) + 5/16*pic1);
            img_rgb_fs(i+1,j,2) = round(img_rgb_fs(i+1,j,2) + 5/16*pic2);
            img_rgb_fs(i+1,j,3) = round(img_rgb_fs(i+1,j,3) + 5/16*pic3);
            img_rgb_fs(i+1,j+1,1) = round(img_rgb_fs(i+1,j+1,1) + 1/16*pic1);
            img_rgb_fs(i+1,j+1,2) = round(img_rgb_fs(i+1,j+1,2) + 1/16*pic2);
            img_rgb_fs(i+1,j+1,3) = round(img_rgb_fs(i+1,j+1,3) + 1/16*pic3);
            
            for l=1:1:3
                for m=1:1:3
                    if(img_rgb_fs(i-2+l,j-2+m,1)<0)
                        img_rgb_fs(i-2+l,j-2+m,1)=0;
                    end 
                    if(img_rgb_fs(i-2+l,j-2+m,1)>255)
                        img_rgb_fs(i-2+l,j-2+m,1)=255;
                    end 
                    if(img_rgb_fs(i-2+l,j-2+m,2)<0)
                        img_rgb_fs(i-2+l,j-2+m,2)=0;
                    end  
                    if(img_rgb_fs(i-2+l,j-2+m,1)>255)
                        img_rgb_fs(i-2+l,j-2+m,1)=255;
                    end 
                    if(img_rgb_fs(i-2+l,j-2+m,3)<0)
                        img_rgb_fs(i-2+l,j-2+m,3)=0;
                    end  
                    if(img_rgb_fs(i-2+l,j-2+m,1)>255)
                        img_rgb_fs(i-2+l,j-2+m,1)=255;
                    end 
                end
            end    
        end
        
        if kwant_tab(wym1,wym2,wym3)==0
            kwant_tab(wym1,wym2,wym3)=1;
            colors_rgb_fs=colors_rgb_fs+1;
        end    
    end
end

img_rgb_fs =uint8(img_rgb_fs);
 psnr16=psnr(img_rgb_fs, img);
%psnr256=psnr(img_rgb_fs, img)
imwrite(img_rgb_fs,'lenargb16FS.png');


