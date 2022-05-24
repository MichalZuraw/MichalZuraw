clc
clear all;
syms X;
%fx=10*X*X+sin(10*X)-2;
%a=0.4;
%b=0.6;
fx=-X*X*X+X*X+1;
a=0;
b=1;
fxpr=diff(fx);
E=0.00010;
i=0;

pr=1;

if(subs(fx,a)*subs(fxpr,a)>0) x=a; end
if(subs(fx,b)*subs(fxpr,b)>0) x=b; end
while(subs(fx,x)~=0 && pr)
    i=i+1;
    xm=x;
    x=xm-(subs(fx,xm)/subs(fxpr,xm));
    if(abs(x-xm)<=E)
        pr=0;
    end
end

i
x
subs(fx,x)
