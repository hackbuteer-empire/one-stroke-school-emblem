function DrawPath(Chrom,X)
%���룺
%����·��
%���е�����λ��
%�����
%�����̵�·��

R =  [Chrom(1,:) Chrom(1,1)]; %��һ������⣨���壩��Chrom(1,:)ȡ��һ�����ݡ���һ����n�����У���������R��n+1��ֵ����Ϊ�����ֲ���һ��Chrom(1,1)������Ϊ����·������ٻص���㡱
figure;
hold on
plot(X(:,1),X(:,2),'bo')%X(:,1)��X(:,2)�ֱ�����X�������Y������
%plot(X(:,1),X(:,2),'o','color',[1,1,1])%X(:,1)��X(:,2)�ֱ�����X�������Y�����꣬
plot(X(Chrom(1,1),1),X(Chrom(1,1),2),'rv','MarkerSize',20)%������
A = X(R,:);                         %A�ǽ�֮ǰ������˳����R���Һ����´���A��
row = size(A,1);                    %rowΪ������+1
for i = 2:row
    [arrowx,arrowy] = dsxy2figxy(gca,A(i-1:i,1),A(i-1:i,2));    %dsxy2figxy����ת����������¼������
    annotation('textarrow',arrowx,arrowy,'HeadWidth',8,'color',[0,0,1]);%������������������
end
hold off
xlabel('������x')
ylabel('������y')
title('�����̹켣ͼ')
box on