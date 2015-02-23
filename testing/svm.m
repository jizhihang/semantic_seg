
clear all
clc
close all
addpath(genpath('liblinear-1.96/matlab'));
load feature
load label


bestcv = 0;
for log2c = -10:10,
  for log2g = -10:10
      log2c
      log2g
    cmd = ['-q -v 2 -c ', num2str(2^log2c), ' -p ', num2str(2^log2g)]
    cv = train(label',sparse(feature),cmd);
    if (cv >= bestcv),
      bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
    end
    fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
  end

end
save bow300best.mat 
