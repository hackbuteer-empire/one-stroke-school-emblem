%�ٸ�������������͹�ֻ��� �˶������ʵ��
%%���½�Ϊ �˶�movie���ִ���
%-----------------�˶����濪ʼ------------------- 
figure(2) 
m=moviein(20); 
j=0; 
hd=2;
for i=1:360 
     j=j+1; 
     delta(i)=i*hd;%͹��ת�� 
     xy=[xp',yp'];%͹��ʵ�������������� 
     A1=[cos(delta(i)),sin(delta(i)); %͹������������ת���� 
         -sin(delta(i)),cos(delta(i))]; 
     xy=xy*A1;%��תʵ��͹�������������� 
     clf; 
     %-----------------����͹��------------------ 
     plot(xy(:,1),xy(:,2));%����͹�� 
     hold on;grid on;axis equal; 
     axis([(-180) (470) (-200) (240)]); 
     plot([-(r0+h-40) (r0+h) ],[0 0],'k','LineWidth',2);%����͹��ˮƽ�� 
     plot([0 0],[-(r0+h) (r0+rr)],'k','LineWidth',2);%����͹�ִ�ֱ�� 
     plot(r0*cos(ct),r0*sin(ct),'g--','LineWidth',2);%���ƻ�Բ 
     plot(e*cos(ct),e*sin(ct),'c-','LineWidth',2);%����ƫ��Բ 
     plot(e+rr*cos(ct),s0+s(i)+rr*sin(ct),'k','LineWidth',2);%���ƹ���Բ 
     plot([e e+rr*cos(-phi(i))],[s0+s(i) s0+s(i)+rr*sin(-phi(i))],'k','LineWidth',2); 
     %���ƹ���Բ���� 
     plot([e e],[s0+s(i) s0+s(i)+40],'k','LineWidth',2);%�����Ƹ� 
     %------------------�����Ƹ�����----------------------------- 
     plot([1:360]+r0+h,s+s0);%�����Ƹ����� 
     plot([(r0+h) (r0+h+360)],[s0,s0],'k','LineWidth',2);%�����Ƹ˴�ֱ�� 
     plot([(r0+h) (r0+h)],[s0 s0+h],'k','LineWidth',2);%����ˮƽ�� 
     plot(i+r0+h,s(i)+s0,'r.','LineWidth',1.5);%�����Ƹ��������궯�� 
     title('ƫ��ֱ�������Ƹ�����͹�����'); 
     xlabel('x/mm'); 
     ylabel('y/mm'); 
     m(j)=getframe; 
end 
movie(m);