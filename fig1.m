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
end


figure(1)
h=plot([0:Dt:T],[y01,evem],'linewidth',2);
xlim([0 3])
ylim([-1 1])
xlabel('t','FontSize',20, 'Fontname','Times New Roman')
ylabel('x_i^K(t)','FontSize',20,'Fontname', 'Times New Roman')
set(gca,'FontSize',20,'Fontname', 'Times New Roman');
hold on