clear;
clc
randn('state',0)
randn('state',100)
t=20;
T=t; N=8*10^4; dt=t/N;
R=4; Dt=R*dt; L=N/R;
n=30;
m=2;
alpha=0.1;
evem=zeros(m*n,L);
evtemp=zeros(m*n,1);
htemp=zeros(m*n,1);

y01=-1 + 2* rand(m*n,1);
ev0=y01;
evtemp=ev0;
  
A1=randn(n,n);
A2=randn(n,n);
C1=rand(n,n);
 C2=rand(n,n);
   
   for i=1:n
       for j=1:n
           if C1(i,j)>0.1
               A1(i,j)=0;
           
           end
           if C2(i,j)>0.1
               A2(i,j)=0;
           end
       end
   end

   A=[A1,zeros(n,n);
       zeros(n,n),A2];
    c=0.1;
    D=[-c*eye(n,n),c*eye(n,n);
           c*eye(n,n),-c*eye(n,n)];

   A=A+D;
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
 e(:,j)=evem(:,j)-sum(evem(:,j))/60;
     delta(1,j)=norm(e(:,j),2);    
end

ev0=y01;
evtemp=ev0;

 A1=normrnd(0,2^0.5,[n n]);
 A2=normrnd(0,2^0.5,[n n]);
 C1=rand(n,n);
 C2=rand(n,n);
   
  for i=1:n
       for j=1:n
           if C1(i,j)>0.5
               A1(i,j)=0;
           
           end
           if C2(i,j)>0.5
               A2(i,j)=0;
           end
       end
   end
   
   for i=1:n
       for j=1:n
           if C1(i,j)>0.1
               A1(i,j)=0;
           
           end
           if C2(i,j)>0.1
               A2(i,j)=0;
           end
       end
   end

   A=[A1,zeros(n,n);
       zeros(n,n),A2];
    c=0.1;
    D=[-c*eye(n,n),c*eye(n,n);
           c*eye(n,n),-c*eye(n,n)];

   A=A+D;
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
 e(:,j)=evem(:,j)-sum(evem(:,j))/60;
     delta(2,j)=norm(e(:,j),2);    
end
begin=norm(y01-sum(y01)/60,2);

ev0=y01;
evtemp=ev0;  
A1=2*sqrt(3)*(rand(n,n)-0.5*ones(n,n));
 A2=2*sqrt(3)*(rand(n,n)-0.5*ones(n,n));
C1=rand(n,n);
 C2=rand(n,n);
   
   for i=1:n
       for j=1:n
           if C1(i,j)>0.1
               A1(i,j)=0;
           
           end
           if C2(i,j)>0.1
               A2(i,j)=0;
           end
       end
   end

   A=[A1,zeros(n,n);
       zeros(n,n),A2];
   c=0.1;
    D=[-c*eye(n,n),c*eye(n,n);
           c*eye(n,n),-c*eye(n,n)];

   A=A+D;
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

 e(:,j)=evem(:,j)-sum(evem(:,j))/60;
     delta(3,j)=norm(e(:,j),2);    
end
a=[0:Dt:T];
b1=[begin,delta(1,:)];
b2=[begin,delta(2,:)];
b3=[begin,delta(3,:)];

for i=1:101
    x(i)=a(100*(i-1)+1);
end
for i=1:101
    y1(i)=b1(100*(i-1)+1);
end
for i=1:101
    y2(i)=b2(100*(i-1)+1);
end
for i=1:101
    y3(i)=b3(100*(i-1)+1);
end
figure(1)
plot(x,y1,'b-o','linewidth',2);
hold on
plot(x,y3,'r--*','linewidth',2);
hold on 
plot(x,y2,'bla-.>','linewidth',2);
xlim([0 4])
xlabel('t','FontSize',20, 'Fontname','Times New Roman')
ylabel('E(t)','FontSize',20,'Fontname', 'Times New Roman')
hl=legend('Gaussian distribution','Uniform distribution','Mixture distribution')
set (hl,'box','off','FontName','Times New Roman','FontSize',14);
set(gca,'FontSize',20,'Fontname', 'Times New Roman');