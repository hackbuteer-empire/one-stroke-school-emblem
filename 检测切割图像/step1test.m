%%�޵���
clc;
clear;
C=imread('ԭͼ��.jpg');
C=rgb2gray(C);
 
 
%��ʼ����������Ⱥ�Ż��㷨�Ĳ���
Wmax = 0.9;             %����������
Wmin = 0.1;             %��С��������
c1 = 2.0;               %����ѧϰ����
c2 = 2.0;               %Ⱥ��ѧϰ����
xmax = 254;             %�����������Сλ��
xmin = 2; 
speedmax=10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gBest
    % toc 
    % t=toc-tic;
    %д�����ս��ͼ
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