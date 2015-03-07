function y = hist_temp(x)
s=['events_' x]
filename=s;
[A,delimiterOut]=importdata(filename);

filename = 'm1i1.txt';

[B,delimiterOut]=importdata(filename);
fea=[];
for k=1:size(A,1)
    st=A(k,1);
    en=A(k,2);
   
    pp=zeros(1,7);
for i=1:size(B,1)
    if((B(i,1) <=st & B(i,2)>=st) | ( B(i,1)>=st & B(i,2)<=en) | (B(i,1) <=en & B(i,2)>=en))
   pp(B(i,3)+1)=pp(B(i,3)+1)+1;
    end
end
if(pp==0)
fea;
else
    fea=[fea;pp];
end

end

y=fea;
end