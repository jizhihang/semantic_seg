clear all
clc
for i=1:10
    names{i} = ['Sample Text ' num2str(i)];
end
names{1}='color8';
names{2}='color27';
names{3}='color64';
names{4}='audio';
names{5}='motion';

load alluseful.mat

delete('label.txt');
delete('discription.txt');
delete('accuracy.txt');
[ll pp]=size(group);
group=group(1:ll/2,:);
audio=audio(1:ll/2,:);
color8=color8(1:ll/2,:);
color27=color27(1:ll/2,:);
color64=color64(1:ll/2,:);
motion=motion(1:ll/2,:);


model = svmtrain(group,[audio]);
  [audio_label, accuracy_audio, decision_values] = svmpredict(finalgroup,[test_audio],model);
  dlmwrite('label.txt',audio_label','-append');
  dlmwrite('discription.txt','Audio Feature','delimiter','','-append');
  dlmwrite('accuracy.txt',accuracy_audio(1),'-append');
  nNodes=pds/2;
nStates=9;
nodePot = zeros(nNodes,nStates);

  
  
   model = svmtrain(group,[color8]);
  [color8_label, accuracy_color8, decision_values] = svmpredict(finalgroup,[test_color8],model);
    dlmwrite('label.txt',color8_label','-append');
  dlmwrite('discription.txt','Color8 Feature','delimiter','','-append');
    dlmwrite('accuracy.txt',accuracy_color8(1),'-append');

   model = svmtrain(group,color27);
  [color27_label, accuracy_color27, decision_values] = svmpredict(finalgroup,[test_color27],model);
    dlmwrite('label.txt',color27_label','-append');
  dlmwrite('discription.txt','Color27 Feature','delimiter','','-append');
      dlmwrite('accuracy.txt',accuracy_color27(1),'-append');

   model = svmtrain(group,[color64]);
  [color64_label, accuracy_color64, decision_values] = svmpredict(finalgroup,[test_color64],model);
    dlmwrite('label.txt',color64_label','-append');
  dlmwrite('discription.txt','Color64 Feature','delimiter','','-append');
      dlmwrite('accuracy.txt',accuracy_color64(1),'-append');

   model = svmtrain(group,[motion]);
  [motion_label, accuracy_motion, decision_values] = svmpredict(finalgroup,[test_motion],model);
    dlmwrite('label.txt',motion_label','-append');
  dlmwrite('discription.txt','Motion Feature','delimiter','','-append');
      dlmwrite('accuracy.txt',accuracy_motion(1),'-append');

   model = svmtrain(group,[audio color8]);
  [audio_color8_label, accuracy_audio_color8, decision_values] = svmpredict(finalgroup,[test_audio test_color8],model);
    dlmwrite('label.txt',audio_color8_label','-append');
  dlmwrite('discription.txt','Audio and Color8 Feature','delimiter','','-append');
      dlmwrite('accuracy.txt',accuracy_audio_color8(1),'-append');

     model = svmtrain(group,[audio color27]);
  [audio_color27_label, accuracy_audio_color27, decision_values] = svmpredict(finalgroup,[test_audio test_color27],model);
      dlmwrite('label.txt',audio_color27_label','-append');
  dlmwrite('discription.txt','Audio and Color27 Feature','delimiter','','-append');
        dlmwrite('accuracy.txt',accuracy_audio_color27(1),'-append');

     model = svmtrain(group,[audio color64]);
  [audio_color64_label, accuracy_audio_color64, decision_values] = svmpredict(finalgroup,[test_audio test_color64],model);
      dlmwrite('label.txt',audio_color64_label','-append');
  dlmwrite('discription.txt','Audio and Color64 Feature','delimiter','','-append');
        dlmwrite('accuracy.txt',accuracy_audio_color64(1),'-append');

     model = svmtrain(group,[motion color8]);
  [motion_color8_label, accuracy_motion_color8, decision_values] = svmpredict(finalgroup,[test_motion test_color8],model);
      dlmwrite('label.txt',motion_color8_label','-append');
  dlmwrite('discription.txt','Motion and Color8 Feature','delimiter','','-append');
        dlmwrite('accuracy.txt',accuracy_motion_color8(1),'-append');

  model = svmtrain(group,[motion color27]);
  [motion_color27_label, accuracy_motion_color27, decision_values] = svmpredict(finalgroup,[test_motion test_color27],model);
      dlmwrite('label.txt',motion_color27_label','-append');
  dlmwrite('discription.txt','Motion and Color27 Feature','delimiter','','-append');
          dlmwrite('accuracy.txt',accuracy_motion_color27(1),'-append');

  model = svmtrain(group,[motion color64]);
  [motion_color64_label, accuracy_motion_color64, decision_values] = svmpredict(finalgroup,[test_motion test_color64],model);
      dlmwrite('label.txt',motion_color64_label','-append');
  dlmwrite('discription.txt','Motion and Color64 Feature','delimiter','','-append');
          dlmwrite('accuracy.txt',accuracy_motion_color64(1),'-append');

    model = svmtrain(group,[audio motion color8]);
  [audio_motion_color8_label, accuracy_audio_motion_color8, decision_values] = svmpredict(finalgroup,[test_audio test_motion test_color8],model);
      dlmwrite('label.txt',audio_motion_color8_label','-append');
  dlmwrite('discription.txt','Audio Motion and Color8 Feature','delimiter','','-append');
          dlmwrite('accuracy.txt',accuracy_audio_motion_color8(1),'-append');

   model = svmtrain(group,[audio motion color27]);
  [audio_motion_color27_label, accuracy_audio_motion_color27, decision_values] = svmpredict(finalgroup,[test_audio test_motion test_color27],model);
        dlmwrite('label.txt',audio_motion_color27_label','-append');
  dlmwrite('discription.txt','Audio Motion and Color27 Feature','delimiter','','-append');
            dlmwrite('accuracy.txt',accuracy_audio_motion_color27(1),'-append');

   model = svmtrain(group,[audio motion color64]);
  [audio_motion_color64_label, accuracy_audio_motion_color64, decision_values] = svmpredict(finalgroup,[test_audio test_motion test_color64],model);
        dlmwrite('label.txt',audio_motion_color64_label','-append');
  dlmwrite('discription.txt','Audio Motion and Color64 Feature','delimiter','','-append');
            dlmwrite('accuracy.txt',accuracy_audio_motion_color64(1),'-append');
            
            model = svmtrain(group,[audio motion]);
  [audio_motion_label, accuracy_audio_motion, decision_values] = svmpredict(finalgroup,[test_audio test_motion ],model);
        dlmwrite('label.txt',audio_motion_label','-append');
  dlmwrite('discription.txt','Audio and Motion ','delimiter','','-append');
            dlmwrite('accuracy.txt',accuracy_audio_motion(1),'-append');
            

  
 
  clear all
  clc
  close all
  load alluseful.mat
  [a1 b1]=size(finalgroup);
nNodes=pds/2;
nStates=9;
nodePot = zeros(nNodes,nStates);
