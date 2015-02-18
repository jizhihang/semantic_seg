run vlfeat-0.9.10/toolbox/vl_setup

imageFileNamePrefix = strcat('/Pulsar2/rahul.anand/soccer/semantic_seg/m1_i2');

prefix = strcat(imageFileNamePrefix,'/');

imageFileNamePref = strcat(prefix,'*.jpg');
av_files=dir(imageFileNamePref);


nframes =length(av_files)
descriptor=[]
for i=1:500:nframes
i
fname = [prefix num2str(i) '.jpg']
im=imread(fname);
im=single(rgb2gray(im));
[drop, descrs] = vl_sift(im);
            descriptor=[descriptor single(descrs)];
size(descriptor)
end
save('descriptor_m1i2.mat','descriptor');
K=300;
[C,A]=vl_kmeans(descriptor,K, 'verbose', 'algorithm', 'elkan');
 vocab=C;
   model=vl_kdtreebuild(single(vocab));
 numWords = size(vocab,2)

bow=[]
for i=1:nframes
i
fname = [prefix num2str(i) '.jpg']
im=imread(fname);
im=single(rgb2gray(im));
[drop, descrs] = vl_sift(im);
  bins=double(vl_kdtreequery(model,vocab,single(descrs)));
histss=histnorm(bins,numWords);
bow=[bow;i histss];
size(bow)
if(mod(i,10)==0)
save bow_m1i2_300.mat bow
end
end

save bow_m1i2_300.mat bow










