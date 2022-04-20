
clc,clear
load("sol_best_GA.mat");
load("dot_loca.mat");

m=size(dot_loca,1);
% scatter(dot_loca(:,1),dot_loca(:,2),'*')
% hold on

minset_x=min(dot_loca(:,1));
minset_y=min(dot_loca(:,2));
maxset_x=max(dot_loca(:,1));
maxset_y=max(dot_loca(:,2));

minset_x=minset_x*0.9;
minset_y=minset_y*0.9;
maxset_x=maxset_x*1.1;
maxset_y=maxset_y*1.1;

M=moviein(m);
for i=1:m-1
    X=[dot_loca(sol_best_GA(i),1) dot_loca(sol_best_GA(i+1),1)];
    Y=[dot_loca(sol_best_GA(i),2) dot_loca(sol_best_GA(i+1),2)];
    plot(X,Y,'b-')
    xlim([minset_x maxset_x])
    ylim([minset_y maxset_y])
    %set(gcf,'position',[70,70,500,500]);
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
