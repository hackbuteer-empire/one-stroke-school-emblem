clc; clear;
 
% ��ʼ��һ����Ӱ����
M = moviein(16);
% ������Ӱ
for k = 1:16
   plot(eye(k+16));
   axis equal;
    % ����getframe����d����ÿ��֡
   M(k) = getframe;
end
% ����movie��������Ӱ��������M(k)����5��
movie(M, 5);
 
 
% ��ǰ�洴���ĵ�Ӱ���������һ����ֱ�Ĺ�����
h = uicontrol('style','slider','position',[10 50 20100],'Min',1,'Max',16,'Value',1);
for k=1:16
   plot(fft(eye(k+16)));
   axis equal;
   set(h,'Value',k);
    % gcfΪ���ص�ǰͼ�δ��ھ��
   M(k) = getframe(gcf);
end
clf;
axes('Position',[0 0 11]);
movie(M,5);
