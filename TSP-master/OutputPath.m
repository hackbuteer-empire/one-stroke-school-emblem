function p=OutputPath(R)
%��ӡ·�ߺ���
%��1->2->3����ʽ�������д�ӡ·��

R = [R,R(1)];
N = length(R);
p = num2str(R(1));
for i = 2:N
    p = [p,'->',num2str(R(i))];
end
disp(p)