clc,clear

or_data=imread('ԭͼ��2.png');
dot_loca=zeros(2727,2);

data=rgb2gray(or_data);
%[m,n]=size(data);

% averge=mean(data(:));
%��ͼ�����ƽ���㷨����
% for i=1:m
%     for j=1:n
%         if data(i,j)>averge
%             data(i,j)=255;
%         else
%             data(i,j)=0;
%             
%         end
%     end
% end

%imshow(data);
%m�У�n��
%%
BW1=edge(data,'Roberts',0.16);
[m,n]=size(BW1);
imshow(BW1);
%���ӻ�ͼ��


%%
%��
other=0;
limit=8;
for i=1:m
    if mod(i,2)==other
        ind=find(BW1(i,:));
        [indt]=contiarray(ind);
        iter=size(indt,2);
        if isempty(indt)
        else
            for j=1:iter
                count=0;
                o=indt(j);
                while ((BW1(i,o)>0)&&(o<=n))%�㷨˼��Ϊ��һ��ind��������ʵ�ʺ�BW1��o������������꣬һ��ind�������o,count�ع�0��������һ��
                    count=count+1;
                    o=o+1;
                    if count>limit
                        break
                    end
                end
                if count>limit
                    other=~other;
                    break
                end
            if j==iter
                BW1(i,:)=0;
            end
            end
        end
    end
end

%%
%��
% other=0;
% limit=8;
% for i=1:n
%     if mod(i,2)==other
%         ind=(find(BW1(:,i)))';
%         [indt]=contiarray(ind);
%         iter=size(indt,2);
%         if isempty(indt)
%         else
%             for j=1:iter
%                 count=0;
%                 o=indt(j);
%                 while ((BW1(o,i)>0)&&(o<=n))%�㷨˼��Ϊ��һ��ind��������ʵ�ʺ�BW1��o������������꣬һ��ind�������o,count�ع�0��������һ��
%                     count=count+1;
%                     o=o+1;
%                     if count>limit
%                         break
%                     end
%                 end
%                 if count>limit
%                     other=~other;
%                     break
%                 end
%             if j==iter
%                 BW1(i,:)=0;
%             end
%             end
%         end
%     end
% end
%%
%������е������
k=1;
for i=1:m
    for j=1:n
        if BW1(i,j)>0
            dot_loca(k,1)=i;
            dot_loca(k,2)=j;
            k=k+1;
        end
    end
end
 
save dot_loca dot_loca

imshow(BW1);
title('Robert���ӱ�Ե���');
