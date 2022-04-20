clc; clear;
 
% 初始化一个电影矩阵
M = moviein(16);
% 创建电影
for k = 1:16
   plot(eye(k+16));
   axis equal;
    % 调用getframe函数d生成每个帧
   M(k) = getframe;
end
% 调用movie函数将电影动画矩阵M(k)播放5次
movie(M, 5);
 
 
% 将前面创建的电影动画中添加一个垂直的滚动条
h = uicontrol('style','slider','position',[10 50 20100],'Min',1,'Max',16,'Value',1);
for k=1:16
   plot(fft(eye(k+16)));
   axis equal;
   set(h,'Value',k);
    % gcf为返回当前图形窗口句柄
   M(k) = getframe(gcf);
end
clf;
axes('Position',[0 0 11]);
movie(M,5);
