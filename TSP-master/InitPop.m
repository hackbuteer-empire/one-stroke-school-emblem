function Chrom = InitPop(NIND,N)%��ʼ����Ⱥ��
%���룺
%NIND����Ⱥ��С
%N������Ⱦɫ�峤�ȣ����и�����
%�����
%��ʼ��Ⱥ
Chrom = zeros(NIND,N);  %���ڴ洢��Ⱥ
for i = 1:NIND
    Chrom(i,:) = randperm(N);%������ɳ�ʼ��Ⱥ,randperm�������÷��Ƿ���һ��1~N����������N�����ǲ�ͬ��
end