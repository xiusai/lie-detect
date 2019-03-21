%%predictTarget.m

%function predictTarget(user)
%% epoch 250-500m?
utildir = sprintf('%s/utilities',pwd);
path(path,utildir)

user = 'tum';
dataPlot = 3;
filePath = sprintf('signal//%s.mat',user);
load(filePath); %%data
%samplingRate = 512;
startEpoch = fix(0.65*512);
endEpoch = 0.88*512;




%subplot(2,1,1); %(xx,col,xx)

%%%%%%%%%%%%%%%
samples=512;
Fs = 512;         % Sample Indices Vector
N = 512;            % Sampling Frequency (Hz)
n = 0:1:N-1;
T = n/samples*1000;
%legend('Familiar','Unfamiliar')
 %subplot(2,1,1)
% title('Pattern of familiar/unfamiliar group after Average');
 axis([600 1000 -3 3])
 xlabel('Time (ms)');
 ylabel('Amplitude');
% 
% hold on
  %legend('Familiar','Unfamiliar');
%plot(T,data.clean(dataPlot,:),'b')

clipSignal = data.clean(:,[startEpoch:endEpoch]);
%%%%%%%%%%%
%clipColsize = size(clipSignal,2);
%clipColsize = size(clipSignal,2);
T = T(:,[startEpoch:endEpoch]);
%x= [650 650];
% y=[200 -200];
% plot(x,y,'m','LineStyle','--')
% x= [880 880];
% plot(x,y,'m','LineStyle','--')
 %plot(T,clipSignal(dataPlot,:),'r')


n = normalize;
n = train(n,clipSignal,'z-score');
clipSignal = apply(n,clipSignal);

% plot(T,clipSignal(dataPlot,:),'b')
 %gg=clipSignal(dataPlot,:);


eventSize = size(data.event,1); % size of data if col=1,row=2

data1=[];data2=[];data3=[];data4=[];data5=[];data6=[];data7=[];data8=[];ans=[];

%choose target
for i=1:eventSize
    if(data.event(i)==3)
        eventTarget = data.event(i);
        keycheck = data.key(i);
        data.key(i) = 2;        
    end
end
t = 0;
for i=1:eventSize
    
% find target  
    
    if(data.key(i)==2)
        t = i;
    end
    
    switch(data.event(i))
   case 1 
      data1 = [data1; clipSignal(i,:)];
      if(t == i)
        target = data1;
        ans = [ans data.ans(i)];
      end
   case 2 
      data2 = [data2; clipSignal(i,:)];
      if(t == i)
        target = data2;
        ans = [ans data.ans(i)];
      end
   case 3 
      data3 = [data3; clipSignal(i,:)];
      if(t == i)
        target = data3;
        ans = [ans data.ans(i)];
      end
   case 4
      data4 = [data4; clipSignal(i,:)];
      if(t == i)
        target = data4;
        ans = [ans data.ans(i)];
      end
   case 5
      data5 = [data5; clipSignal(i,:)];
      if(t == i)
        target = data5;
        ans = [ans data.ans(i)];
      end
   case 6
      data6 = [data6; clipSignal(i,:)];
      if(t == i)
        target = data6;
        ans = [ans data.ans(i)];
      end
   case 7
      data7 = [data7; clipSignal(i,:)];
      if(t == i)
        target = data7;
        ans = [ans data.ans(i)];
      end     
        case 8
      data8 = [data8; clipSignal(i,:)];
      if(t == i)
        target = data8;
        ans = [ans data.ans(i)];
      end
   end
    
end
%hold on
%  for i=1:3
%     plot(data5(i,:))
%  end
%%
%%find average 

%target2 = data5;


av1 = findAverage(data1);
av2 = findAverage(data2);
av3 = findAverage(data3);
av4 = findAverage(data4);
av5 = findAverage(data5);
av6 = findAverage(data6);
av7 = findAverage(data7);
av8 = findAverage(data8);
%% 


known = [av1;av2;av3;av4];
unknown = [av5;av6;av7;av8];
if(eventTarget <= 4)
    known(eventTarget,:)=[];
else
    unknown(eventTarget-4,:)=[];
end
% hold on
% plot(avKnown)
% plot(avUnknown)
%%%%%%%%
 known = [av2];
 unknown = [av5;av7;av6;av8];
%%%%%%%%%%%%%%
avKnown = findAverage(known);
avUnknown = findAverage(unknown);

 subplot(2,1,1)
 hold on
% title('Pattern of familiar/unfamiliar group after Average');
 axis([600 1000 -3 3])
 xlabel('Time (ms)');
 ylabel('Amplitude');
 %hold on 
 %plot(T,target(1,:),'DisplayName','Target1')
 % plot(T,target(2,:),'DisplayName','Target')
  % plot(T,target(3,:),'DisplayName','Target3')
 plot(T,avKnown,'DisplayName','Familiar','Color','r')
  %plot(T,avUnknown,'DisplayName','Unfamiliar','Color','b')
  legend
hold off
    k1 = [target(1,:) ;avKnown];
    k2 = [target(2,:) ;avKnown];
    k3 = [target(3,:) ;avKnown];
    u1 = [target(1,:) ;avUnknown];
    u2 = [target(2,:) ;avUnknown];
    u3 = [target(3,:) ;avUnknown];

    k1 = pdist(k1);
    k2 = pdist(k2);
    k3 = pdist(k3);
    u1 = pdist(u1);
    u2 = pdist(u2);
    u3 = pdist(u3);
    distance = [k1 k2 k3;u1 u2 u3];
    %calculate distance based similarities
    k1 = 1/(1+k1);
    k2 = 1/(1+k2);
    k3 = 1/(1+k3);
    u1 = 1/(1+u1);
    u2 = 1/(1+u2);
    u3 = 1/(1+u3);

    %test = [];
    test = [k1 k2 k3;u1 u2 u3];

    %acc = [];
    for i=1:size(test,2)
            if( test(1,i) < test(2,i) )
                acc(1,i)=1;
            else
                acc(1,i)=0;
            end
    end

    %predict=[];
    for i=1:size(acc,2)/3
        if(acc(i)+acc(i+1)+acc(i+2)>=2)
            predict = 1;
        else
            predict = 0;
        end
    end