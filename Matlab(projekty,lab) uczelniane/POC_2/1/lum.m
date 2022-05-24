function med=lum(obraz, k)
for i=2:size(obraz,1)-1
for j=2:size(obraz,2)-1
wektor = ([obraz(i-1,j-1), obraz(i,j-1), obraz(i+1,j-1), obraz(i-1,j), obraz(i,j), obraz(i+1,j), obraz(i-1,j+1), obraz(i,j+1), obraz(i+1,j+1)]);
wektor = sort(wektor);
wektor = wektor(5-k:5+k); %parametr liczony od środka
wektor = [min(wektor), obraz(i,j), max(wektor)];
med(i,j) = median(wektor);
end
end
end