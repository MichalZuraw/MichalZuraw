function med = mediana(obraz,rozmiar_maski)
rozm_maski = rozmiar_maski;
for i=1:size(obraz,1)
for j=1:size(obraz,2)
rozm_maski_i_min = floor(rozm_maski/2);
rozm_maski_i_max = floor(rozm_maski/2);
rozm_maski_j_min = floor(rozm_maski/2);
rozm_maski_j_max = floor(rozm_maski/2);
if i <= ceil(rozm_maski/2)
rozm_maski_i_min = i-1;
end
if i >= (size(obraz,1)-floor(rozm_maski/2))
rozm_maski_i_max = size(obraz,1)-i;
end
if j <= ceil(rozm_maski/2)
rozm_maski_j_min = j-1;
end
if j >= (size(obraz,2)-floor(rozm_maski/2))
rozm_maski_j_max = size(obraz,2)-j;
end
tabelka = obraz(i-rozm_maski_i_min : i+rozm_maski_i_max, j-rozm_maski_j_min : j+rozm_maski_j_max);
wektor = tabelka(:);
mediana = median(wektor);
med(i,j) = mediana;
end
end
end
