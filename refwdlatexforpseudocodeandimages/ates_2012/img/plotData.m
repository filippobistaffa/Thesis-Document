%filenames={'random-1.00-0.875' 'random-2.00-0.875' 'random-3.00-0.875' 'scalefree-0.92-0.875' 'scalefree-1.75-0.875' 'scalefree-3.17-0.875' 'smallworld-1.00-0.875' 'smallworld-2.00-0.875' 'smallworld-3.00-0.875'};
%filenames={'random-1.00-0.500' 'random-2.00-0.500' 'random-3.00-0.500' 'scalefree-0.92-0.500' 'scalefree-1.75-0.500' 'scalefree-3.17-0.500' 'smallworld-1.00-0.500' 'smallworld-2.00-0.500' 'smallworld-3.00-0.500'};
%filenames={'random-1.00-0.333' 'random-2.00-0.333' 'random-3.00-0.333' 'scalefree-0.92-0.333' 'scalefree-1.75-0.333' 'scalefree-3.17-0.333' 'smallworld-1.00-0.333' 'smallworld-2.00-0.333' 'smallworld-3.00-0.333'};
filenames={'random-1.00-1.000' 'random-2.00-1.000' 'random-3.00-1.000' 'scalefree-0.92-1.000' 'scalefree-1.75-1.000' 'scalefree-3.17-1.000' 'smallworld-1.00-1.000' 'smallworld-2.00-1.000' 'smallworld-3.00-1.000'};
%names={'Random_70_80', 'ScaleFree_70_80', 'SmallWorld_70_80'};
%names={'Random-0.875', 'ScaleFree-0.875', 'SmallWorld-0.875'};
%names={'Random-0.500', 'ScaleFree-0.500', 'SmallWorld-0.500'};
%names={'Random-0.333', 'ScaleFree-0.333', 'SmallWorld-0.333'};
names={'Random-1.000', 'ScaleFree-1.000', 'SmallWorld-1.000'};
xtitles={'Low', 'Medium', 'High'};
bw_legend = {'Min','Avg','Max'};
sizeF=size(filenames, 2);

density=[1,2,3;0.92,1.75,3.17;1,2,3];

for f = 1:sizeF
    
strcat('./data/',filenames{1,f})
matrix = load(strcat('./data/',filenames{1,f}));
aug(f) = mean(matrix(:,2));
sem(f) = std(matrix(:,2))/length(matrix(:,2));
augPer(f) = mean(matrix(:,3));
semPer(f) = std(matrix(:,3))/length(matrix(:,3));
minSize(f) = mean(matrix(:,4));
semMinSize(f) = std(matrix(:,4))/length(matrix(:,4));
maxSize(f) = mean(matrix(:,5));
semMaxSize(f) = std(matrix(:,5))/length(matrix(:,5));
avgSize(f) = mean(matrix(:,6));
semAvgSize(f) = std(matrix(:,6))/length(matrix(:,6));

end

densityRandom = density(1:3);
densityScaleFree = density(4:6);
densitySmallWorld = density(7:9);

augRandom = aug(1:3);
augScaleFree = aug(4:6);
augSmallWorld = aug(7:9);

sizeMatrix = [minSize; avgSize; maxSize];
errors = [semMinSize; semAvgSize; semMaxSize];


for i = 1:3

h = figure(i);
m = sizeMatrix(:,3*(i-1)+1:3*i)';
handles.bars = bar(m)
hold on
e = errors(:,3*(i-1)+1:3*i)';
numgroups = size(e, 1); % number of groups
numbars = size(e, 2); % number of bars in a group
ymax = 0;
for j = 1:numbars
    x = get(get(handles.bars(j),'children'), 'xdata');
	x = mean(x([1 3],:));
	handles.errors(j) = errorbar(x, m(:,j), e(:,j), 'k', 'linestyle', 'none', 'linewidth', 2);
	ymax = max([ymax; m(:,j)+e(:,j)]);
end
% for j = 1:3
%     text(j+0.2,  -0.8, xtitles(j), 'fontsize', 20, 'HorizontalAlignment', 'right');
% end
% for j = 1:numbars
% 	xdata = get(handles.errors(j),'xdata');
% 	for k = 1:length(xdata)
% 		text(xdata(k)+0.15,  -0.3, bw_legend(j), 'fontsize', 12, 'HorizontalAlignment', 'right');
%     end
%     pause
% end
%set(gca,'xaxislocation','top');
set(gca, 'XTickLabel', xtitles,'FontSize',18)

xlabel('Density','FontSize',26)
ylabel('Coalition Size', 'FontSize',26)
set(gca,'YLim',[0 11])
%title(titles{i})
 
legend('Min','Avg','Max','Location','NorthOutside','Orientation', 'Horizontal')
legend('boxoff')
print('-dpng','-r500',strcat(names{i},'-Size.png'))
hold off
close(h);
end





for i = 1:3

h =figure(i+3);
m = aug(3*(i-1)+1:3*i);
%m = [m; zeros(1,length(m))];
e = sem(3*(i-1)+1:3*i);
%e = [e; zeros(1,size(m,2))];
handles.bars = bar(m, 'y')
hold on
numgroups = size(m, 1); % number of groups
numbars = size(m, 2); % number of bars in a group
ymax = 0;
%  for j = 1:numbars
    x = get(get(handles.bars(1),'children'), 'xdata');
  	x = mean(x([1 3],:));
    handles.errors(1) = errorbar(x, m, e, 'k', 'linestyle', 'none', 'linewidth', 2);
  	%ymax = max([ymax; m+e]);
 % end
set(gca, 'XTickLabel', xtitles,'FontSize',20)
set(gca,'YLim',[0 20])
xlabel('Density', 'FontSize',26)
ylabel('Average User Gain', 'FontSize',26)
%title(titles{i})
print('-dpng','-r500',strcat(names{i},'-AUG.png'))
hold off
close(h)
end

for i = 1:3

h = figure(i+6);
m = augPer(3*(i-1)+1:3*i);
%m = [m; zeros(1,length(m))];
e = semPer(3*(i-1)+1:3*i);
%e = [e; zeros(1,size(m,2))];
handles.bars = bar(m, 'y')
hold on
numgroups = size(m, 1); % number of groups
numbars = size(m, 2); % number of bars in a group
ymax = 0;
%  for j = 1:numbars
    x = get(get(handles.bars(1),'children'), 'xdata');
  	x = mean(x([1 3],:));
    handles.errors(1) = errorbar(x, m, e, 'k', 'linestyle', 'none', 'linewidth', 2);
  	%ymax = max([ymax; m+e]);
 % end
set(gca, 'XTickLabel', xtitles,'FontSize',20)
%set(gca,'YLim',[0 20])
xlabel('Density', 'FontSize',26)
ylabel('Average Percent User Gain', 'FontSize',26)
%title(titles{i})
print('-dpng','-r500',strcat(names{i},'-AUG-PER.png'))
hold off
close(h)
end
