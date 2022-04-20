
load("sol_best_GA.mat");
load("dot_loca.mat");

m=size(dot_loca,1);
scatter(dot_loca(:,1),dot_loca(:,2),'*')
hold on

M=moviein(m);
writerObj=VideoWriter('test.mp4','MPEG-4'); 
open(writerObj);
for i=1:m-1
    X=[dot_loca(sol_best_GA(i),1) dot_loca(sol_best_GA(i+1),1)];
    Y=[dot_loca(sol_best_GA(i),2) dot_loca(sol_best_GA(i+1),2)];
    plot(X,Y,'b-')
    M(i)=getframe;
    writeVideo(writerObj,M(i)); 
    hold on
end

movie(M);
close(writerObj); 
%DrawPath(sol_best,dot_loca);
