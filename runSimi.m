%% runAddNN
simitest('aerk');
simitest('ant');
simitest('aof');
simitest('army');
simitest('fasai');
simitest('men');
simitest('noon');
simitest('tum');
simitest('yung');
simitest('miewy');
simitest('neary');
simitest('nony');
simitest('boongy');
simitest('minniey');
simitest('puiy');
simitest('louisy');
simitest('minty');
%%
simitest('aerk2');
simitest('ant2');
simitest('aof2');
simitest('army2');
simitest('fasai2');
simitest('louis2');
simitest('men2');
simitest('noon2');
simitest('tum2');
simitest('yung2');
simitest('miew2y');
simitest('near2y');
simitest('pepper2y');
simitest('pui2y');
%%
simitest('ant3');
simitest('aof3');
simitest('army3');
simitest('fasai3');
simitest('men3');
simitest('near3');
simitest('noon3');
simitest('pui3');
simitest('yung3');
%%
simitest('ant4');
simitest('aof4');
simitest('army4');
simitest('fasai4');
simitest('men4');
simitest('near4');
simitest('noon4');
simitest('pui4');
simitest('tum4');
simitest('yung4');
%%
simitest('ant5');
simitest('aof5');
simitest('fasai5');
simitest('pui5');
%%
simitest('ant6');
simitest('aof6');
simitest('fasai6');
simitest('pui6');
simitest('tum6');
%%
simitest('ant7');
simitest('aof7');
simitest('fasai7');
simitest('pui7');
simitest('tum7');
%%
simitest('ant8');
simitest('aof8');
simitest('fasai8');
simitest('pui8');
simitest('tum8');
%%
simitest('ant9');
simitest('aof9');
simitest('fasai9');
simitest('pui9');
simitest('tum9');
%%
simitest('ant10');
simitest('aof10');
simitest('fasai10');
simitest('pui10');
simitest('tum10');

load('simi.mat');
sizeS =size(forTest,1)
count=0;
for i=1:sizeS
    if(forTest(i,1)==forTest(i,2))
        count=count+1;
    end
end
accurate = (count/sizeS)*100


