%% accuracyTest
%delete('result3.mat');
endd =1;
c= 0;

while(1)
    if(endd < 0.2)
        break;
    end
    start = 0.1;
    
    while(1)
        
        c=c+1;
        if(endd < start)%%if(endd <= start)
            break;
        end

    startEpoch = fix(start*512);
    endEpoch = fix(endd*512);

     selectUser('aerk',startEpoch,endEpoch);
    selectUser('ant',startEpoch,endEpoch);
    %%%selectUser('aof',startEpoch,endEpoch);
    selectUser('army',startEpoch,endEpoch);
    selectUser('fasai',startEpoch,endEpoch);
    selectUser('men',startEpoch,endEpoch);
    selectUser('noon',startEpoch,endEpoch);
    selectUser('tum',startEpoch,endEpoch);
    %%%selectUser('yung',startEpoch,endEpoch);
    selectUser('miewy',startEpoch,endEpoch);
    selectUser('neary',startEpoch,endEpoch);
    selectUser('nony',startEpoch,endEpoch);
    %%%selectUser('boongy',startEpoch,endEpoch);
    selectUser('minniey',startEpoch,endEpoch);
    %%%selectUser('puiy',startEpoch,endEpoch);
    selectUser('louisy',startEpoch,endEpoch);
    selectUser('minty',startEpoch,endEpoch);
    %%
    selectUser('aerk2',startEpoch,endEpoch);
    %%%selectUser('ant2',startEpoch,endEpoch);
    selectUser('aof2',startEpoch,endEpoch);
    %%%selectUser('army2',startEpoch,endEpoch);
    %%%selectUser('fasai2',startEpoch,endEpoch);
    selectUser('louis2',startEpoch,endEpoch);
    selectUser('men2',startEpoch,endEpoch);
    %%%selectUser('noon2',startEpoch,endEpoch);
    selectUser('tum2',startEpoch,endEpoch);
    %%%selectUser('yung2',startEpoch,endEpoch);
    selectUser('miew2y',startEpoch,endEpoch);
    selectUser('near2y',startEpoch,endEpoch);
    selectUser('pepper2y',startEpoch,endEpoch);
    %%%selectUser('pui2y',startEpoch,endEpoch);
    %%
    selectUser('ant3',startEpoch,endEpoch);
    selectUser('aof3',startEpoch,endEpoch);
    selectUser('army3',startEpoch,endEpoch);
    selectUser('fasai3',startEpoch,endEpoch);
    %%%selectUser('men3',startEpoch,endEpoch);
    selectUser('near3',startEpoch,endEpoch);
    %%%selectUser('noon3',startEpoch,endEpoch);
    %%%selectUser('pui3',startEpoch,endEpoch);
    %%%selectUser('yung3',startEpoch,endEpoch);
    %%
    %%%selectUser('ant4',startEpoch,endEpoch);
    selectUser('aof4',startEpoch,endEpoch);
    %%%selectUser('army4',startEpoch,endEpoch);
    %%%selectUser('fasai4',startEpoch,endEpoch);
    %%%selectUser('men4',startEpoch,endEpoch);
    selectUser('near4',startEpoch,endEpoch);
    %%%selectUser('noon4',startEpoch,endEpoch);
    %%%selectUser('pui4',startEpoch,endEpoch);
    %%%selectUser('tum4',startEpoch,endEpoch);
    %%%selectUser('yung4',startEpoch,endEpoch);
    %%
    selectUser('ant5',startEpoch,endEpoch);
    selectUser('aof5',startEpoch,endEpoch);
    selectUser('fasai5',startEpoch,endEpoch);
    %%%selectUser('pui5',startEpoch,endEpoch);
    %%
    selectUser('ant6',startEpoch,endEpoch);
    %selectUser('aof6',startEpoch,endEpoch);
    selectUser('fasai6',startEpoch,endEpoch);
    selectUser('pui6',startEpoch,endEpoch);
    selectUser('tum6',startEpoch,endEpoch);
    %%
    selectUser('ant7',startEpoch,endEpoch);
    selectUser('aof7',startEpoch,endEpoch);
    %selectUser('fasai7',startEpoch,endEpoch);
    selectUser('pui7',startEpoch,endEpoch);
    selectUser('tum7',startEpoch,endEpoch);
    %%
    selectUser('ant8',startEpoch,endEpoch);
    selectUser('aof8',startEpoch,endEpoch);
    %selectUser('fasai8',startEpoch,endEpoch);
    selectUser('pui8',startEpoch,endEpoch);
    selectUser('tum8',startEpoch,endEpoch);
    %%
    selectUser('ant9',startEpoch,endEpoch);
    %selectUser('aof9',startEpoch,endEpoch);
    selectUser('fasai9',startEpoch,endEpoch);
    %selectUser('pui9',startEpoch,endEpoch);
    selectUser('tum9',startEpoch,endEpoch);
    %%
    %%%selectUser('ant10',startEpoch,endEpoch);
    selectUser('aof10',startEpoch,endEpoch);
    selectUser('fasai10',startEpoch,endEpoch);
    selectUser('pui10',startEpoch,endEpoch);
    selectUser('tum10',startEpoch,endEpoch);
 
    %%
    %count
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

    if( exist('finalReportUn.mat','file')== 0)
            check.count = 1;
            check.acc = [startEpoch,endEpoch,start,endd,accuracy];

            save('finalReportUn.mat','check');
        else
            load('finalReportUn.mat');
            check.count = check.count + 1;
            check.acc = [check.acc;startEpoch,endEpoch,start,endd,accuracy];
            save('finalReportUn','check');
     end
    delete('result4.mat');

        start = start + 0.1;
        if(start>=1)
            endd = endd - 0.1;
            start = 0.1;
        end
    end
endd = endd - 0.1;
end