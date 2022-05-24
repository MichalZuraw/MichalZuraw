function [tekst]=fDerotacyjny(szyfr, p)
tekst=zeros(1,length(szyfr));
for i=1:length(szyfr)
    tekst(i)=szyfr(i)-p;
end
tekst=mod(tekst, 256);
end