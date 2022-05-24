clc
clear all;
syms X;
%fx=10*X*X+sin(10*X)-2;
%a=0.4;
%b=0.6;
fx=4*X*X+X-1;
a=0;
b=1;
E=0.00010;
i=0;

xm=a;
x=b;

pr=1;
while(subs(fx,x)~=0 && pr)
    i=i+1;
    xo=x;
    xp=x-((subs(fx,x)*(x-xm))/(subs(fx,x)-subs(fx,xm)));
    xm=x;
    x=xp;
    if(abs(x-xm)<=E)
        pr=0;
    end
end

i
x
subs(fx,x)
