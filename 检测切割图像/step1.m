
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

BW1=edge(data,'Roberts',0.16);
[m,n]=size(BW1);
imshow(BW1);
%���ӻ�ͼ��

%��
other=0;
limit=8;
count=0;
for i=1:m
    if mod(i,2)==other
        ind=find(BW1(i,:));
        iter=size(ind,1);
        for j=1:iter
            o=1;
            while (BW1(i,iter(o))>0||o>=n)
                count=count+1;
                o=o+1;
                if count>limit
                    break
                end
            end
            if count>limit
                other=~other;
                break
            elseif o>n
                BW1(i,:)=0;
            end
        end
    end
end

%��
for j=1:n
    if mod(j,2)==0
        BW1(:,j)=0;
    else
    end
end

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


