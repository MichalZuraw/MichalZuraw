function [Obin,Oprog] = binarka(O1,prog)
[wysokosc,szerokosc]=size(O1);
for i=1:wysokosc
    for j=1:szerokosc
        if O1(i,j)<=prog
            Obin(i,j)=255;
        
        else
             Obin(i,j)=0;
        end
    end
end
Oprog=prog;
end

