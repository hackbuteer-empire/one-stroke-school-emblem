clc,clear

or_data=imread('原图像2.png');
%dot_loca=zeros(2727,2);

data=rgb2gray(or_data);

[m,n]=size(data);

averge=mean(data(:));
%对图像进行平均算法处理
%有时候需要此模块与边缘算法连用
for i=1:m
    for j=1:n
        if data(i,j)>averge
            data(i,j)=255;
        else
            data(i,j)=0;
            
        end
    end
end

imshow(data);
%m行，n列
%%
BW1=edge(data,'Roberts',0.16);
[m,n]=size(BW1);
imshow(BW1);
%粒子化图像

%%
%生成列的切割矩阵cutarray
limit=8;
other=0;
% n_cutarray=round(n/2);
% cutarray=zeros(n_cutarray,1);
o1=1;
%我不想给它分配内存！！！！！！！！！！
%md让它自己开辟内存空间多好，直接迭代，但是编译器一直警告，烦人-_-
%到时候还得检测是否为0，为0的话就跳出迭代了+_+
for i=1:n
    if mod(i,2)==other
        ind=(find(BW1(:,i)))';
        [indt]=contiarray(ind);
        iter=size(indt,2);%这些代码完全是可以塞进contiarray函数里面,减少代码
        if isempty(indt)
            cutarray(o1,1)=i;
            o1=o1+1;%这个if下面的两行可以完全不要的，因为切和不切没甚麽区别，但加上是为了cutarray更加完整
        else
            for j=1:iter
                count=0;
                o=indt(j);
                while ((BW1(o,i)>0)&&(o<=n))%算法思想为有一个ind迭代矩阵实际和BW1的o具体矩阵纵坐标，一旦ind坐标大于o,count回归0，进行下一个
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
                cutarray(o1,1)=i;
                o1=o1+1;
            end
            end
        end
    end
end


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
for j=cutarray
    if j==0
    else
        BW1(:,j)=0;
    end
end
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
save (['C:\Users\raven\Desktop\新建文件夹 (2)\TSP-master\','dot_loca.mat'],'dot_loca')
save (['C:\Users\raven\Desktop\新建文件夹 (2)\最小距离画图\','dot_loca.mat'],'dot_loca')
imshow(BW1);
title('Robert算子边缘检测');
