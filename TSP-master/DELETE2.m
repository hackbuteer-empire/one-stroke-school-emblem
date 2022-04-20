%举个我曾经做过的凸轮机构 运动仿真的实例
%%以下仅为 运动movie部分代码
%-----------------运动仿真开始------------------- 
figure(2) 
m=moviein(20); 
j=0; 
hd=2;
for i=1:360 
     j=j+1; 
     delta(i)=i*hd;%凸轮转角 
     xy=[xp',yp'];%凸轮实际轮廓曲线坐标 
     A1=[cos(delta(i)),sin(delta(i)); %凸轮曲线坐标旋转矩阵 
         -sin(delta(i)),cos(delta(i))]; 
     xy=xy*A1;%旋转实际凸轮轮廓曲线坐标 
     clf; 
     %-----------------绘制凸轮------------------ 
     plot(xy(:,1),xy(:,2));%绘制凸轮 
     hold on;grid on;axis equal; 
     axis([(-180) (470) (-200) (240)]); 
     plot([-(r0+h-40) (r0+h) ],[0 0],'k','LineWidth',2);%绘制凸轮水平轴 
     plot([0 0],[-(r0+h) (r0+rr)],'k','LineWidth',2);%绘制凸轮垂直轴 
     plot(r0*cos(ct),r0*sin(ct),'g--','LineWidth',2);%绘制基圆 
     plot(e*cos(ct),e*sin(ct),'c-','LineWidth',2);%绘制偏距圆 
     plot(e+rr*cos(ct),s0+s(i)+rr*sin(ct),'k','LineWidth',2);%绘制滚子圆 
     plot([e e+rr*cos(-phi(i))],[s0+s(i) s0+s(i)+rr*sin(-phi(i))],'k','LineWidth',2); 
     %绘制滚子圆标线 
     plot([e e],[s0+s(i) s0+s(i)+40],'k','LineWidth',2);%绘制推杆 
     %------------------绘制推杆曲线----------------------------- 
     plot([1:360]+r0+h,s+s0);%绘制推杆曲线 
     plot([(r0+h) (r0+h+360)],[s0,s0],'k','LineWidth',2);%绘制推杆垂直轴 
     plot([(r0+h) (r0+h)],[s0 s0+h],'k','LineWidth',2);%绘制水平轴 
     plot(i+r0+h,s(i)+s0,'r.','LineWidth',1.5);%绘制推杆曲线坐标动点 
     title('偏置直动滚子推杆盘形凸轮设计'); 
     xlabel('x/mm'); 
     ylabel('y/mm'); 
     m(j)=getframe; 
end 
movie(m);