clear %���б���ȫ��ɾ��
clc %��������д����е�����

load("dot_loca.mat")

a = 0.99; %�¶�˥������
t0 = 97; tf = 3; t = t0; %��ʼ�¶� ��ֵ
Markov_length = 10000; %Markov������


coordinates = dot_loca;


%coordinates(:,1) = []; %ȥ����һ�еĳ��б��
amount = size(coordinates,1); %������и���

%ͨ���������ķ������������󣨱�����������֮��ľ��룩
coor_x_tmp1 = coordinates(:,1) * ones(1,amount);
coor_x_tmp2 = coor_x_tmp1';
coor_y_tmp1 = coordinates(:,2) * ones(1,amount);
coor_y_tmp2 = coor_y_tmp1';
dist_matrix = sqrt((coor_x_tmp1 - coor_x_tmp2).^2 + (coor_y_tmp1 - coor_y_tmp2).^2);

%������ʼ��
sol_new = 1:amount;
%sol����ǰ·�� new����ÿ�β������½� current����ǰ�� best������ȴ�����е����Ž�
E_current = inf;
E_best = inf;
%E����Ŀ�꺯����ֵ Ҳ���Ǿ���� new�����½�ı������� best���Ž�
sol_current = sol_new;
sol_best = sol_new;
p = 1; %��ʼ��P

figure;
hold on;
box on;
xlim([tf,t0]);
title('�Ż�����')
xlabel('��ǰ�¶�')
ylabel('��ǰ���Ž�')

while t >= tf %���¶ȴ���ֹͣ�¶�ʱ
    for r = 1:Markov_length %Markov������
        %��������Ŷ�
        if(rand < 0.5) %�����������������������
            %������
            ind1 = 0; ind2 = 0;
            while(ind1 == ind2)
                ind1 = ceil(rand.*amount); %�����������������
                ind2 = ceil(rand.*amount);
            end
            tmp1 = sol_new(ind1);
            sol_new(ind1) = sol_new(ind2);
            sol_new(ind2) = tmp1;
        else
            %������
            ind1 = 0; ind2 = 0; ind3 = 0;
            while(ind1 == ind2) || (ind1 == ind3) || (ind2 == ind3) || (abs(ind1 - ind2) == 1) %���任������֮��û��·��
                ind1 = ceil(rand.*amount);
                ind2 = ceil(rand.*amount);
                ind3 = ceil(rand.*amount);
            end
                %tmp1 = ind1;tmp2 = ind2;tmp3 = ind3;
                %����ind1<ind2<ind3
                ind = [ind1 ind2 ind3];
                ind_sort = sort(ind);
                ind1 = ind_sort(1);
                ind2 = ind_sort(2);
                ind3 = ind_sort(3);
                %���н���
                
                tmplist1 = sol_new((ind1 + 1):(ind2 - 1));
                sol_new((ind1 + 1):(ind1 + ind3 - ind2 + 1)) = sol_new((ind2) : (ind3));
                sol_new((ind1 + ind3 - ind2 + 2):ind3) = tmplist1;
        end
        %����Ƿ�����Լ������
        %����Ŀ�꺯������ֵ����������ܣ�
        E_new = 0;
        for i = 1 : (amount - 1)
            E_new = E_new + dist_matrix(sol_new(i),sol_new(i+1));
        end
        %�������һ������һ���ľ���
        E_new = E_new + dist_matrix(sol_new(amount),sol_new(1)); 
        if E_new < E_current %�����ָ��Ž�ʱ ����Ϊ���Ž��·�ߺ�Ŀ�꺯��ֵ
            E_current = E_new;
            sol_current = sol_new;
            if E_new < E_best
                pre_E_best = E_best;
                E_best = E_new;
                sol_best = sol_new;
            end
        else
        %һ����Χ�ڽ��ܷ��Ž�
            if rand < exp(-(E_new - E_current)./t)
                E_current = E_new;
                sol_current = sol_new;
            else
                sol_new = sol_current;
            end
        end
    end
    pre_t = t;
    t = t.* a;%���¿��Ʋ���tΪԭ����a��
    line([pre_t,t],[pre_E_best,E_best]);
    pause(0.0001);

end

disp('���Ž�Ϊ:')
for i = 1 : amount
fprintf('->%d', sol_best(i));
end
fprintf('\n');
disp('��̾���Ϊ:')
disp(E_best);

save sol_best sol_best





