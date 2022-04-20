clear %所有变量全部删除
clc %清除命令行窗口中的数据

load("dot_loca.mat")

a = 0.99; %温度衰减参数
t0 = 97; tf = 3; t = t0; %初始温度 终值
Markov_length = 10000; %Markov链长度


coordinates = dot_loca;


%coordinates(:,1) = []; %去除第一行的城市编号
amount = size(coordinates,1); %计算城市个数

%通过向量化的方法计算距离矩阵（保存所有两点之间的距离）
coor_x_tmp1 = coordinates(:,1) * ones(1,amount);
coor_x_tmp2 = coor_x_tmp1';
coor_y_tmp1 = coordinates(:,2) * ones(1,amount);
coor_y_tmp2 = coor_y_tmp1';
dist_matrix = sqrt((coor_x_tmp1 - coor_x_tmp2).^2 + (coor_y_tmp1 - coor_y_tmp2).^2);

%产生初始解
sol_new = 1:amount;
%sol代表当前路线 new代表每次产生的新解 current代表当前解 best代表冷却过程中的最优解
E_current = inf;
E_best = inf;
%E代表目标函数的值 也就是距离和 new代表新解的遍历距离 best最优解
sol_current = sol_new;
sol_best = sol_new;
p = 1; %初始化P

figure;
hold on;
box on;
xlim([tf,t0]);
title('优化过程')
xlabel('当前温度')
ylabel('当前最优解')

while t >= tf %当温度大于停止温度时
    for r = 1:Markov_length %Markov链长度
        %产生随机扰动
        if(rand < 0.5) %随机决定而交换还是三交换
            %二交换
            ind1 = 0; ind2 = 0;
            while(ind1 == ind2)
                ind1 = ceil(rand.*amount); %朝正无穷大四舍五入
                ind2 = ceil(rand.*amount);
            end
            tmp1 = sol_new(ind1);
            sol_new(ind1) = sol_new(ind2);
            sol_new(ind2) = tmp1;
        else
            %三交换
            ind1 = 0; ind2 = 0; ind3 = 0;
            while(ind1 == ind2) || (ind1 == ind3) || (ind2 == ind3) || (abs(ind1 - ind2) == 1) %三变换两个点之间没有路径
                ind1 = ceil(rand.*amount);
                ind2 = ceil(rand.*amount);
                ind3 = ceil(rand.*amount);
            end
                %tmp1 = ind1;tmp2 = ind2;tmp3 = ind3;
                %排序ind1<ind2<ind3
                ind = [ind1 ind2 ind3];
                ind_sort = sort(ind);
                ind1 = ind_sort(1);
                ind2 = ind_sort(2);
                ind3 = ind_sort(3);
                %进行交换
                
                tmplist1 = sol_new((ind1 + 1):(ind2 - 1));
                sol_new((ind1 + 1):(ind1 + ind3 - ind2 + 1)) = sol_new((ind2) : (ind3));
                sol_new((ind1 + ind3 - ind2 + 2):ind3) = tmplist1;
        end
        %检查是否满足约束条件
        %计算目标函数函数值（类比于内能）
        E_new = 0;
        for i = 1 : (amount - 1)
            E_new = E_new + dist_matrix(sol_new(i),sol_new(i+1));
        end
        %加上最后一个到第一个的距离
        E_new = E_new + dist_matrix(sol_new(amount),sol_new(1)); 
        if E_new < E_current %当出现更优解时 更新为更优解的路线和目标函数值
            E_current = E_new;
            sol_current = sol_new;
            if E_new < E_best
                pre_E_best = E_best;
                E_best = E_new;
                sol_best = sol_new;
            end
        else
        %一定范围内接受非优解
            if rand < exp(-(E_new - E_current)./t)
                E_current = E_new;
                sol_current = sol_new;
            else
                sol_new = sol_current;
            end
        end
    end
    pre_t = t;
    t = t.* a;%更新控制参数t为原来的a倍
    line([pre_t,t],[pre_E_best,E_best]);
    pause(0.0001);

end

disp('最优解为:')
for i = 1 : amount
fprintf('->%d', sol_best(i));
end
fprintf('\n');
disp('最短距离为:')
disp(E_best);

save sol_best sol_best





