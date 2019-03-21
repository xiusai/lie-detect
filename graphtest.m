
%  x= [0  1000];
%  y=[0 100];
%  dat= [54.18 61.19 50.87 83.08 59.5]
%  range = [10 190 420 650 880 1000]
% histogram(dat)
x = [10 190 420 650 880 1000]
y = [54.18 61.19 50.87 83.08 59.5]
%figure
% lablex('percent');
% xlable('index');
b=bar(y,0.6);
% b.FaceColor = [0 .5 .5];
% b.EdgeColor = [0 0.2 0.9];
b.LineWidth = 0.01;
b.x =100;
%hist(y);