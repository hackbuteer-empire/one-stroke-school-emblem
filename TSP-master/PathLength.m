function len = PathLength(D,Chrom)
%�������и����·�߳���
%����
%D��������֮��ľ���
%Chrom����Ĺ켣

[~,col] = size(D); %����D������
NIND = size(Chrom,1);%NIND���ڳ�ʼ��Ⱥ
len = zeros(NIND,1);%��ʼ��һ����С����NOND��len����¼����
for i = 1:NIND
    p = [Chrom(i,:) Chrom(i,1)];%����p���󱣴�·��ͼ ����һ��·����� �ټ��ϵ�һ�����ɻ�·
    i1 = p(1:end-1);%i1�ӵ�һ����ʼ�����������ڶ���
    i2 = p(2:end);%i2�ӵڶ�����ʼ������������һ��
    len(i,1) = sum(D((i1-1)*col+i2));%�����ÿ��·�ߣ���ʼ��Ⱥ�ĸ��壩�ĳ���
end