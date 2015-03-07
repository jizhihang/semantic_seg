clear all
clc
close all
fid = fopen('gm.txt', 'w');

mkdir('data');
addpath(genpath('../../sin'))
class={'top_zoomout' 'top_zoomin' 'ground_zoomout' 'ground_zoomin' 'crowd_zoomout' 'crowd_zoomin' 'goalpost'}

nodes={'corner' 'foul' 'penalty'}


for j=1:size(nodes,2)

    s=['events_' nodes{j}]
filename=s;
[A,delimiterOut]=importdata(filename);
count=1
    for k=1:size(A,1)


    pp=generate_temp(nodes{j},k);
pp








fname=['data/' nodes{j} '_' int2str(count)]
fid = fopen(fname, 'w');
for i=1:size(pp,1)
    i;
    pp
    %wr=[int2str(pp(i,1)) ' ' int2str(pp(i,2)) ' ' class(pp(i,3)+1)];
    fprintf(fid,class{pp(i,3)+1});
    fprintf(fid,' ');
    fprintf(fid,int2str(pp(i,1)));
    fprintf(fid,' ');
    fprintf(fid,int2str(pp(i,2)));
    fprintf(fid,'\n');
    
                 

    
    
end
             fclose(fid);
             count=count+1;

             
    end


             



end
