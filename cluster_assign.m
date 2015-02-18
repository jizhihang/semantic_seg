run vlfeat-0.9.10/toolbox/vl_setup

load descriptor_m1i1.mat
imageFileNamePrefix = strcat('/Pulsar2/rahul.anand/soccer/semantic_seg/m1_i1');

prefix = strcat(imageFileNamePrefix,'/');

K=300;
[C,A]=vl_kmeans(descriptor,K, 'verbose', 'algorithm', 'elkan');
 vocab=C;
   model=vl_kdtreebuild(single(vocab));
 numWords = size(vocab,2)

i=1;
fname = [prefix num2str(i) '.jpg']
im=imread(fname);
im=single(rgb2gray(im));
[drop, descrs] = vl_sift(im);
  bins=double(vl_kdtreequery(model,vocab,single(descrs)));
histss=histnorm(bins,numWords);









