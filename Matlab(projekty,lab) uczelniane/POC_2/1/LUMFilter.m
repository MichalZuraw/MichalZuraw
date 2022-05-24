function imOut = LUMFilter(imIn, r, k)
if mod(r,2)==0
    disp("Bledny parametr okreslajacy otoczenie");
    imOut=[];
    return
end
if k>floor(r*r/2)
    disp("Bledny parametr k");
    imOut=[];
    return
end
imOut=imIn;
[rows, cols, d]=size(imOut);
e=(r-1)/2;
for i=1:rows
    for j=1:cols
        for z=1:d
            temp=zeros(r,r);
            if i<e+1 
                iO=1;
                iK=i+e;
                mO=r-i-e+1;
                mK=r;
            elseif i>rows-e
                iO=i-e;
                iK=rows;
                mO=1;
                mK=rows+e-i+1;
            else
                iO=i-e;
                iK=i+e;
                mO=1;
                mK=r;
            end
            if j<e+1
                jO=1;
                jK=j+e;
                nO=r-j-e+1;
                nK=r;
            elseif j>cols-e
                jO=j-e;
                jK=cols;
                nO=1;
                nK=cols+e-j+1;
            else
                jO=j-e;
                jK=j+e;
                nO=1;
                nK=r;
            end
            temp(mO:mK,nO:nK)=imIn(iO:iK,jO:jK,z);
            temp=sort(reshape(temp,1,[]));
            l=ceil(length(temp)/2);

                imOut(i,j,z)=median([temp(l-k) temp(l+k) imIn(i,j,z)]);
        end
    end
end
end