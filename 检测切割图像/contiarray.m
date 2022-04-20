function [indt] = contiarray(ind)

if isempty(ind)
    indt=[];
else
    iter=size(ind,2);
    j=ind(1);
    indt=j;
    for i=2:iter
        j=j+1;
        if ind(i)>j
            j=ind(i);
            indt=[indt j];
        end
    end
end

end

