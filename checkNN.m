
% Check prediction from Weka
%Find accuracy from Weka Neural Network
set = 14;
test = 510;
epoch = 10000;
load('key/key5to10.mat')
%ansCol=size(key,2);
row=size(key,1);
k=table2array(predictWeka);
rows=size(k,1);

for i=1:row
    if(k(i)==2)
        k(i,2) = 1;
    else
        k(i,2) = 0;
    end
end

count=0;
for i=1:row
    if(k(i,2)==key(i))
        count=count+1;
    end
end
accurate = (count/row)*100;

if( exist('accuracyWeka510.mat','file')== 2)
    input = load('accuracyWeka510.mat'); 
    accuracyNN = [input.accuracyNN; set test epoch accurate];
else
    accuracyNN = [set test epoch accurate];
end
if(row==rows)
save('accuracyWeka510.mat','accuracyNN');
writefile=1
else
    error=1
end

