clear all
clc
close all
addpath(genpath('liblinear-1.96/matlab'));
load feature
load label



label=label';
num_points = size(feature,1);
split_point = round(num_points*0.5);
seq = randperm(num_points);



f1=feature(1:end,:);
l1=label(1:end,:);

f2=feature(1:end,:);
l2=label(1:end,:);


model=train(l2,sparse(f2),'-q -v 2');
model=train(l2,sparse(f2))
[pre,acc,des]=predict(l1,sparse(f1),model,'-q');
[x1 x2]=size(l1);

un=unique(l1);
[p1 p2]=size(un);

classwise=[];
instance=[];
for i=1:p1
   
    lab=find(l1==un(i));
    [pre,acc,des]=predict(l1(lab),sparse(f1(lab,:)),model);
    instances = histc(pre(:),unique(l1))
classwise=[classwise; un(i) acc(1)];
instance=[instance;un(i) instances'];
    
end
classwise
instance
display('Label 0: Top_zoomout');
display('Label 1: Top_zoomin');
display('Label 2: Ground_zoomout');
display('Label 3: Ground_zoomin');
display('Label 4: Crowd_zoomout');
display('Label 5: Crowd_zoomin');
display('Label 6: Goalpost');
