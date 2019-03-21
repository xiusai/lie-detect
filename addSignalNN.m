
function addSignalNN(user)

%user = 'aerk'
folder = 'signal';

filename = sprintf('%s/%s.mat',folder,user);
load(filename)
%clip 
startEpoch = fix(0.65*512);
endEpoch = 0.88*512;
clipSignal = data.clean(:,[startEpoch:endEpoch]) 

dataCount = size(clipSignal,1);
dataSize = size(clipSignal,2);

for i=1:dataCount
    
        clipSignal(i,dataSize+1) = [data.key(i)]; 
      
end
%disp(data.event)
%if file already exist
    if( exist('nnfile.mat','file')== 2)
%     for i=1:size(clipSignal,2);     
%     end
% else
    input = load('nnfile.mat'); 
    clipSignal = [input.clipSignal; clipSignal];        
end
 
save('nnfile.mat','clipSignal');
