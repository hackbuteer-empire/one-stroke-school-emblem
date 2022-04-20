function [disdot] = distance_wei(dot,dot_loca,temp)
%计算特定点与所有点的距离
%dot是特定点，dot_loca是所有点矩阵,temp为点取决矩阵
%当temp为1的时候，不取此点
%默认temp和dot_loca的矩阵长度一样，不一样会报错，这里不设置报错提醒

m=size(dot_loca,1);

disdot=ones(m,1)*99999;

for i=1:m
    if temp(i,1)==0
        length=((dot_loca(i,1) - dot(1,1))^2 + (dot_loca(i,2)-dot(1,2))^2)^0.5;
        disdot(i)=length;
    else
    end

end

