function W1 = licz_wskaznik(img)

X = logical(img);


P=regionprops(X,'all');
K=bwboundaries(X);
K=K{1,1};                               % współrzędne punktów konturu
ob1=size(K,1);                          % długość obwodu 1
ob2=P.Perimeter;                        % długość obwodu 2
ob=mean([ob1 ob2]);                     % długość obwodu
po1=bwarea(X);                          % pole powierzchni 1
po2=P.Area;                             % pole powierzchni 2
po=mean([po1 po2]);                     % pole powierzchni
sc=P.Centroid;                          % środek cieżkości
R=dist(P.PixelList,sc');                % odległości pikseli od środka ciężkości
L=dist(P.PixelList,K(:,[2,1])');        % odległości pikseli od konturu
L=min(L,[],2);                          % minimalne odległości pikseli od konturu
D=dist(K(:,[2,1]),sc');                 % odległości pikseli konturu od środka ciężkości
n=length(D);                            % liczba punktów konturu
rmin=min(D);                            % minimalna odległości pikseli konturu od środka ciężkości
rmax=max(D);                            % maksymalna odległości pikseli konturu od środka ciężkości
d=max(max(dist(P.Extrema,P.Extrema')));	% maksymalna długość (gabaryt) obiektu


% wyznaczenie przykładowych cech
W1(1,1)=4*pi*po/(ob^2);             % K - kompaktowości
W1(1,2)=2*sqrt(po/pi);              % C1 - kołowości
W1(1,3)=ob/pi;                      % C2 - kołowości
W1(1,4)=po/sqrt(2*pi*sum(R.^2));	% BB - Blaira-Blissa
W1(1,5)=po^3/sum(L)^2;              % D - Danielssona
W1(1,6)=sum(D)/sqrt(n*sum(D.^2)-1);	% H - Haralicka
W1(1,7)=ob/(2*sqrt(pi*po))-1;       % M - Malinowskiej
W1(1,8)=rmin/rmax;                	% Lp1
W1(1,9)=d/ob;                       % Lp2
W1(1,10)=(2*sqrt(pi*po))/ob;        % Mz
end