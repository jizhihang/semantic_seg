clear all
clc
close all
fid = fopen('gm.txt', 'w');

mkdir('data');
addpath(genpath('../../sin'))
class={'top_zoomout' 'top_zoomin' 'ground_zoomout' 'ground_zoomin' 'crowd_zoomout' 'crowd_zoomin' 'goalpost'}

nodes={'corner' 'foul' 'penalty'}
for j=1:size(nodes,2)
    fea=hist_temp(nodes{j});


mm=min(fea,[],1);
mm
fea


    cn=0;
    for i=1: size(mm,2)

        i;
        mm(i);
        if(mm(i) > 0 & cn==0)
                fprintf(fid,nodes{j} );
             fprintf(fid,' > ' );
        fprintf(fid, class{i});
        cn=1;

        elseif (mm(i) > 0)
                    fprintf(fid, ' and ');

                    fprintf(fid, class{i});


        end


    end
        fprintf(fid,'\n' );
        
        
       
mm=max(fea,[],1);
mm;
fea;
    fprintf(fid,nodes{j} );
    fprintf(fid,' > ' );

    cn=0;
    for i=1: size(mm,2)

        i;
        mm(i);
        if(mm(i) > 0 & cn==0)
        fprintf(fid, class{i});
        cn=1;

        elseif (mm(i) > 0)
                    fprintf(fid, ' or ');

                    fprintf(fid, class{i});


        end


    end
        fprintf(fid,'\n' ); 

end
fclose(fid);
T   = 200;
sin = sin_load_grammar_n_gen_network('gm.txt', T);



% compute duration factor

% no detection
detections     = {ones(T), ones(T), ones(T), ones(T), ones(T), ones(T)};
detection_mean = [1 1 1 1 1 1];
