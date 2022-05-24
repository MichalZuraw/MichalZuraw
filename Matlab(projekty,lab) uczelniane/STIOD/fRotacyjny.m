function [szyfr]=fRotacyjny(tekst, p)
szyfr=zeros(1,length(tekst));
for i=1:length(tekst)
    szyfr(i)=tekst(i)+p;
end
szyfr=mod(szyfr, 256);
end