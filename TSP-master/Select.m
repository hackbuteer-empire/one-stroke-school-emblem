function SelCh = Select(Chrom,FitnV,GGAP)
%���룺
%Chrom ��Ⱥ
%FitnV ��Ӧ��ֵ
%GGAP ѡ�����
%�����
%SelCh ��ѡ��ĸ���
NIND = size(Chrom,1);%��Ⱥ��������
NSel = max(floor(NIND * GGAP+.5),2);%ȷ����һ����Ⱥ�ĸ������������������ͼ�Ϊ����
ChrIx = Sus(FitnV,NSel);
SelCh = Chrom(ChrIx,:);