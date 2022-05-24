clc
clear all;
syms X;
fx=10*X*X+sin(10*X)-2;
a=0.4;
b=0.6;
%fx=4*X*X+X-1;
%a=0;
%b=1;
E=0.00010;
i=0;

pr=1;
x=(a+b)/2;
while(subs(fx,x)~=0 && pr)
    i=i+1;
    if(subs(fx,a)*subs(fx,x)<0) b=x; end
    if(subs(fx,b)*subs(fx,x)<0) a=x; end
    xo=x;
    x=(a+b)/2;
    if(abs(x-xo)<E)
        pr=0;
    end
end

i
x
subs(fx,x)
