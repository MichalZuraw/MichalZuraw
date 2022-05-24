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

fa=subs(fx,a);
fb=subs(fx,b);

pr=1;
x=(a*fb-b*fa)/(fb-fa);
while(subs(fx,x)~=0 && pr)
    i=i+1;
    xo=x;
    if(fa*subs(fx,x)<=0)
        x=(x*fa-a*subs(fx,x))/(fa-subs(fx,x));
    elseif(subs(fx,a)*subs(fx,x)>0)
        x=(x*fb-b*subs(fx,x))/(fb-subs(fx,x));
    end
    
    if(abs(x-xo)<=E)
        pr=0;
    end
end

i
x
subs(fx,x)
