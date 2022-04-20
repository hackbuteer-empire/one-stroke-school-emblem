%这个做的是遗传算法的继续优化
load('Chrom.mat');



MAXGEN = 3000;       %最大迭代次数
Pc = 0.9;           %交叉概率，相当于基因遗传的时候染色体交叉
Pm = 0.05;          %染色体变异
GGAP = 0.9;         %这个是代沟，通过遗传方式得到的子代数为父代数*GGAP
D = Distance(dot_loca);    %通过这个函数可以计算i,j两点之间的距离
N = size(D,1);      %计算有多少个坐标点

gen = 0;
figure;
hold on;
box on;
xlim([0,MAXGEN])
title('优化过程')
xlabel('迭代次数')
ylabel('当前最优解')
ObjV = PathLength(D,Chrom);%计算当前路线长度，即上面随机产生的那些个体路径
preObjV = min(ObjV);%当前最优解
while gen<MAXGEN
    %%计算适应度
    ObjV = PathLength(D,Chrom);     %计算路线长度
    line([gen - 1,gen],[preObjV,min(ObjV)]);
    pause(0.0001);
    preObjV = min(ObjV);
    FitnV = Fitness(ObjV);
    %选择
    SelCh = Select(Chrom,FitnV,GGAP);
    %交叉操作
    SelCH = Recombin(SelCh,Pc);
    %变异
    SelCh = Mutate(SelCh,Pm);
    %逆转操作
    SelCh = Reverse(SelCh,D);
    %重插入子代的新种群
    Chrom = Reins(Chrom,SelCh,ObjV);
    %更新迭代次数
    gen = gen + 1;
end

ObjV = PathLength(D,Chrom);     %计算路线长度
[minObjV,minInd] = min(ObjV);
%DrawPath(Chrom(minInd(1),:),dot_loca)
sol_best_GA=Chrom(minInd(1),:);
save Chrom Chrom
save sol_best_GA sol_best_GA

disp(['旅行商走过的总距离：',num2str(ObjV(minInd(1)))]);





