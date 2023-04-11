clear;
clc
randn('state',0)
randn('state',100)
t=10;
T=t; N=4*10^4; dt=t/N;
R=4; Dt=R*dt; L=N/R;
n=30;
m=2;  
y01=-1 + 2* rand(m*n,1);
evem=zeros(m*n,L);
evtemp=zeros(m*n,1);
htemp=zeros(m*n,1);

ev0=y01;
evtemp=ev0;
alpha=0.1;
delta0=norm(y01,2);
 A1=randn(n,n);
    A2=randn(n,n);
    A3=randn(n,n);
    C1=rand(n,n);
   C2=rand(n,n);
   c=0.1; 
  D=[-c*eye(n,n),c*eye(n,n);
           c*eye(n,n),-c*eye(n,n)];
       p=0.1:0.2:0.5;
    
  for l=1:3  

ev0=y01;
evtemp=ev0;
A11=zeros(n,n);
A22=zeros(n,n);

 for i=1:n
       for j=1:n
           if C1(i,j)<p(l)
               A11(i,j)=A1(i,j);
           if C2(i,j)<p(l)
               A22(i,j)=A2(i,j);
           end
           end
       end
   end
 A=[A11,zeros(n,n);
       zeros(n,n),A22]
   A=A+D;
for j=1:L
    
    htemp=zeros(m*n,1);
 for k=1:m*n
     
  for i=1:m*n
          htemp(k)=htemp(k)+alpha*A(k,i)*(evtemp(i)/(evtemp(i)+1));
      end
  end
  hem(:,j)=htemp;
  
     evtemp=evtemp+Dt.*(htemp-1*evtemp);    
    evem(:,j)=evtemp;
    e(:,j)=evem(:,j)-sum(evem(:,j))/(2*n);
     delta(l,j)=norm(e(:,j),2);
     
end
  end
  a=[0:Dt:T];
b1=[delta0,delta(1,:)];
b2=[delta0,delta(2,:)];
b3=[delta0,delta(3,:)];

for i=1:51
    x(i)=a(200*(i-1)+1);
end
for i=1:51
    y1(i)=b1(200*(i-1)+1);
end
for i=1:51
    y2(i)=b2(200*(i-1)+1);
end
for i=1:51
    y3(i)=b3(200*(i-1)+1);
end

figure(1)
plot(x,y1,'b-o','linewidth',2);
hold on
plot(x,y2,'r--*','linewidth',2);
hold on 
plot(x,y3,'bla-.>','linewidth',2);
xlim([0 8])
xlabel('t','FontSize',20, 'Fontname','Times New Roman')
ylabel('E(t)','FontSize',20,'Fontname', 'Times New Roman')
hl=legend('p=0.1','p=0.3','p=0.5')
set (hl,'box','off','FontName','Times New Roman','FontSize',14);
set(gca,'FontSize',20,'Fontname', 'Times New Roman');