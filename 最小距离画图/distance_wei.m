function [disdot] = distance_wei(dot,dot_loca,temp)
%�����ض��������е�ľ���
%dot���ض��㣬dot_loca�����е����,tempΪ��ȡ������
%��tempΪ1��ʱ�򣬲�ȡ�˵�
%Ĭ��temp��dot_loca�ľ��󳤶�һ������һ���ᱨ�����ﲻ���ñ�������

m=size(dot_loca,1);

disdot=ones(m,1)*99999;

for i=1:m
    if temp(i,1)==0
        length=((dot_loca(i,1) - dot(1,1))^2 + (dot_loca(i,2)-dot(1,2))^2)^0.5;
        disdot(i)=length;
    else
    end

end

