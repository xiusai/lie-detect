
function addData(user)

%user = 'aerk';
folder = 'signal';

filename = sprintf('%s/%s.mat',folder,user);
load(filename);
%clip 
startEpoch = fix(0.65*512);
endEpoch = 0.88*512;
clipdata = data.clean(:,[startEpoch:endEpoch]);

% dataCount = size(traindata,1);
% dataSize = size(traindata,2);
% 
% for i=1:dataCount
%     
%         traindata(i,dataSize+1) = [data.key(i)]; 
%       
% end
%disp(data.event)
%if file already exist
if( exist('trainingdata.mat','file')== 2)
    input = load('trainingdata.mat'); 
    traindata.traindata = [input.traindata.traindata; clipdata];     
    traindata.key = [input.traindata.key; data.key]
else
    traindata.traindata = [clipdata];     
    traindata.key = [data.key]
end
 
save('trainingdata.mat','traindata');
