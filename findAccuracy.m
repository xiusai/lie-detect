%%findAccuracy.m


%function findAccuracy(user)
%% epoch 250-500m?
utildir = sprintf('%s/utilities',pwd);
path(path,utildir);

user = 'aerk';
filePath = sprintf('signal//%s.mat',user)
load(filePath); %%data

%samplingRate = 512;
startEpoch = fix(0.3*512);
endEpoch = 0.45*512;
%clip 200-450ms 51.97%
%clip 300-500ms 50.6.8%
%clip 300-450 51.89%(4,8),50.6%(3,7),48.1%(2,6),51.89%(1,5)
%clip 300-400 50%
clipSignal = data.clean(:,[startEpoch:endEpoch]) 

%50.63%(4,8)53.16(2,6),51.89%(3,7),50.63%(1,5)
n = normalize;
n = train(n,clipSignal,'z-score');
clipSignal = apply(n,clipSignal);
% 


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
known = [av3;av4;av2];
unknown = [av8;av7;av6];
avKnown = findAverage(known);
avUnknown = findAverage(unknown);

target1 = data1;
target2 = data5;

   
   
    k1 = [target1(1,:) ;avKnown];
    k2 = [target1(2,:) ;avKnown];
    k3 = [target1(3,:) ;avKnown];
    u1 = [target1(1,:) ;avUnknown];
    u2 = [target1(2,:) ;avUnknown];
    u3 = [target1(3,:) ;avUnknown];

    k4 = [target2(1,:) ;avKnown];
    k5 = [target2(2,:) ;avKnown];
    k6 = [target2(3,:) ;avKnown];
    u4 = [target2(1,:) ;avUnknown];
    u5 = [target2(2,:) ;avUnknown];
    u6 = [target2(3,:) ;avUnknown];
    k1 = pdist(k1);
    k2 = pdist(k2);
    k3 = pdist(k3);
    k4 = pdist(k4);
    k5 = pdist(k5);
    k6 = pdist(k6);
    u1 = pdist(u1);
    u2 = pdist(u2);
    u3 = pdist(u3);
    u4 = pdist(u4);
    u5 = pdist(u5);
    u6 = pdist(u6);
    test = [];
    test = [k1 k2 k3 k4 k5 k6;u1 u2 u3 u4 u5 u6]

    acc = []
    for i=1:size(test,2)
            if( test(1,i) < test(2,i) )
                acc(1,i)=1;
            else
                acc(1,i)=0;
            end
    end

    predict=[];
    for i=1:size(acc,2)/3

        if(i==2)
            i=4
        end
        if(acc(i)+acc(i+1)+acc(i+2)>=2)
            predict(i) = 1;
        else
            predict(i) = 0;
        end
    
    end


%% 
    if( exist('result2.mat','file')== 0);
        result = [];
        result.name = {user};
        result.predict = predict;
        result.key = [1,0];
        result.count = 1;
    else
        load('result2.mat')
        result.count = result.count + 1;
        result.name(result.count) = {user};
        result.predict(result.count,:) = predict;
        result.key(result.count,:) = [1,0];
       
    end
 
    disp( result.count )

save('result2.mat','result');

%%%%








% plot(disK(1,:))
% plot(disU(1,:))
%find= disK-disU;


%% test x = input













  
