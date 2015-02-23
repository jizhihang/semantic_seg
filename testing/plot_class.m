clear all
clc
close all
addpath(genpath('liblinear-1.96/matlab'));
load feature
load label



label=label';
num_points = size(feature,1);

x1=50000;


f1=feature(1:x1,:);
l1=label(1:x1,:);

f2=feature(x1:end,:);
l2=label(x1:end,:);

model=train(l2,sparse(f2),'-q -v 2');
model=train(l2,sparse(f2),'-q');

[pre,ac,es]=predict(l1,sparse(f1),model);

plot(pre);
title('Labels vs Chunk No.');
xlabel('Chunk Number ');
ylabel('Labels');
xlim([-0.5,6])
set(gca,'YTickLabel',{'Top Zoomout','Top Zoomin','Ground Zoomout','Ground Zoomin','Crowd Zoomout','Crowd Zoomin','GoalPost'})

