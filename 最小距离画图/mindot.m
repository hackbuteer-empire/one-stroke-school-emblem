clc,clear
load("dot_loca.mat")

m=size(dot_loca,1);
n=size(dot_loca,2);

temp=zeros(m,1);
sol_best_GA=zeros(m,1);

%初始化temp和coures矩阵
%course矩阵记录路径
temp(1)=1;
sol_best_GA(1)=1;%这个表示是第一个点
disdot=distance_wei(dot_loca(1,:),dot_loca,temp);

for i=1:m-1
    disdot=distance_wei(dot_loca(sol_best_GA(i),:),dot_loca,temp);
    [mindata,min_index]=min(disdot);
    
    temp(min_index)=1;
    sol_best_GA(i+1)=min_index;
end

save sol_best_GA sol_best_GA