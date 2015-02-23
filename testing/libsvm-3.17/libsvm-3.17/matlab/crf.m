clear all
clc
close all
load alluseful.mat
load ..\..\..\..\..\..\cvit\transition.mat

finalatt=test_color8;
addpath(genpath('..\..\..\UGM'))
[a1 b1]=size(finalgroup)

model = svmtrain(group,[audio],'-s 0 -t 0 -b 1 -q 1');
  [audio_label, accuracy_audio, decision_values] = svmpredict(finalgroup,[test_audio],model);


nNodes=a1;
nStates=9;
nodePot = zeros(nNodes,nStates);

[a1 b1]=size(finalgroup)


for i=1:a1
   
   attr=finalatt(i,:);
   prob=zeros(1,9);
   [predict_label, accuracy, prob_estimates] = svmpredict(1, attr, model, '-b 1 -q 1');
   
    prob_estimates,predict_label;
    for j=1:9
        k=model.Label(j);
        pro=prob_estimates(j);
        nodePot(i,k)=pro;
    end
    
    
end
nodePot

adj = zeros(nNodes);
for i = 1:nNodes-1
   adj(i,i+1) = 1;
end
adj = adj+adj';
edgeStruct = UGM_makeEdgeStruct(adj,nStates);
transition=diag(1./sum(transition,2))*transition;
edgePot = repmat(transition,[1 1 edgeStruct.nEdges]);

optimalDecoding = UGM_Decode_Chain(nodePot,edgePot,edgeStruct);

correct=0;
error=0;
for i=1:a1
   if(optimalDecoding(i,1)==finalgroup(i,1))
       finalgroup(i,1),optimalDecoding(i,1);
       correct=correct+1;
   else
       error=error+1;
    
   end
   
end
correct
error
acccrf=100*correct/a1;
acccrf

