%%无递推
clc;
clear;
C=imread('原图像.jpg');
C=rgb2gray(C);
 
 
%初始化基本粒子群优化算法的参数
Wmax = 0.9;             %最大惯性因子
Wmin = 0.1;             %最小惯性因子
c1 = 2.0;               %个体学习因子
c2 = 2.0;               %群体学习因子
xmax = 254;             %粒子允许的最小位置
xmin = 2; 
speedmax=10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gBest
    % toc 
    % t=toc-tic;
    %写入最终结果图
    [m,n]=size(C);
   z=zeros(m,n); 
% percentege=0;
    for i=1:m
        for j=1:n
          if C(i,j)<=round(gBest(1))-1
           z(i,j)=0; 
          elseif C(i,j)<=round(gBest(2))-1
              z(i,j)=75;
          elseif C(i,j)<=round(gBest(3))-1
              z(i,j)=175;
          else
              z(i,j)=255;
    %           percentege=percentege+1;
          end
      end
    end
    z=z/255;
    subplot(1,2,2);
    imshow(z);