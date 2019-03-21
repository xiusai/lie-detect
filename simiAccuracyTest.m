%% accuracyTest

endd =1;
c= 0;

while(1)
    if(endd < 0.02)
        break;
    end
    start = 0.01;
    
    while(1)
        
        c=c+1;
        if(endd < start)%%if(endd <= start)
            break;
        end

    startEpoch = fix(start*512);
    endEpoch = fix(endd*512);

    simitest('aerk',startEpoch,endEpoch);
    simitest('ant',startEpoch,endEpoch);
    simitest('aof',startEpoch,endEpoch);
    simitest('army',startEpoch,endEpoch);
    simitest('fasai',startEpoch,endEpoch);
    simitest('men',startEpoch,endEpoch);
    simitest('noon',startEpoch,endEpoch);
    simitest('tum',startEpoch,endEpoch);
    simitest('yung',startEpoch,endEpoch);
    simitest('miewy',startEpoch,endEpoch);
    simitest('neary',startEpoch,endEpoch);
    simitest('nony',startEpoch,endEpoch);
    simitest('boongy',startEpoch,endEpoch);
    simitest('minniey',startEpoch,endEpoch);
    simitest('puiy',startEpoch,endEpoch);
    simitest('louisy',startEpoch,endEpoch);
    simitest('minty',startEpoch,endEpoch);
    %%
    simitest('aerk2',startEpoch,endEpoch);
    simitest('ant2',startEpoch,endEpoch);
    simitest('aof2',startEpoch,endEpoch);
    simitest('army2',startEpoch,endEpoch);
    simitest('fasai2',startEpoch,endEpoch);
    simitest('louis2',startEpoch,endEpoch);
    simitest('men2',startEpoch,endEpoch);
    simitest('noon2',startEpoch,endEpoch);
    simitest('tum2',startEpoch,endEpoch);
    simitest('yung2',startEpoch,endEpoch);
    simitest('miew2y',startEpoch,endEpoch);
    simitest('near2y',startEpoch,endEpoch);
    simitest('pepper2y',startEpoch,endEpoch);
    simitest('pui2y',startEpoch,endEpoch);
    %%
    simitest('ant3',startEpoch,endEpoch);
    simitest('aof3',startEpoch,endEpoch);
    simitest('army3',startEpoch,endEpoch);
    simitest('fasai3',startEpoch,endEpoch);
    simitest('men3',startEpoch,endEpoch);
    simitest('near3',startEpoch,endEpoch);
    simitest('noon3',startEpoch,endEpoch);
    simitest('pui3',startEpoch,endEpoch);
    simitest('yung3',startEpoch,endEpoch);
    %%
    simitest('ant4',startEpoch,endEpoch);
    simitest('aof4',startEpoch,endEpoch);
    simitest('army4',startEpoch,endEpoch);
    simitest('fasai4',startEpoch,endEpoch);
    simitest('men4',startEpoch,endEpoch);
    simitest('near4',startEpoch,endEpoch);
    simitest('noon4',startEpoch,endEpoch);
    simitest('pui4',startEpoch,endEpoch);
    simitest('tum4',startEpoch,endEpoch);
    simitest('yung4',startEpoch,endEpoch);
    %%
    simitest('ant5',startEpoch,endEpoch);
    simitest('aof5',startEpoch,endEpoch);
    simitest('fasai5',startEpoch,endEpoch);
    simitest('pui5',startEpoch,endEpoch);
    %%
    simitest('ant6',startEpoch,endEpoch);
    simitest('aof6',startEpoch,endEpoch);
    simitest('fasai6',startEpoch,endEpoch);
    simitest('pui6',startEpoch,endEpoch);
    simitest('tum6',startEpoch,endEpoch);
    %%
    simitest('ant7',startEpoch,endEpoch);
    simitest('aof7',startEpoch,endEpoch);
    simitest('fasai7',startEpoch,endEpoch);
    simitest('pui7',startEpoch,endEpoch);
    simitest('tum7',startEpoch,endEpoch);
    %%
    simitest('ant8',startEpoch,endEpoch);
    simitest('aof8',startEpoch,endEpoch);
    simitest('fasai8',startEpoch,endEpoch);
    simitest('pui8',startEpoch,endEpoch);
    simitest('tum8',startEpoch,endEpoch);
    %%
    simitest('ant9',startEpoch,endEpoch);
    simitest('aof9',startEpoch,endEpoch);
    simitest('fasai9',startEpoch,endEpoch);
    simitest('pui9',startEpoch,endEpoch);
    simitest('tum9',startEpoch,endEpoch);
    %%
    simitest('ant10',startEpoch,endEpoch);
    simitest('aof10',startEpoch,endEpoch);
    simitest('fasai10',startEpoch,endEpoch);
    simitest('pui10',startEpoch,endEpoch);
    simitest('tum10',startEpoch,endEpoch);

    %%
    %count
load('simi.mat');
sizeS =size(forTest,1);
count=0;
for i=1:sizeS
    if(forTest(i,1)==forTest(i,2))
        count=count+1;
    end
end
accurate = (count/sizeS)*100;

    if( exist('accuracySimiUn.mat','file')== 0)
            simija.count = 1;
            simija.acc = [startEpoch,endEpoch,start,endd,accurate];

            save('accuracySimiUn.mat','simija');
        else
            load('accuracySimiUn.mat');
            simija.count = simija.count + 1;
            simija.acc = [simija.acc;startEpoch,endEpoch,start,endd,accurate];
            save('accuracySimiUn.mat','simija');
     end
    delete('simi.mat');

        start = start + 0.1;
        if(start>=1)
            endd = endd - 0.1;
            start = 0.01;
        end
    end
endd = endd - 0.1;
end