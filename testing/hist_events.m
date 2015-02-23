clear all
clc
close all
addpath(genpath('libsvm-3.17/libsvm-3.17/matlab'));

filename = 'events_1';

[A,delimiterOut]=importdata(filename);

filename = 'm1i1.txt';

[B,delimiterOut]=importdata(filename);
fea=[];
for k=1:size(A,1)
    st=A(k,1);
    en=A(k,2);
    st,en
    pp=zeros(1,7);
for i=1:size(B,1)
    if((B(i,1) <=st & B(i,2)>=st) | ( B(i,1)>=st & B(i,2)<=en) | (B(i,1) <=en & B(i,2)>=en))
   pp(B(i,3)+1)=pp(B(i,3)+1)+1;
    end
end
   fea=[fea;pp]; 

end


final=[min(fea);mean(fea);max(fea)];


bar(final')
set(gca,'XTickLabel',{'Top Zo','Top Zin','Ground Zo','Ground Zin','Crowd Zo','Crowd Zin','GoalP'})
ylabel('Frequency');
title 'Foul Event'


legend('Minimum','Average','Maximum');

