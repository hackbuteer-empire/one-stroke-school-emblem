
load("sol_best_GA.mat");
load("dot_loca.mat");

m=size(dot_loca,1);
%scatter(dot_loca(:,1),dot_loca(:,2),'*')
hold on

minset_x=min(dot_loca(:,1));
minset_y=min(dot_loca(:,2));
maxset_x=max(dot_loca(:,1));
maxset_y=max(dot_loca(:,2));

minset_x=minset_x*0.9;
minset_y=minset_y*0.9;
maxset_x=maxset_x*1.1;
maxset_y=maxset_y*1.1;

M=moviein(m);
writerObj=VideoWriter('test.mp4','MPEG-4'); 
open(writerObj);
for i=1:m-1
    X=[dot_loca(sol_best_GA(i),1) dot_loca(sol_best_GA(i+1),1)];
    Y=[dot_loca(sol_best_GA(i),2) dot_loca(sol_best_GA(i+1),2)];
    plot(X,Y,'b-')
    xlim([minset_x maxset_x])
    ylim([minset_y maxset_y])
    M(i)=getframe;
    writeVideo(writerObj,M(i)); 
    hold on
end

movie(M);
close(writerObj); 
%DrawPath(sol_best,dot_loca);
