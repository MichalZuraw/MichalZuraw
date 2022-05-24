
function [Mz, M, K] = wsk(img)
    
    A=regionprops(img,'all');
    
    S=A.Area;
    L=A.Perimeter;
    Mz = (2*sqrt(pi*S))/L;
    M = (L/(2*sqrt(pi*S)))-1;
    K = (4*pi*S)/(L^2);
end