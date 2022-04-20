%����������Ŵ��㷨�ļ����Ż�
load('Chrom.mat');



MAXGEN = 3000;       %����������
Pc = 0.9;           %������ʣ��൱�ڻ����Ŵ���ʱ��Ⱦɫ�彻��
Pm = 0.05;          %Ⱦɫ�����
GGAP = 0.9;         %����Ǵ�����ͨ���Ŵ���ʽ�õ����Ӵ���Ϊ������*GGAP
D = Distance(dot_loca);    %ͨ������������Լ���i,j����֮��ľ���
N = size(D,1);      %�����ж��ٸ������

gen = 0;
figure;
hold on;
box on;
xlim([0,MAXGEN])
title('�Ż�����')
xlabel('��������')
ylabel('��ǰ���Ž�')
ObjV = PathLength(D,Chrom);%���㵱ǰ·�߳��ȣ������������������Щ����·��
preObjV = min(ObjV);%��ǰ���Ž�
while gen<MAXGEN
    %%������Ӧ��
    ObjV = PathLength(D,Chrom);     %����·�߳���
    line([gen - 1,gen],[preObjV,min(ObjV)]);
    pause(0.0001);
    preObjV = min(ObjV);
    FitnV = Fitness(ObjV);
    %ѡ��
    SelCh = Select(Chrom,FitnV,GGAP);
    %�������
    SelCH = Recombin(SelCh,Pc);
    %����
    SelCh = Mutate(SelCh,Pm);
    %��ת����
    SelCh = Reverse(SelCh,D);
    %�ز����Ӵ�������Ⱥ
    Chrom = Reins(Chrom,SelCh,ObjV);
    %���µ�������
    gen = gen + 1;
end

ObjV = PathLength(D,Chrom);     %����·�߳���
[minObjV,minInd] = min(ObjV);
%DrawPath(Chrom(minInd(1),:),dot_loca)
sol_best_GA=Chrom(minInd(1),:);
save Chrom Chrom
save sol_best_GA sol_best_GA

disp(['�������߹����ܾ��룺',num2str(ObjV(minInd(1)))]);





