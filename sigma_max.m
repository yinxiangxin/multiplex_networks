clear;
clc
randn('state',0)
randn('state',100)
n=200;
m=2;
alpha=1;
beta=1;
p=0.18;
b=6;
B=-b*eye(n*m);
sigma=zeros(100,140);
loop=100;

for i=1:loop
    
    A1=randn(n,n);
    A2=randn(n,n);
   C1=rand(n,n);
   C2=rand(n,n);
    for a=1:n
        
       for b=1:n
           
           if C1(a,b)>p
               A1(a,b)=0;
           end
           
           if C2(a,b)>p
               A2(a,b)=0;
           end
       end
    end
    
    for j=1:100
        
        for k=1:140     
      c=exp(0.1*(k-70));
        sig=0.01*j+0.89
    A=sig*[A1,zeros(n,n);
       zeros(n,n),A2];
   D=[-c*eye(n,n),c*eye(n,n);
           c*eye(n,n),-c*eye(n,n)];
       a=eig(A+B+D);
       sigma(j,k)=sigma(j,k)+max(real(a))/loop;
        end
    end 
end
  save('sigma.mat','sigma');