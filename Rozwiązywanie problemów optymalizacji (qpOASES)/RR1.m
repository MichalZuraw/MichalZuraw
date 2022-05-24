clc;clear all;
N=4; %ilość kroków
T=10; %stała czasowa
k=1.5; %wzmocnienie
Umin=1; %minimalna wartość sterowania
Umax=6; %maksymalna wartość sterowania
a=-1/T; %parametr a
b=k/T; %parametr b
yzad=4;%wartość zadana 
ywarpocz=5; %wartość początkowa
Ts=1; %okres próbkowania
H=zeros(2*N+3, 2*N+3);%N+1 u + N+2 x
g=zeros(2*N+3,1);
A=zeros(N+2, 2*N+3);
lbA=zeros(N+2,1);
lbA(1)=ywarpocz;%y0
ubA=lbA; %równościowe
ub=ones(2*N+3,1)*Umax; %ograniczenia nierównościowe górne
lb=ones(2*N+3,1)*Umin;%ograniczenia nierównościowe dolne
for i=N+2:2*N+3 %usuniecie ograniczen z y
   ub(i)=+inf; 
   lb(i)=-inf;
end
for i=N+2:2*N+3
   H(i,i)=2; %Hesjan
end
for i=N+2:2*N+3
    g(i)=-2*yzad; %inaczej f
end
index1=1;
index2=N+2;
for i=2:N+2
A(i,index1)=-(b*Ts);
A(i,index2)=-1;
A(i,index2+1)=1-(a*Ts);
index1=index1+1;
index2=index2+1;
end
A(1,N+2)=1;
x0= zeros(2*N+3,1);
options = optimoptions('quadprog','Algorithm','active-set','Display',"none");
opcje=qpOASES_options('terminationTolerance',1e-8,'boundTolerance',1e-8);
auxinput=qpOASES_auxInput('x0',x0);
tic
[y,fval]=qpOASES(H,g,A,lb,ub,lbA,ubA,opcje,auxinput)
czaswykonywaniaqpOASES=toc
tic
[y1,fval1] = quadprog(H,g,[],[],A,lbA,lb,ub,x0,options)
czaswykonywaniaquadprog=toc




