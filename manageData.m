
function manageData(set,user)
%user = 'aof'
%set = 'set1';

rawPath = sprintf('output//%s//%s//rawEEG.dat',set,user);
cleanPath = sprintf('output//%s//%s//%sbaseline.csv',set,user,user);
ansPath = sprintf('output//%s//%s//answer.csv',set,user);

Raw = importdata(rawPath);
Clean = load(cleanPath);
Ans = importdata(ansPath);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
event = Ans.data(:,1)
key = Ans.data(:,2)
answer = Ans.data(:,3)

samplingRate = 512;
oneEpoch = 512 * 2; % no. of frame per epoch with fixation
rawSize = size(Raw,2); % size of data if col=1,row=2
noOfEpoch = fix(rawSize/oneEpoch);

%reshape Rawdata
rearrange = vec2mat(Raw,oneEpoch) 
cutData = rearrange([1:noOfEpoch],[1:samplingRate])

data.raw = cutData
data.clean = Clean;
data.event = event;
data.key = key;
data.ans = answer;
data.pic = Ans.textdata;

if (exist('signal','dir')== 7) %check folder signal
    mkdir signal
end

out = sprintf('signal//%s.mat',user);
save(out,'data');





