
%find Maximum Accuracy
%% distance
% accuracyNo.mat 65.0712 epoch 0.12 to 0.39
% accuracyNormal.mat/NormalD/NormalD1 67.6424 epoch 0.65 to 0.88
%% similarities
%
%
fasai = load('accuracyEuclidean/accuracy100Normalswap.mat');
 kao=load('accuracyEuclidean/accuracy100Normal.mat');
  fasai2=load('accuracyEuclidean/accuracyNormalD.mat');

 maxKao=0;
  maxfa=0;
 maxfa2=0;
for i=1:kao.check.count
    hi=kao.check.acc(i,5);
    if( hi>maxKao )
   
        maxKao = hi;
        K=i;
    end
end

for i=1:fasai.check.count
    hi=fasai.check.acc(i,5);
    
    if( hi>maxfa )
        maxfa = hi;
        F=i;
    end
end
for i=1:fasai2.check.count
    hi=fasai2.check.acc(i,5);
    
    if( hi>maxfa2 )
        maxfa2 = hi;
        F2=i;
    end
end











% ans =[1 0 1];
% acc = [1 0 0];
% a=0;b=0;
% zero=0;
% for i=1:size(acc,2)
%     %know [1 1 1][1 1 1]
%     if((ans(1,i)&&acc(1,i))==1)
%         a = a+1;
%         if(a >= 2)
%             finalResult = 'innocent';
%         end     
%     %unknown [0 0 0][0 0 0]
%     elseif((ans(1,i) || acc(1,i))==0)
%         b = b+1;
%         if(b >= 2)
%             finalResult = 'innocent';
%         end
%     else
%          finalResult = 'guilty';
%     end
% end
