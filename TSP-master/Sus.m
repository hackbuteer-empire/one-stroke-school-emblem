function NewChrIx = Sus(FitnV,Nsel)
%���룺
%FitnV ���������Ӧ��ֵ
%Nsel ��ѡ�������Ŀ
%�����
%NewChrIx ��ѡ������������
[Nind,ans] = size(FitnV);%NindΪFitnV������Ҳ���Ǹ����� ansΪ����1
cumfit = cumsum(FitnV);%����Ӧ���ۼ� ���� 1 2 3 �ۼӺ� 1 3 6 ���������ۻ�����
trials = cumfit(Nind)/Nsel * (rand + (0:Nsel-1)');%cumfit(Nind)��ʾ���Ǿ���cumfit�ĵ�Nind��Ԫ�� A.'��һ��ת�ã�A'�ǹ���ת�� rand����һ�������� (0,1) �ھ��ȷֲ��������
%cumfit(Nind)/Nselƽ����Ӧ��
Mf = cumfit(:,ones(1,Nsel));%�����ɵ��ۻ����� ����90�� ����һ��100*90�ľ��� 
Mt = trials(:,ones(1,Nind))';
[NewChrIx,ans] = find(Mt<Mf & [zeros(1,Nsel);Mf(1:Nind-1,:)]<= Mt);%Ѱ�ҷ���Ԫ��
[ans,shuf] = sort(rand(Nsel,1));%����Nsel*1�����������  ������� A ��Ԫ�ؽ������� ����ѡ���shuf
NewChrIx = NewChrIx(shuf);%��shuf����