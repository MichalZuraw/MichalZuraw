file=fopen('33_tekst.txt');
hasla = load('hasla.mat').hasla;
szyfr=fread(file);
szyfr=double(szyfr);
hist(szyfr);

for i=1:5000 
    klucz=hasla{i};
    klucz=double(klucz);
    reszta=mod(length(szyfr),length(klucz));
    x=length(szyfr)/length(klucz);
    klucz2=klucz;
for j=1:x-1
    klucz2=[klucz2 klucz];
end

klucz2=[klucz2 klucz(1,1:reszta)];

for k=1:length(szyfr)

    tekst(k)=mod(szyfr(k)-klucz2(mod(k-1,length(klucz2))+1),256);

    if((tekst(k)>32 && tekst(k)<90) || (tekst(k)>96 && tekst(k)<123)) 
    else
        break;
    end
end
if(k==length(szyfr))
    figure;
    hist(tekst);
    fprintf('klucz na miejscu %d\n',i);
    line=fopen('33.txt','w');
    fwrite(line,tekst);
    fclose(line);
end
end








