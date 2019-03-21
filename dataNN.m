
%% NN to arff for weka
fid=fopen('xxxx.arff','w');
%epoch 300-450


load('nnfile.mat')
dataCount = size(clipSignal,1);
dataSize = size(clipSignal,2);

fprintf(fid, '@relation xx\n\n');
for i=1:dataSize-1
    in = sprintf('@attribute a%d numeric',i);
    fprintf(fid, '%s\n', in);
end
fprintf(fid, '@attribute class {0,1}\n\n');
fprintf(fid, '@data\n');
count =0;
key = [];
for i=1:dataCount
    for j=1:dataSize
        
        if(j==dataSize)
            %fprintf(fid,'?');
            fprintf(fid, '%d',clipSignal(i,j));
            key = [key;clipSignal(i,j)];
       else
        fprintf(fid, '%.4f',clipSignal(i,j));
        if(j < dataSize)
            fprintf(fid, ',');
            count = count+1;
        end
       end
    end
    fprintf(fid, '\n');
   % fprintf('line %d %d\n',i,count);
end
%csvwrite('set165t088.csv',clipSignal)
fclose(fid);
save('key/key5to10.mat','key');