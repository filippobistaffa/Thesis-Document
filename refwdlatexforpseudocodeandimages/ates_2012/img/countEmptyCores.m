filenames3={'random-1.00-0.500' 'random-2.00-0.500' 'random-3.00-0.500' 'scalefree-0.92-0.500' 'scalefree-1.75-0.500' 'scalefree-3.17-0.500' 'smallworld-1.00-0.500' 'smallworld-2.00-0.500' 'smallworld-3.00-0.500'};
filenames2={'random-1.00-0.875' 'random-2.00-0.875' 'random-3.00-0.875' 'scalefree-0.92-0.875' 'scalefree-1.75-0.875' 'scalefree-3.17-0.875' 'smallworld-1.00-0.875' 'smallworld-2.00-0.875' 'smallworld-3.00-0.875'};
filenames1={'random-1.00-1.000' 'random-2.00-1.000' 'random-3.00-1.000' 'scalefree-0.92-1.000' 'scalefree-1.75-1.000' 'scalefree-3.17-1.000' 'smallworld-1.00-1.000' 'smallworld-2.00-1.000' 'smallworld-3.00-1.000'};
%filenames={'random-1.00' 'random-2.00' 'random-3.00' 'scalefree-0.92' 'scalefree-1.75' 'scalefree-3.17' 'smallworld-1.00' 'smallworld-2.00' 'smallworld-3.00'};
%names={'Random_70_80', 'ScaleFree_70_80', 'SmallWorld_70_80'};
%names={'Random-1.000', 'ScaleFree-1.000', 'SmallWorld-1.000'};
names={'Random', 'ScaleFree', 'SmallWorld'};
densities = {'Low', 'Medium', 'High'};
sizeF=size(filenames1, 2);
m = zeros(9,3);
i=1;
for f = 1:sizeF
    matrix = load(strcat('./data/',filenames1{1,f}));
    strcat('./data/',filenames1{1,f})
    100-100*length(matrix(:,2))/50
    m(i,1)= 100- (100*length(matrix(:,2))/50);
    i=i+1;
end
i=1;
for f = 1:sizeF
    matrix = load(strcat('./data/',filenames2{1,f}));
    strcat('./data/',filenames2{1,f})
    100-100*length(matrix(:,2))/50
    m(i,2)= 100- (100*length(matrix(:,2))/50);
    i=i+1;
end
i=1;
for f = 1:sizeF
    matrix = load(strcat('./data/',filenames3{1,f}));
    strcat('./data/',filenames3{1,f})
    100.00-100*length(matrix(:,2))/50.00
    m(i,3)= 100- (100*length(matrix(:,2))/50);
    i=i+1;
end
disp('\begin{table}');
disp('\begin{tabular}{ | l | c | c |  c | c |}');
disp('\hline');
disp('\multirow{2}{*}{\textbf{Topology}} & \multirow{2}{*}{\textbf{Density}}&\multicolumn{3}{c|}{ \textbf{$\%$ Instances  Empty Core}}\\');
disp('\cline{3-5}');
disp('& & M1 & M2 & M3 \\');
for i=1:3
    disp('\hline');
    str = sprintf('\\multirow{3}{*}{%s}',names{i});
    for j=1:3
        disp(sprintf('%s & %s &  $ % .0f\\%%$ & $ %.0f\\%% $ & $ %.0f\\%% $ \\\\', str, densities{j}, m((i-1)*3+j,1), m((i-1)*3+j,2), m((i-1)*3+j,3) ));
        str = '';
    end
end
disp('\hline');
disp('\end{tabular}');
disp('\caption{\label{tab:percentage_core_emptiness} Percentage of instances with empty core under different configurations.}');
disp('\end{table}');
%   \hline
%   \multirow{3}{*}{Random} & Low &  $96.67\%$ &  $96.67\%$ &  $96.67\%$ \\
%    & Medium &  $70\%$ &  $70\%$  &  $70\%$  \\
%    & High &   $80\%$ &   $80\%$ &   $80\%$ \\
%   \hline
%   \multirow{3}{*}{Scale Free} & Low &  $100\%$ &  $100\%$ &  $100\%$ \\
%    & Medium &  $63.33\%$ &  $63.33\%$ &  $63.33\%$ \\
%    & High &  $63.33\%$ &  $63.33\%$ &  $63.33\%$\\
%   \hline
%   \multicolumn{1}{|c|}{\multirow{3}{*}{Small World}} & Low &  $96.67\%$ & 
%   $96.67\%$ &  $96.67\%$ \\
%   \multicolumn{1}{|c|}{} & Medium &  $66.67\%$ &  $66.67\%$  &  $66.67\%$ \\
%   \multicolumn{1}{|c|}{} & High &  $83.33\%$  &  $83.33\%$  &  $83.33\%$\\
%   \hline
% \end{tabular}
% \caption{\label{tab:percentage_core_emptiness} Percentage of instances with
% empty core under different configurations.}
% \end{table}













