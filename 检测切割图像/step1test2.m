clc,clear

or_data=imread('原图像2.png');
dot_loca=zeros(2727,2);

data=rgb2gray(or_data);
%[m,n]=size(data);

% averge=mean(data(:));
%对图像进行平均算法处理
% for i=1:m
%     for j=1:n
%         if data(i,j)>averge
%             data(i,j)=255;
%         else
%             data(i,j)=0;
%             
%         end
%     end
% end

%imshow(data);
%m行，n列
%%
BW1=edge(data,'Roberts',0.16);
[m,n]=size(BW1);
imshow(BW1);
%粒子化图像


%%
%行
other=0;
limit=8;
for i=1:m
    if mod(i,2)==other
        ind=find(BW1(i,:));
        [indt]=contiarray(ind);
        iter=size(indt,2);
        if isempty(indt)
        else
            for j=1:iter
                count=0;
                o=indt(j);
                while ((BW1(i,o)>0)&&(o<=n))%算法思想为有一个ind迭代矩阵实际和BW1的o具体矩阵纵坐标，一旦ind坐标大于o,count回归0，进行下一个
                    count=count+1;
                    o=o+1;
                    if count>limit
                        break
                    end
                end
                if count>limit
                    other=~other;
                    break
                end
            if j==iter
                BW1(i,:)=0;
            end
            end
        end
    end
end

%%
%列
% other=0;
% limit=8;
% for i=1:n
%     if mod(i,2)==other
%         ind=(find(BW1(:,i)))';
%         [indt]=contiarray(ind);
%         iter=size(indt,2);
%         if isempty(indt)
%         else
%             for j=1:iter
%                 count=0;
%                 o=indt(j);
%                 while ((BW1(o,i)>0)&&(o<=n))%算法思想为有一个ind迭代矩阵实际和BW1的o具体矩阵纵坐标，一旦ind坐标大于o,count回归0，进行下一个
%                     count=count+1;
%                     o=o+1;
%                     if count>limit
%                         break
%                     end
%                 end
%                 if count>limit
%                     other=~other;
%                     break
%                 end
%             if j==iter
%                 BW1(i,:)=0;
%             end
%             end
%         end
%     end
% end
%%
%检测已有点的坐标
k=1;
for i=1:m
    for j=1:n
        if BW1(i,j)>0
            dot_loca(k,1)=i;
            dot_loca(k,2)=j;
            k=k+1;
        end
    end
end
 
save dot_loca dot_loca

imshow(BW1);
title('Robert算子边缘检测');
