%find average of the input signal
function average = findAverage(input)

dataSize = size(input,1);
plus= [];

for i=1:dataSize
    if(i==1)
        plus = input(i,:);
    else
        plus = [plus + input(i,:)];
    end
end
average = plus/dataSize;