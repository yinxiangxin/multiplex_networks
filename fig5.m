load delta1
q1=zeros(50,1);
for k=1:50
       d=delta(k,:);
       a=min(find(d<0.0000001));
       q1(k)=0.001*a;
end
load delta2
    q2=zeros(50,1);
for k=1:50
       d=delta(k,:);
       a= min(find(d<0.0000001));
       q2(k)=0.001*a;
end
load delta3
q3=zeros(50,1);
for k=1:50
       d=delta(k,:);
       a= min(find(d<0.0000001));
       q3(k)=0.001*a;
end
figure(1)
plot(0:0.02:0.96,q1(1:49),'b-o','linewidth',2)
hold on
plot(0:0.02:0.96,q2(1:49),'r--*','linewidth',2)
hold on
plot(0:0.02:0.96,q3(1:49),'bla-.>','linewidth',2)
xlabel('\rho','FontSize',20, 'Fontname','Times New Roman')
ylabel('T','FontSize',20,'Fontname', 'Times New Roman')
h1=legend('c=0.1','c=1','c=10');
set (h1,'box','off','FontName','Times New Roman','FontSize',14);
set(gca,'FontSize',20,'Fontname', 'Times New Roman');
