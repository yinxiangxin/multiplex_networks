clear;
clc
randn('state',0)
randn('state',100)
t=10;
T=t; N=4*10^4; dt=t/N;
R=4; Dt=R*dt; L=N/R;
n=30;
m=2;  
evem=zeros(m*n,L);
evtemp=zeros(m*n,1);
htemp=zeros(m*n,1);
y01=rand(60,1);
ev0=y01;
evtemp=ev0;
 A1=randn(n,n);
 A2=randn(n,n);
 A3=randn(n,n);
 A11=zeros(n,n);
 A22=zeros(n,n);
 C1=rand(n,n);
 C2=rand(n,n);
 alpha=0.1;
  for l=1:3
   
   for i=1:n
       for j=1:n
           if C1(i,j)>0.1
               A1(i,j)=0;
           else
               A11(i,j)=A3(i,j);
           end
           if C2(i,j)>0.1
               A2(i,j)=0;
           else
               A22(i,j)=A3(i,j);
           end
       end
   end
for d=1:50
    rho=0.02*(d-1);
   A=[(1-rho)*A1+rho*A11,zeros(n,n);
       zeros(n,n),(1-rho)*A2+rho*A22];
  c=[0.1 1 10];
    D=[-c(l)*eye(n,n),c(l)*eye(n,n);
           c(l)*eye(n,n),-c(l)*eye(n,n)];
   A=A+D;
evtemp=ev0;
Ezero=norm(ev0,2);
 n=30;
m=2;
for j=1:L
    htemp=zeros(m*n,1);
 for k=1:m*n
     
  for i=1:m*n
          htemp(k)=htemp(k)+alpha*A(k,i)*(evtemp(i)/(evtemp(i)+1));
  end
 end
  hem(:,j)=htemp;
     evtemp=evtemp+Dt.*(htemp-2*evtemp);
    evem(:,j)=evtemp;
    e(:,j)=evem(:,j)-sum(evem(:,j))/(m*n);
     delta(d,j)=norm(e(:,j),2);
end
end
eval(['save delta',num2str(l)]);
  end