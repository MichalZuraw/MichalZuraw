clc;clear all;
N=2; %ilość kroków
T=10; %stała czasowa
k=1.5; %wzmocnienie
Umin=1; %minimalna wartość sterowania
Umax=6; %maksymalna wartość sterowania
yzad=4;%wartość zadana 
ywarpocz=0; %wartość początkowa
Ts=1; %okres próbkowania
H=zeros(4*N+7, 4*N+7); %N+1 u+N+2 x1+N+2 x2+N+2 x3
g=zeros(4*N+7,1); ;%N+1 u+N+2 x1+N+2 x2+N+2 x3
A=zeros(3*N+6, 4*N+7); 
lbA=zeros(3*N+6,1);
lbA(3*N+4)=ywarpocz;%x1 0
ubA=lbA; % przerabiamy nierównośc na równanie
R=0.1;
Q=1;
ub=ones(4*N+7,1)*Umax; %ograniczenia nierównościowe górne
lb=ones(4*N+7,1)*Umin;%ograniczenia nierównościowe dolne
for i=N+2:4*N+7 %usuniecie ograniczen z x1,x2,x3
   ub(i)=+inf; 
   lb(i)=-inf;
end
for i=1:N+1     %ograniczenia hasjanowe na U
    H(i,i)=2*R;    %przekatna ui
    if (i<N+1 && i>1)
    H(i,i)=4*R;   %przekatna u i+1
    end
    if (i<N+1)
    H(i,i+1)=-2*R; %na prawo od przekątnej
    H(i+1,i)=-2*R; %w dół od przekątnej
    end
end
for i=N+2:2*N+3
   H(i,i)=2*Q; %Hesjan
   g(i)=-2*yzad; %inaczej f
end
for i=1:N+1 %A
    A(i,i+N+1)=-1/Ts;%x1i
    A(i,i+N+2)=1/Ts;%x1i+1
    A(i,i+2*N+4)=-1;%x2i+1
    A(i+N+1,i+2*N+3)=-1/Ts;%x2i
    A(i+N+1,i+2*N+4)=1/Ts;%x2i+1
    A(i+N+1,i+3*N+6)=-1;%x3i+1
    A(i+2*N+2,i+3*N+6)=(1/Ts)+(3/T);%x3i+1
    A(i+2*N+2,i+3*N+5)=-1/Ts;%x3i
    A(i+2*N+2,i+2*N+4)=3/T^2;%x2i+1
    A(i+2*N+2,i+N+2)=1/T^3;%x1i+1
    A(i+2*N+2,i)=-k/T^3;%u
end
A(3*N+4,N+2)=1; % ograniczenie początkowe na x1
A(3*N+5,2*N+4)=1; %ograniczenie początkowe na x2
A(3*N+6,3*N+6)=1; %ograniczenie początkowe na x3
x0= zeros(4*N+7,1);
options = optimoptions('quadprog','Algorithm','active-set','Display',"none");
opcje=qpOASES_options('terminationTolerance',1e-8,'boundTolerance',1e-8);
auxinput=qpOASES_auxInput('x0',x0);
tic
y=qpOASES(H,g,A,lb,ub,lbA,ubA,opcje,auxinput)
czaswykonywaniaqpoases=toc
tic
y1 = quadprog(H,g,[],[],A,lbA,lb,ub,x0,options)
czaswykonywaniaquadprog=toc

