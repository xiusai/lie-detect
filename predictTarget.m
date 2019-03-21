%%predictTarget.m

%function predictTarget(user)
%% epoch 250-500m?
utildir = sprintf('%s/utilities',pwd);
path(path,utildir)

user = 'noon';
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
% subplot(2,1,1)
% title('Pattern of familiar/unfamiliar group after Average');
% axis([600 1000 -3 3])
% xlabel('Time (ms)');
% ylabel('Amplitude');
% 
% hold on
  %legend('Familiar','Unfamiliar');
%plot(T,data.clean(dataPlot,:),'b')

clipSignal = data.clean(:,[startEpoch:endEpoch]);
%%%%%%%%%%%
%clipColsize = size(clipSignal,2);
%clipColsize = size(clipSignal,2);
T = T(:,[startEpoch:endEpoch]);
% x= [650 650];
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
    if(data.event(i)==7)
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
% known = [av2;av3;av1];
% unknown = [av5;av7;av6;av8];
%%%%%%%%%%%%%%

avKnown = findAverage(known);
avUnknown = findAverage(unknown);
  
 plot(T,avKnown,'DisplayName','Familiar')
  plot(T,avUnknown,'DisplayName','Unfamiliar')
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

    %%
   % set screen
   set (gcf, 'Color', [0 0 0] );
 % set the figure to full screen
 set(gcf,'units','normalized','outerposition',[0 0 1 1]);
 % set the axes to full screen down,base,right,pic height
 set(gca,'Unit','normalized','Position',[0.1 0.25 0.4 0.5]);
 % hide the toolbar
 set(gcf,'menubar','none')
 % to hide the title
 set(gcf,'NumberTitle','off');
 
 %%
    % calculate overall
    % acc vs ans
    a=0;b=0;cknow=0;cunknow=0;cans=0;ansk=0;bar1=1;bar2=1;
    for i=1:size(acc,2)
        
        if(ans(1,i)==1)
            ansk = ansk+33.33;
        end
        cknow = cknow+test(1,i);
        cunknow = cunknow+test(2,i);
        finalResult = 'guilty';
        
        %know [1 1 1][1 1 1]
        if((ans(1,i)&&acc(1,i))==1)
            a = a+1;   
        %unknown [0 0 0][0 0 0]
        elseif((ans(1,i) || acc(1,i))==0)
            b = b+1;
        end
        if(b >= 2||a >= 2)
                finalResult = 'innocent';
        end
        %check guilty for first bar
        if(ans(1,i)==0)
            
        else
        end
    end
    
    %%%%
    %%ansk=66.66;
    if(ansk>30)  
        bar1=1000000;
    end
    if(ansk>60)
        
        bar1=100000000000;
    end
    if(ansk>100)
        ansk=100;
        bar1=1000000000000000;
    end
    
    aver =cunknow/(cknow+cunknow);
  
    
    for i=1:aver*10
        bar2 = bar2*100;
    end
%    if(aver>=49)
%        bar2=bar2+1;
%    end
    bar1 = num2str(bar1);
    bar2 = num2str(bar2);

    %ansk = num2str(ansk);
    if(ansk==100||ansk==0)
    textBar1 = sprintf('%d',ansk);
    else
     textBar1 = sprintf('%.2f',ansk);   
    end
    textBar1 = [textBar1 '%'];
    textBar1 = join(textBar1)
%     aver = num2str(aver);
%     
%     
    textBar2 = sprintf('%.1f',aver*100);
    textBar2 = [textBar2 '%'];
    textBar2 = join(textBar2)
%     % show pic
    targetPic = data.pic(t);
    picPath = sprintf('image/%s',targetPic{:});
    RGB = imread(picPath);
   
    
%     header = '';
%     position =  [1 40];
%     value = ['TARGET'];
%     header = insertText(RGB,position,value,'AnchorPoint','LeftBottom','Font','LucidaBrightRegular','BoxColor','w');
%     
 
       %imshow(header,[35 250]);
      %imshow(rgb2gray(RGB),[35 250]);
      %%[1 0.8 0]yellow
      %%[1 0.9 1] pink
      imshow((RGB),[35 250]);
       text(220,-55,'RESULT','rotation',0,'fontsize',70,'color',[1 1 1],'FontName', 'Avenir Next');
       text(350,20,'user : ','rotation',0,'fontsize',70,'color',[1 1 1],'FontName', 'Avenir Next');
       text(450,20,user,'rotation',0,'fontsize',70,'color',[1 1 1],'FontName', 'Avenir Next');
       
       text(350,56,'Answer','rotation',0,'fontsize',20,'color',[1 0.8 0],'FontName', 'Avenir Next');
   
       text(350,80,'10000000000000000001','rotation',0,'fontsize',40,'color',[1 0.7 1],'FontName', 'Avenir Next','backgroundcolor',[1 0.7 1]);
       
       text(350,80,bar1,'rotation',0,'fontsize',40,'color','[0.6 1 1]','FontName', 'Avenir Next','backgroundcolor','[0.6 1 1]');
       text(350,80,textBar1,'rotation',0,'fontsize',30,'color',[1 0.3 1],'FontName', 'Avenir Next');
       
       text(350,105,'Well-know                                                        Unknown','rotation',0,'fontsize',20,'color',[1 1 1],'FontName', 'Avenir Next');
       
       text(350,136,'Predic Result','rotation',0,'fontsize',20,'color',[1 0.9 0],'FontName', 'Avenir Next');
       text(350,160,'10000000000000000001','rotation',0,'fontsize',40,'color',[1,0.3,0.3],'FontName', 'Avenir Next','backgroundcolor',[1,0.3,0.3]);
       text(350,160,bar2,'rotation',0,'fontsize',40,'color',[0.3,1,0.3],'FontName', 'Avenir Next','backgroundcolor',[0.3,1,0.3]);
       text(350,160,textBar2 ,'rotation',0,'fontsize',30,'color',[1,0.3,0.3],'FontName', 'Avenir Next');
       
       text(350,185,'Familiar                                                            Unfamiliar','rotation',0,'fontsize',20,'color',[1 1 1],'FontName', 'Avenir Next');
       
       
       text(400,230,finalResult,'rotation',0,'fontsize',70,'color',[1 1 1],'FontName', 'Avenir Next');
    
%rectangle('Position',[1 2 5 6])
%% 
%     if( exist('result2.mat','file')== 0);
%         result = [];
%         result.name = {user};
%         result.predict = predict;
%         result.key = [1,0];
%         result.count = 1;
%     else
%         load('result2.mat')
%         result.count = result.count + 1;
%         result.name(result.count) = {user};
%         result.predict(result.count,:) = predict;
%         result.key(result.count,:) = [1,0];
%        
%     end
%  
%     disp( result.count )
% 
% save('result2.mat','result');

%%%%
% plot(disK(1,:))
% plot(disU(1,:))
%find= disK-disU;

