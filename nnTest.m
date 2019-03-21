[x,t] = wine_dataset;
size(x)
size(t)
setdemorandstream(391418381)
net = patternnet(10);

% net.divideFcn='divideblock';
% net.divideParam.trainRatio=75/100;
% net.divideParam.valRatio=15/100;
% net.divideParam.testRatio=10/100;
view(net)
[net,tr] = train(net,x,t);
nntraintool
plotperform(tr)
testX = x(:,tr.testInd);
testT = t(:,tr.testInd);

testY = net(testX);
testIndices = vec2ind(testY)
plotconfusion(testT,testY)
[c,cm] = confusion(testT,testY)

fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
%plotroc(testT,testY)