%%selectUser.m


function selectUser(user,startEpoch,endEpoch)
%% epoch 250-500m?
utildir = sprintf('%s/utilities',pwd);
path(path,utildir);

%user = 'aerk';
filePath = sprintf('signal//%s.mat',user);
load(filePath); %%data

samplingRate = 512;
%  startEpoch = fix(0.65*512);
%  endEpoch = 0.88*512;


clipSignal = data.clean(:,[startEpoch:endEpoch]);


% 
n = normalize;
n = train(n,clipSignal,'z-score');
clipSignal = apply(n,clipSignal);



eventSize = size(data.event,1); % size of data if col=1,row=2
%???event
data1=[];data2=[];data3=[];data4=[];data5=[];data6=[];data7=[];data8=[];
for i=1:eventSize
    
    switch(data.event(i))
   case 1 
      data1 = [data1; clipSignal(i,:)];
   case 2 
      data2 = [data2; clipSignal(i,:)];
   case 3 
      data3 = [data3; clipSignal(i,:)];
   case 4
      data4 = [data4; clipSignal(i,:)];
   case 5
      data5 = [data5; clipSignal(i,:)];
   case 6
      data6 = [data6; clipSignal(i,:)];
   case 7
      data7 = [data7; clipSignal(i,:)];
   otherwise
      data8 = [data8; clipSignal(i,:)];
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


% hold on
%  plot(av1)
%  plot(av5)
% plot(av7)
% plot(av8)
% %% av4 and av8 are target

known=[];unknown=[];
vk = [1 2 3 4];
vu = [5 6 7 8];
ck = nchoosek(vk,3);
cu = nchoosek(vu,3);
 
 [rowk,colk]=size(ck);
 [rowu,colu]=size(cu);

  checkk=0;checku=0;
 for a=1:rowk*rowu %%allK
     count = 0;
     checkk=checkk+1;
     findTargetK = 1+2+3+4;
     for b = 1:colk
         count = count+1;

          switch(ck(checkk,count))
           case 1 
              known = [known; av1];
           case 2 
              known = [known; av2];
           case 3 
              known = [known; av3];
           case 4
              known = [known; av4];
          end
          
          findTargetK = findTargetK - ck(checkk,count);
          
     end
     
     switch(findTargetK)
           case 1 
             findTargetK = data1;
           case 2 
              findTargetK = data2;
           case 3 
              findTargetK = data3;
           case 4
              findTargetK = data4;
     end
     checkk = 0;
     %%%%%%%%%%%%%%
   
     if(a==1 || (a/rowk)==1 )
         checku=checku+1;
         findTargetU = 5+6+7+8;
         count = 0;
         for b = 1:colu
             count = count+1;

              switch(cu(checku,count))
               case 5 
                  unknown = [unknown; av5];
               case 6 
                  unknown = [unknown; av6];
               case 7 
                  unknown = [unknown; av7];
               case 8
                  unknown = [unknown; av8];
              end

              findTargetU = findTargetU - cu(checku,count);    
         end
         switch(findTargetU)
               case 5
                 findTargetU = data5;
               case 6
                  findTargetU = data6;
               case 7 
                  findTargetU = data7;
               case 8
                  findTargetU = data8;
         end
     end    

    avKnown = findAverage(known);
    avUnknown = findAverage(unknown);

    k1 = [findTargetK(1,:) ;avKnown];
    k2 = [findTargetK(2,:) ;avKnown];
    k3 = [findTargetK(3,:) ;avKnown];
    u1 = [findTargetK(1,:) ;avUnknown];
    u2 = [findTargetK(2,:) ;avUnknown];
    u3 = [findTargetK(3,:) ;avUnknown];

    k4 = [findTargetU(1,:) ;avKnown];
    k5 = [findTargetU(2,:) ;avKnown];
    k6 = [findTargetU(3,:) ;avKnown];
    u4 = [findTargetU(1,:) ;avUnknown];
    u5 = [findTargetU(2,:) ;avUnknown];
    u6 = [findTargetU(3,:) ;avUnknown];
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
 %distance based similarities   
%     k1 = 1/(1+k1);
%     k2 = 1/(1+k2);
%     k3 = 1/(1+k3);
%     k4 = 1/(1+k4);
%     k5 = 1/(1+k5);
%     k6 = 1/(1+k6);
%     u1 = 1/(1+u1);
%     u2 = 1/(1+u2);
%     u3 = 1/(1+u3);
%     u4 = 1/(1+u4);
%     u5 = 1/(1+u5);
%     u6 = 1/(1+u6);
    
    test = [];
    test = [k1 k2 k3 k4 k5 k6;u1 u2 u3 u4 u5 u6];

    acc = [];
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
            i = 4;
        end
        if(acc(i)+acc(i+1)+acc(i+2)>=2)
            predict(i) = 1;
        else
            predict(i) = 0;
        end
          
    end

% 
%% 
    if( exist('result4.mat','file')== 0)
        result = [];
        result.name = {user};
        result.predict = predict;
        result.key = [1,0];
        result.count = 1;
        save('result4.mat','result');
    else
        load('result4.mat')
        result.count = result.count + 1;
        result.name(result.count) = {user};
        result.predict(result.count,:) = predict;
        result.key(result.count,:) = [1,0];
        save('result4.mat','result');
       
    end
end
    %disp( result.count )

%find accuracy per user
   load('result4.mat');
    correct=0;
    total = result.count*2;
    for i=1:result.count
        if(result.predict(i,1)==1)
            correct=correct+1;
        end
        if(result.predict(i,4)==0)
            correct=correct+1;
        end
    end
    accuracy = (correct/total)*100;
    
%     if( exist('userAccuracyReport.mat','file')== 0)
%         testuser = [];
%         testuser.name = {user};
%         testuser.result = [correct total accuracy];
%         testuser.count = 1;
%     else
%         load('userAccuracyReport.mat');
%         testuser.count = testuser.count + 1;
%         testuser.name(testuser.count) = {user};
%         testuser.result = [testuser.result; correct total accuracy];
%     end
%     delete('result4.mat');
% save('userAccuracyReport.mat','testuser');












  