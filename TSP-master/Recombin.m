function SelCh = Recombin(SelCh,Pc)
%�������
%���룺
%SelCh ��ѡ��ĸ���
%Pc    �������
%�����
%SelCh �����ĸ���

NSel = size(SelCh,1);
for i = 1:2:NSel - mod(NSel,2)
    if Pc>=rand %�������PC
        [SelCh(i,:),SelCh(i+1,:)] = intercross(SelCh(i,:),SelCh(i+1,:));
    end
end