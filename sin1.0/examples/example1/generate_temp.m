function y = generate_temp(x,k)
s=['events_' x];
filename=s;
[A,delimiterOut]=importdata(filename);

filename = 'm1i1.txt';

[B,delimiterOut]=importdata(filename);

    st=A(k,1);
    en=A(k,2);
   
    pp=[];
for i=1:size(B,1)
    if((B(i,1) <=st & B(i,2)>=st) | ( B(i,1)>=st & B(i,2)<=en) | (B(i,1) <=en & B(i,2)>=en))
   pp=[B(i,1) B(i,2) B(i,3);pp]
    end
end



y=pp;
end