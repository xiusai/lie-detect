%findAccuracyAv.m

function findAccuracyAv(user)
%% epoch 250-500m?

%user = 'army';
filePath = sprintf('signal//%s.mat',user)
load(filePath); %%data

%samplingRate = 512;
startEpoch = fix(0.2*512);
endEpoch = 0.4*512;
%clip 200-450ms 51.97%
%clip 300-500ms 51.9%
%clip 300-450 53.28%
%clip 300-400 53.28%
%clip 300-550 50%
clipSignal = data.clean(:,[startEpoch:endEpoch]) 

eventSize = size(data.event,1); % size of data if col=1,row=2
%???event
data1=[];data2=[];data3=[];data4=[];data5=[];data6=[];data7=[];data8=[];
for i=1:eventSize
    
    switch(data.event(i))
   case 1 
      data1 = [data1; clipSignal(i,:)]
   case 2 
      data2 = [data2; clipSignal(i,:)]
   case 3 
      data3 = [data3; clipSignal(i,:)]
   case 4
      data4 = [data4; clipSignal(i,:)]
   case 5
      data5 = [data5; clipSignal(i,:)]
   case 6
      data6 = [data6; clipSignal(i,:)]
   case 7
      data7 = [data7; clipSignal(i,:)]
   otherwise
      data8 = [data8; clipSignal(i,:)]
   end
    
end
%hold on
%  for i=1:3
%     plot(data5(i,:))
%  end
 
%%
%%find average 
av1 = findAverage(data1);
av2 = findAverage(data2);
av3 = findAverage(data3);
av4 = findAverage(data4);
av5 = findAverage(data5);
av6 = findAverage(data6);
av7 = findAverage(data7);
av8 = findAverage(data8);

%% av4 and av8 are target
known = [av1;av2;av3];
unknown = [av5;av6;av7];
avKnown = findAverage(known);
avUnknown = findAverage(unknown);

test1 = [av4 ;avKnown];
test2 = [av4 ;avUnknown];
test3 = [av8 ;avKnown];
test4 = [av8 ;avUnknown];

 %test1=test1.';
% test2=test2.';
% plot(test1(1,:))
% pause(1)
% plot(test1(2,:))
% pause(2)
% plot(test2(2,:))

%% 

disK1 = pdist(test1);
disU1 = pdist(test2);
disK2 = pdist(test3);
disU2 = pdist(test4);

if(disK1 < disU1)
    predict4 = 1; %% yes
else
    predict4 = 0; %%no
end

if(disK2 < disU2)
    predict8 = 1;
else
    predict8 = 0;
end

    if( exist('result.mat','file')== 0);
        result = [];
        result.name = {user};
        result.predict = [predict4,predict8];
        result.key = [1,0];
        result.count = 1;
    else
        load('result.mat')
        result.count = result.count + 1;
        result.name(result.count) = {user};
        result.predict(result.count,:) = [predict4,predict8];
        result.key(result.count,:) = [1,0];
       
    end
    
    


    
    disp( result.count )

save('result.mat','result');

%%%%



% plot(disK(1,:))
% plot(disU(1,:))
%find= disK-disU;


%% test x = input













  