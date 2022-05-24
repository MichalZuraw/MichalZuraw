a=double(imread('a.png'));
b=double(imread('b.png'));
tekst=fopen("tekst.txt");
line=fgetl(tekst);  %%tekst
line=double(line);
figure
hist(line);
title('histogram tekstu');
klucz1=randi([0 255],1,20);
klucz2=randi([0 255],1,65536);
p=60;
m=length(a);
%% szyfrowanie tekstu
szyfr0=fRotacyjny(line,p);
szyfr1=fJednorazowy(line,klucz1);
szyfr2=fJednorazowy(line,klucz2);
figure
hist(szyfr1);
title('klucz krotki')
figure
hist(szyfr2);
title('klucz dlugi')
szyfr0=char(szyfr0);
szyfr1=char(szyfr1);
szyfr2=char(szyfr2);
display(szyfr0);
display("Szyfrowanie rotacyjne");
display(szyfr1);
display("Szyfrowanie kluczem krotkim");
display(szyfr2);
display("Szyfrowanie kluczem dlugim");

%% deszyfrowanie tekstu
szyfr0=fDerotacyjny(szyfr0,p);
szyfr1=fDejednorazowy(szyfr1,klucz1);
szyfr2=fDejednorazowy(szyfr2,klucz2);
szyfr0=char(szyfr0);
szyfr1=char(szyfr1);
szyfr2=char(szyfr2);
display(szyfr0);
display("Deszyfrowanie rotacyjne");
display(szyfr1);
display("Deszyfrowanie kluczem krotkim");
display(szyfr2);
display("Deszyfrowanie kluczem dlugim");
%% sprawdzenie szyfrowania
a=reshape(a,[],1);
b=reshape(b,[],1);
a0=fRotacyjny(a,p);
b0=fRotacyjny(b,p);
a1=fJednorazowy(a,klucz1);
b1=fJednorazowy(b,klucz1);
a2=fJednorazowy(a,klucz2);
b2=fJednorazowy(b,klucz2);
a0=reshape(a0,m,m);
b0=reshape(b0,m,m);
a1=reshape(a1,m,m);
b1=reshape(b1,m,m);
a2=reshape(a2,m,m);
b2=reshape(b2,m,m);
figure
imshow(uint8(a0));
title("Szyfrowanie rotacyjne 'a'");
figure
imshow(uint8(a1));
title("Szyfrowanie kluczem krotkim 'a'");
figure
imshow(uint8(a2));
title("Szyfrowanie kluczem dlugim 'a'");
figure
imshow(uint8(b0));
title("Szyfrowanie rotacyjne 'b'");
figure
imshow(uint8(b1));
title("Szyfrowanie kluczem krotkim 'b'");
figure
imshow(uint8(b2));
title("Szyfrowanie kluczem dlugim 'b'");

%% sprawdzenie deszyfrowania
a0=reshape(a0,[],1);
b0=reshape(b0,[],1);
a1=reshape(a1,[],1);
b1=reshape(b1,[],1);
a2=reshape(a2,[],1);
b2=reshape(b2,[],1);
a0=fDerotacyjny(a0,p);
b0=fDerotacyjny(b0,p);
a1=fDejednorazowy(a1,klucz1);
b1=fDejednorazowy(b1,klucz1);
a2=fDejednorazowy(a2,klucz2);
b2=fDejednorazowy(b2,klucz2);
a0=reshape(a0,m,m);
b0=reshape(b0,m,m);
a1=reshape(a1,m,m);
b1=reshape(b1,m,m);
a2=reshape(a2,m,m);
b2=reshape(b2,m,m);
figure
imshow(uint8(a0));
title("Deszyfrowanie rotacyjne powrotne 'a'");
figure
imshow(uint8(a1));
title("Deszyfrowanie kluczem krotkim powrotne 'a'");
figure
imshow(uint8(a2));
title("Deszyfrowanie kluczem dlugim powrotne 'a'");
figure
imshow(uint8(b0));
title("Deszyfrowanie rotacyjne powrotne 'b'");
figure
imshow(uint8(b1));
title("Deszyfrowanie kluczem krotkim powrotne 'b'");
figure
imshow(uint8(b2));
title("Deszyfrowanie kluczem dlugim powrotne 'b'");