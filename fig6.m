 load sigma
q=zeros(140,1);
%a=zeros(140,1);
   for i=1:140
      k(i)=exp(0.1*(i-70));
   end
   for i=1:140
       d=sigma(:,i);
       a=find(d>0);
       if isempty(a)==1
           q(i)=2;
       else
       q(i)=0.89+a(1)*0.01;
       end
   end
   b=6;
   n=200;
p=0.18;
b=6;
   for i=1:140
    smin(i)=(b+k(i))/(p*n)^0.5;
    smax(i)=b/(0.5*p*n)^0.5;
   end
 
   for i=1:70
        kn(i)=k(2*i);
   qn(i)=q(2*i);
   sminn(i)=smin(2*i);
   smaxn(i)=smax(2*i);
   end
   
semilogx(kn,sminn,'b-o','linewidth',3)
hold on
semilogx(kn,smaxn,'r-*','linewidth',3)
hold on
semilogx(kn,qn,'bla-.>','linewidth',3)
set(gca,'FontSize',30,'Fontname', 'Times New Roman');
xlabel('c','FontSize',30, 'Fontname','Times New Roman')
ylabel('$\sigma_{\max}$','Interpreter','LaTex','FontSize',30,'Fontname', 'Times New Roman')  
ylim([0.8  2])
xlim([10^(-3) 10^(3)])
 set(gca,'FontSize',30,'Fontname', 'Times New Roman');
 set(gca,'ytick',[0.8 1.0 1.2 1.4 1.6 1.8 2.0],'yticklabel',{'0.8','1.0','1.2','1.4','1.6','1.8','2.0'})
 set(gca,'xtick',[0.001 0.01 0.1 1 10 100 1000],'xticklabel',[0.001 0.01 0.1 1 10 100 1000])  
hl=legend('Theoretical results with small c','Theoretical results with large c','Simulation results')
set (hl,'box','off','FontName','Times New Roman','FontSize',22);