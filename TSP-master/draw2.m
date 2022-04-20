
clc,clear
load("sol_best_GA.mat");
load("dot_loca.mat");

m=size(dot_loca,1);
scatter(dot_loca(:,1),dot_loca(:,2),'*')
hold on

M=moviein(m);
for i=1:m-1
    X=[dot_loca(sol_best_GA(i),1) dot_loca(sol_best_GA(i+1),1)];
    Y=[dot_loca(sol_best_GA(i),2) dot_loca(sol_best_GA(i+1),2)];
    plot(X,Y,'b-')
    hold on
    M(i)=getframe;
    I=frame2im(M(i));
    [I,map]=rgb2ind(I,256);
    if i == 1
    imwrite(I,map,'test.gif','gif','Loopcount',inf,'DelayTime',0.2);

    else
    imwrite(I,map,'test.gif','gif','WriteMode','append','DelayTime',0.2);
    end
end

movie(M);
%DrawPath(sol_best,dot_loca);
