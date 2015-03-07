
function sin =event_inference(event)
clc
close all 
if nargin<1
    event='corner_2'
end

addpath(genpath('../../sin'))
data.path       = './data/';
data.grammar    = sin_load_grammar([ 'gm.txt']);

    fileID = fopen([data.path '/' event]);
    c=1;
    
   for i=1:1000
        line = fgetl(fileID);
        if ~ischar(line)
            break;
        end
        
        words = regexp(line, '\s*', 'split'); assert(length(words) >= 3);
        data.examples.label.actions(i).name  = words{1};
        data.examples.label.actions(i).start = str2num(words{2});
        data.examples.label.actions(i).end   = str2num(words{3});
        data.examples.label.actions(i).duration=str2num(words{3})-str2num(words{2})+1;
   end
   
   fclose(fileID);
   
   class={'top_zoomout' 'top_zoomin' 'ground_zoomout' 'ground_zoomin' 'crowd_zoomout' 'crowd_zoomin' 'goalpost'}
   copyfile('gm.txt','gm_temp.txt')
   
     fid=fopen('gm_temp.txt','a');
      fprintf(fid,'\n');

   max_duration=0;
   for i=1:size(class,2)
      temp=[];
      for j=1:size(data.examples.label.actions,2)
         
          if (strcmp(data.examples.label.actions(j).name,class{i}) )
             class{i},data.examples.label.actions(j).name
             temp=[temp;data.examples.label.actions(j).duration];
             if(data.examples.label.actions(j).duration > max_duration)
                 max_duration=data.examples.label.actions(j).duration;
             end
          end
      end
      if(isempty(temp))
          mm=0;
          vv=0;
      else
      mm=mean(temp);
      vv=var(temp);
      vv=max(300,vv);
      
      end
      fprintf(fid,'%s duration_mean %d duration_var %d detector_id %d\n',class{i},mm,vv,i);

      
   end
   
  
   
   fclose(fid);
   
   
   
% consuct network
T   = max_duration;
T=2500
sin = sin_load_grammar_n_gen_network('gm_temp.txt', T);

% compute duration factor
durations      = sin_compute_durationFactors(sin.original_grammar, T);

% no detection
detections=[];
detection_mean=[];
for i=1:size(class,2)
    detections{i}= ones(T);
    detection_mean=[detection_mean 1];
end
%detections     = {ones(T), ones(T), ones(T), ones(T), ones(T), ones(T)};
%detection_mean = [1 1 1 1 1 1];

% compute final factor tables
factorTables.s = sin_combine_durations_n_detections(sin.original_grammar, durations, detections, detection_mean);


factorTables.start_prior = ones(1, T);
factorTables.end_prior   = ones(1, T);

factorTables.start_prior(end*0.2:end) = 0;
factorTables.start_prior(end*0.2:end) = 0;

% perform inference

sin = sin_perform_inference(sin, factorTables);


sin = sin_infer_timestep_labels(sin, factorTables);

sin_plot_timesteplabel_distributions(sin);

   save sin.mat sin
   
end
  
  