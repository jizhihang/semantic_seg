clear all
clc
close all
addpath(genpath('libsvm-3.17/libsvm-3.17/matlab'));
load bow_m1i1_300.mat
filename = 'm1i1.txt';

[A,delimiterOut]=importdata(filename);

window=25;
feature=[]
label=[];
[a1 a2]=size(A);
count=1;
for i=1:a1
    
    str=A(i,1);
    en=A(i,2);
    la=A(i,3);
   i,count
    while(str+window<en)
        hiss=[];
        for j=str:str+window
           hiss=[hiss;bow(j,2:end)];
        end
        hs=mean(hiss);
        feature(count,:)=hs;
          label(count)=la;
   count=count+1;
          size(hs);
        
       str=str+1;
    end
   
end
save feature.mat feature
save label.mat label





