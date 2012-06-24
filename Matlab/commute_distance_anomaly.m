function commute_distance_anomaly(dataset)
% commute distances from knn graph derived from data
tic
k1 = 10; % number of k nearest neighbours of graph
k2 = 15; % number of k nearest neighbours for outlier detection
N = 40; % top N outliers

pEigens = 0.1;  % pecentage of smallest eigenvectors for approximation
maxEigens = 50; % maximum No of smallest eigenvectors for approximation
pSampling = 01; % pecentage of samples

kRP = 200;      % columns of random projection matrix
scale = 1;      % sparsity of the random matrix

graph_type = 2; % knn graph type, mutual knn
similarity = 'euclidean'; % knn similarity metric
sigma = 0;

filename = char(strcat('Datasets/', dataset));

%lastState = load('random_KDD2011.mat','randnState','randState');
%rand('state',lastState.randState)
%randn('state',lastState.randnState)

randnState = randn('state');
randState = rand('state');
% save('random_KDD2011.mat','randnState','randState');

 
tic
disp 'Test effectiveness'
%k1=10; k2=20; kRP=200; N=50;
%%%  expEffectiveness(DatasetSize, d, nOutliers, nTrials, k1, similarity, k2, kRP, N, outfile)
%resultEffectiveness = expEffectiveness([4000:4000:20000], 3, 50, 1, k1, 'RBF', k2, kRP, N, 'Output/effectiveness_RBF.txt');
%resultEffectiveness = expEffectiveness([2000:2000:10000], 3, 50, 10, k1, 'euclidean', k2, kRP, N, 'Output/effectiveness_EUC.txt');
toc

tic
disp 'Test performance'
%k1=10; k2=20; kRP=200; N=50;
%%%  expPerformance(DatasetSize, d, nOutliers, nTrials, k1, similarity, k2, kRP, N, outfile)
%resultPerformance = expPerformance([20000:20000:100000], 3, 50, 1, k1, 'RBF', k2, kRP, N, 'Output/performance_RBF.txt');
%resultPerformance = expPerformance([10000:10000:50000], 3, 50, 10, k1, 'euclidean', k2, kRP, N, 'Output/performance_EUC.txt');
toc

%checkkRP('Datasets/testCD.txt', [10:10:50 100:100:500], 10, 'euclidean', 15, 40);

%%% analyseRealDataset(filename, hasHeader, preprocess, outfile, graph_type, similarity, sigma, k1, OLabel)
% analyseRealDataset('Datasets/segmentation_sampled.csv', false, false, 'Output/analysis_segementation_sampled.txt', graph_type, 'RBF', 0, 20, {'1'});
% analyseRealDataset('Datasets/spam_sampled.csv', false, true, 'Output/analysis_spam_sampled.txt', graph_type, 'RBF', 0, k1, {'1'});
% analyseRealDataset('Datasets/musk_sampled.csv', false, true, 'Output/analysis_musk_sampled.txt', graph_type, 'RBF', 0, 20, {'1'});
% analyseRealDataset('Datasets/pendigits_sampled_1.csv', false, true, 'Output/analysis_pendigits_sampled_1.txt', graph_type, 'RBF', 0, 20, {'1'});
% analyseRealDataset('Datasets/usps_all_sampled.csv', false, true, 'Output/analysis_usps_all_sampled.txt', graph_type, 'RBF', 0, 100, {'1'});
% analyseRealDataset('Datasets/magicgamma_sampled.csv', false, true, 'Output/analysis_magicgamma_sampled.txt', graph_type, 'RBF', 0, 20, {'1'});
% analyseRealDataset('Datasets/letter-recognition_sampled.csv', false, true, 'Output/analysis_letter-recognition_sampled.txt', graph_type, 'RBF', 0, 20, {'1'});

% analyseRealDataset('Datasets/led_sampled.csv', false, false, 'Output/analysis_led_sampled.txt', graph_type, 'RBF', k1, {'0'});
% analyseRealDataset('Datasets/pima_sampled.csv', false, true, 'Output/analysis_pima_sampled.txt', graph_type, 'RBF', k1, {'1'});
% analyseRealDataset('Datasets/kddcup_2000_100.csv', false, true, 'Output/analysis_kddcup_2000_100.txt', graph_type, 'RBF', k1);
% analyseRealDataset('Datasets/spam_2788_50.csv', false, true, 'Output/analysis_spam_2788_50.txt', graph_type, 'RBF', k1);
% analyseRealDataset('Datasets/boundary.csv', false, true, 'Output/analysis_boundary.txt', graph_type, 'RBF', k1);
% analyseRealDataset('Datasets/ism.csv', false, true, 'Output/analysis_ism.txt', graph_type, 'RBF', k1);

%%% checkRealDataset(filename, hasHeader, preprocess, hasGraph, outfile, graph_type, similarity, sigma, k1, k2, kRP, N, OLabel)
% checkRealDataset('Datasets/segmentation_sampled.csv', false, true, false, 'Output/output_segmentation_sampled_N.txt', graph_type, 'euclidean', 0, k1, k2, kRP, 30, {'1'});
% checkRealDataset('Datasets/spam_sampled.csv', false, true, false, 'Output/output_spam_sampled_N.txt', graph_type, 'euclidean', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/musk_sampled.csv', false, true, false, 'Output/output_musk_sampled_N.txt', graph_type, 'euclidean', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/pendigits_sampled.csv', false, true, false, 'Output/output_pendigits_sampled_N.txt', graph_type, 'euclidean', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/usps_all_sampled.csv', false, true, false, 'Output/output_usps_all_sampled_N.txt', graph_type, 'euclidean', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/magicgamma_sampled.csv', false, true, false, 'Output/output_magicgamma_sampled_N.txt', graph_type, 'euclidean', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/letter-recognition_sampled.csv', false, true, false, 'Output/output_letter-recognition_sampled_N.txt', graph_type, 'euclidean', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/connect4_sampled.csv', false, true, false, 'Output/output_connect4_sampled.txt', graph_type, 'RBF', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/covtype_sampled.csv', false, true, false, 'Output/output_covtype_sampled.txt', graph_type, 'RBF', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/pokerhand_sampled.csv', false, true, false, 'Output/output_pokerhand_sampled.txt', graph_type, 'RBF', 0, k1, k2, kRP, 100, {'1'});

% checkRealDataset('Datasets/segmentation_sampled.csv', false, true, false, 'Output/output_segmentation_sampled_RBF.txt', graph_type, 'RBF', 0, k1, k2, kRP, 30, {'1'});
% checkRealDataset('Datasets/spam_sampled.csv', false, true, false, 'Output/output_spam_sampled_RBF.txt', graph_type, 'RBF', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/musk_sampled.csv', false, true, false, 'Output/output_musk_sampled_RBF.txt', graph_type, 'RBF', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/pendigits_sampled.csv', false, true, false, 'Output/output_pendigits_sampled_RBF.txt', graph_type, 'RBF', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/usps_all_sampled.csv', false, true, false, 'Output/output_usps_all_sampled_RBF.txt', graph_type, 'RBF', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/magicgamma_sampled.csv', false, true, false, 'Output/output_magicgamma_sampled_RBF.txt', graph_type, 'RBF', 0, k1, k2, kRP, 100, {'1'});
% checkRealDataset('Datasets/letter-recognition_sampled.csv', false, true, false, 'Output/output_letter-recognition_sampled_RBF.txt', graph_type, 'RBF', 0, k1, k2, kRP, 100, {'1'});


% checkRealDataset('Datasets/led_sampled.csv', false, true, false, 'Output/output_led_sampled.txt', graph_type, 'RBF', k1, k2, kRP, 10, {'0'});
% checkRealDataset('Datasets/pima_sampled.csv', false, true, false, 'Output/output_pima_sampled.txt', graph_type, 'RBF', k1, k2, kRP, 50, {'1'});
% checkRealDataset('Datasets/kddcup_2000_200.csv', false, true, false, 'Output/output_kddcup_2000_200.txt', graph_type, 'RBF', k1, k2, kRP, 200, {('1')});
% checkRealDataset('Datasets/boundary.csv', false, true, false, 'Output/output_boundary.txt', graph_type, 'RBF', k1, k2, kRP, 123);
% checkRealDataset('Datasets/ism.csv', false, true, false, 'Output/output_ism.txt', graph_type, 'RBF', k1, k2, kRP, 260);
% checkRealDataset('Datasets/breast-w.names.csv', false, false, false, 'Output/output_breast-w.names.txt', graph_type, 'RBF', 'euclidean', k1, k2, kRP, 212);
% checkRealDataset('Datasets/cam0.0.data.csv', false, false, false, 'Output/output_cam0.0.data.txt', graph_type, 'RBF', k1, k2, kRP, 463);

%DBLP_graph_creation()
%DBLP_graph_analysis('Output/DBLP_DM_10.txt');

disp 'Reading data file ...';
tRead = tic ;
X = csvread(filename);
toc(tRead);

n = size(X,1)
d = size(X,2)

disp 'Data preprocessing ...';
tPre = tic ;
% randomization the data
% index = randperm(n);
% X = X(index,:);

% normalization
Z = X; 
% Z = zscore(X);
% Z = minmaxScale(X);
toc(tPre);

[Y, variances] = PCADR(Z,2);
variances

%result = checkk2(Z, 5, 100, 5, k1, 'euclidean', kRP, 40);

% disp 'Calculating distance based ED ...';
% tEDOF = tic;
% [O1,OF1] = TopN_Outlier_Pruning_Block(Z, k2, N, N)
% t1 = toc(tEDOF)
% 
% disp 'Calculating LOF ...';
% tLOF = tic;
% [O2,OF2] = LOF_Outlier(Z, k2, N)
% t2 = toc(tLOF)

if sigma == 0 && strcmp(similarity, 'RBF') % self tune
    sigma = kernel_bandwidth(Z, k1);
end
disp 'Building knn graph ...';
tGraph = tic;
if pSampling==1
    G = knn_components_sparse(Z, k1, graph_type, similarity, sigma);
    G = connect_components_mix(Z, G, similarity, sigma);
    sampled_vertices = 1:n;
else
    [G, sampled_vertices] = knn_sampling(Z, k1, graph_type, k2, pSampling, similarity);
end
sprintf('No. of sampled vertices = %d', size(sampled_vertices))
t0 = toc(tGraph)
%disp 'Writing the graph to file graph.mat';
%save('graph.mat', 'G');

% disp 'Calculating distance based CTD ...';
% tCDOF = tic;
% [O3, OF3, Y_CD, Y_time, knn_time_CD] = TopN_Outlier_Pruning_Block_CTD(G, pEigens, maxEigens, k2, N, N);
% t3 = toc(tCDOF)

disp 'Calculating distance based CTD-ST ...';
tCDOFa = tic;
[O3a, OF3a] = TopN_Outlier_Pruning_Block_CTD_ST(G, kRP, scale, k2, N, N);
t3a = toc(tCDOFa)

% disp 'Calculating Outrank ...';
% tOR = tic;
% [O4,OF4] = OutRankA(G, 1e-6, 1e6, N);
% t4 = toc(tOR)

% t0
% t1
% t2
% t3 = t0 + t3
% t3a = t0 + t3a
% 
% OF3r(O3) = OF3;
% OF3ar(O3a) = OF3a;
% disp 'Compares between CDOF and aCDOF'
% pIntersection = size(intersect(O3(1:N)', O3a(1:N)'),1)/N
% % pRank = corr(OF3r', OF3ar', 'type', 'Spearman')

label = O3a(1:N);
drawGraph('PCA plot', G, Y(sampled_vertices,:), true, label);

O = sampled_vertices(O3a);
OF = OF3a;

disp 'Writing the result to file output.csv';
csvwrite('output.csv',[O' OF']);

'aaa'


%------------------------------------------------------------------
function DBLP_graph_creation()
nPapers = 10; % number of share papers threshold
% outfile = 'C:/Khoa/Matlab/Datasets/DBLP_all_coauthors.mat';
outfile = 'C:/Khoa/SVN/Matlab/Datasets/DBLP_DM_coauthors_min10.mat';

%%% full graph for data mining conferences (KDD, PKDD, PAKDD, ICDM, SDM)
% filename = 'C:\Khoa\Data\DBLP\DBLP_all_coauthors.csv';
filename = 'C:\Khoa\Data\DBLP\DBLP_DM_coauthors.csv';
X = csvread(filename);
G = sparse([X(:,1); X(:,2)],[X(:,2); X(:,1)], [X(:,3); X(:,3)]);

% author names
% filename = 'C:\Khoa\Data\DBLP\DBLP_all_authors.csv';
filename = 'C:\Khoa\Data\DBLP\DBLP_DM_authors.csv';
disp 'Getting labels ...';
fid = fopen(filename);
%labels = textscan(fid, '%s %*[^\n]','delimiter', ','); % read 1st column
labels = textscan(fid, '%*s %s %*[^\n]','delimiter', ','); % read 2nd column
labels = labels{1}; 
fclose(fid);

%G_f = G;
%labels_f = labels;

%%% retain authors who has at least nPapers publications, node weight can be less than nPapers due to asymmetry 
% n = size(G,1);
% index = []; % authors to be kept (share publications >= nPapers)
% for i=1:n
%     if sum(G(i,:)) >= nPapers % keep this author
%         index = [index; i];
%     end
% end
% G_f = G(index,index); % filterred graph
% labels_f = labels(index);
 
%%% retain authors who has at least nPapers publications, considering asymmetry 
flag = false; % stop condition
G_f = G;
labels_f = labels;
while flag == false
    n = size(G_f,1);
    index = []; % authors to be kept (share publications >= nPapers)
    flag = true;
    for i=1:n
        if sum(G_f(i,:)) >= nPapers % keep this author
            index = [index; i];
        else 
            flag = false;
        end
    end
    G_f = G_f(index,index); % filterred graph
    labels_f = labels_f(index);
end

if max(components(G_f))>1 % disconnected graph, use only the largest component
    disp 'The graph is not connected, extract only the largest component'
    [ci, sizes] = components(G_f);
    [maxs, maxi]=max(sizes); % find the largest component
    index = find(ci == maxi);
    G_f = G_f(index, index);
    labels_f = labels_f(index);
end

G = G_f;
labels = labels_f;
save(outfile, 'G', 'labels');

'aaa'


%------------------------------------------------------------------
function DBLP_graph_analysis(output)
outfile = 'C:/Khoa/Matlab/Datasets/DBLP_DM_coauthors_min10.mat';

load(outfile);

disp 'Calculating distance based CTD-ST ...';
n = size(G,1); m = nnz(G)/2; kRP = m; scale = 1; k2 = 10; N = 12; 
[O, OF] = TopN_Outlier_Pruning_Block_CTD(G, 1, n, k2, N, N); % CD
% [O1, OF1] = TopN_Outlier_Pruning_Block_CTD_ST(G, kRP, scale, k2, N, N); % CD_ST
% N = size(find(OF>mean(OF)+3*std(OF)),2);

str = sprintf('Analysis of DBLP database for main data mining conferences:\n');
str = [str sprintf('n = %d, m = %d, avg node degree = %0.2f, avg node weight = %0.2f\n\n', n, m, m/n, full(sum(sum(G))/(2*n)))];

str = [str sprintf('Outliers (N = %d, k2 = %d): %s\n', N, k2, num2str(O(1:N)))];
for i=1:N
    str = [str sprintf('%s (index %d): degree = %d, weight = %0.2f\n', char(labels{O(i)}), O(i), full(nnz(G(O(i),:))), full(sum(G(O(i),:))))];         
end

str = [str sprintf('\nCluster analysis: ratio r between intra and inter cluster\n')];
for i=1:n
   str = [str sprintf('%s: r = %0.2f\n',  char(labels(i)), full(DBLP_DM_cluster(G,i)))];
end

str

fid_out = fopen(output,'w');
fprintf(fid_out, '%s', str);
fclose(fid_out);

'aaa'


%------------------------------------------------------------------
function r = DBLP_DM_cluster(G, c)
% estimate the inter and intra connections among c and its neighbors in G
% G: author graph
% c: index of a cluster center c
% r: ratio between intra and inter-connections
neighbors1 = union(c,find(G(c,:))); % direct neighbors of c

neighbors2 = []; % neighbors of neighbors of c
for i=1:size(neighbors1,2)
    neighbors2 = union(neighbors2,find(G(neighbors1(i),:))); % 2nd order neighbors of c
end
neighbors2 = setdiff(neighbors2,neighbors1);

neighbors = union(neighbors1,neighbors2);

% r = nnz(G(neighbors1',neighbors1'))/(nnz(G(neighbors',neighbors'))-nnz(G(neighbors1',neighbors1'))-nnz(G(neighbors2',neighbors2')))
r = sum(sum(G(neighbors1',neighbors1')))/(sum(sum(G(neighbors',neighbors')))-sum(sum(G(neighbors1',neighbors1')))-sum(sum(G(neighbors2',neighbors2'))));

%------------------------------------------------------------------
function SplitSyntheticData(filename, nTests, TestsetOutlierPercentage)
% split the dataset in file name as training set and test set
% nTests: the number of objects in test set, testset includes 
% TestsetOutlierPercentage of outliers
% filename has 50 outliers in the bottom of the file

disp 'Reading the data file'
X = csvread(filename);
n = size(X,1);

nTrains = n - nTests;
% TestsetOutlierPercentage = 0.2;

index = randperm(n - TestsetOutlierPercentage*nTests);
trainingset = X(index(1:nTrains),:);
testset = X(index(nTrains+1:n - TestsetOutlierPercentage*nTests),:);
testset = [testset; X(n - TestsetOutlierPercentage*nTests + 1:n,:)];

index = randperm(nTests);
testset = testset(index,:);

hold on;
h = plot(trainingset(:,1),trainingset(:,2),'.r')
h = plot(testset(:,1),testset(:,2),'.b')
hold off;

disp 'Writing the data to training and test set'
csvwrite([filename(1:size(filename,2)-4) '_train.txt'], trainingset);
csvwrite([filename(1:size(filename,2)-4) '_test.txt'], testset);

'aaa'


%------------------------------------------------------------------
function SplitData(filename, nTests, TestsetOutlierPercentage)
% split the dataset in file name as training set and test set
% nTests: the number of objects in test set, testset includes 
% TestsetOutlierPercentage of outliers
% major_class: label for major class

disp 'Reading the data file'
X = csvread(filename);
n = size(X,1);

index = randperm(n);
X = X(index,:);

nOutliers = nTests*TestsetOutlierPercentage;

testIndex = zeros(nTests, 1);
i = 0; % index for non-outliers in testset
j = 0; % index for outliers in testset
for k=1:n
    if X(k,1)==0 && i<nTests - nOutliers % non-outliers
        i = i+1;
        testIndex(i+j) = k;
    elseif X(k,1)==1 && j<nOutliers % outliers
        j = j+1;
        testIndex(i+j) = k;
    elseif i+j == nTests
        break
    end
end

testset = X(testIndex,:);
trainingset = X(setdiff(1:n,testIndex),:);

disp 'Writing the data to training and test set'
csvwrite([filename(1:size(filename,2)-4) '_train.csv'], trainingset);
csvwrite([filename(1:size(filename,2)-4) '_test.csv'], testset);

'aaa'


function X = datagen(n, d, nOutliers)
% X: dataset
% n: dataset size
% d: dimensionality
% nOutliers: number of outliers

nNormals = n - nOutliers;
    
X = zeros(n,d);
count = 0;
nC = 0; % No. of clusters
while count<nNormals
    % add clusters
    nj = round(rand*n/4); % 0-n/4 points
    count = count + nj;
    if count > nNormals
        nj = nNormals - (count - nj);
        count = nNormals;
    end
    nC = nC + 1;

    R = zeros(nj,d);
    for i=1:d
        m = rand*100;
        s = rand*randi(10,1); 
        
        r = normrnd(m, s, nj, 1); 
        R(:,i) = r;   
    end
    
    X(count-nj+1:count,:) = R;        
end

% add outliers to the end
r = [];
for i=1:nOutliers
    o = rand(1,d)*100;
    r = [r; o];                            
end
X(nNormals+1:n,:) = r;


%------------------------------------------------------------------
function analyseRealDataset(filename, hasHeader, preprocess, outfile, graph_type, similarity, sigma, k1, OLabel)
% cluster analysis in real dataset with labels in first column
% filename: file to be clustered
% hasHeader: if there is a header in the 1st row
% preprocessed: pre-process (scale, zscore, etc.), data or not

% graph_type = 2; % knn graph type
% similarity = 'euclidean'; % knn similarity metric
% sigma = 0; % bandwidth of RBF function

% OLabel = {'1'};

disp 'Reading data file ...';
if hasHeader == true
    row = 1;
else
    row = 0;
end
col = 1; % class column
X = dlmread(filename, ',', row, col);

n = size(X,1)
d = size(X,2)

disp 'Getting labels ...';
fid = fopen(filename);
labels = textscan(fid, '%s %*[^\n]','delimiter', ','); % read 1st column
labels = labels{1};
if hasHeader == true
    labels(1) = [];
end
fclose(fid);
O = find(ismember(labels, OLabel)==1);

% normalization
if preprocess == true
    Z = zscore(X);
    % Z = minmaxScale(X);
else
    Z = X; 
end
clear X;

if sigma == 0 && strcmp(similarity, 'RBF') % self tune
    sigma = kernel_bandwidth(Z, k1);
end

disp 'Creating knn graph ...'
G = knn_components_sparse(Z, k1, graph_type, similarity, sigma);
[ci, sizes] = components(G);
s = size(sizes,1); % # of connected components

str = sprintf('Data file: %s (n = %d, d = %d)\n', filename, n, d);
str = [str sprintf('Outliers (N = %d): %s\n', size(O,1), num2str(O'))];

str = [str sprintf('All points: Average node degree = %0.2f, average weight degree = %0.2f\n', nnz(G)/n, full(sum(sum(G)))/n)];
str = [str sprintf('Outliers: Average node degree = %0.2f, average weight degree = %0.2f\n', nnz(G(O,:))/size(O,1), full(sum(sum(G(O,:))))/size(O,1))];

str = [str sprintf('There are %d connected components (preprocess = %d, graph type = %d, k1 = %d, similarity = %s, sigma = %f)\n\n', s, preprocess, graph_type, k1, similarity, sigma)];

nOutliers = zeros(s,1);  % # of outliers in each components
for i=1:s  
    O_s = find(ismember(labels(ci==i),OLabel)==1);
    nOutliers(i) = size(O_s,1);
    str = [str sprintf('Component %d:\tsize = %d, outliers = %d\n', i, sizes(i), nOutliers(i))];   
end

G = connect_components_mix(Z, G, similarity, sigma);

[Y, variances, PC] = PCADR(Z,2);
% drawGraph([filename ' - Actual outliers'], G, Y, true, O');

fid_out = fopen(outfile,'w');
fprintf(fid_out, '%s', str);
fclose(fid_out);

'aaa'


%------------------------------------------------------------------
function checkRealDataset(filename, hasHeader, preprocess, hasGraph, outfile, graph_type, similarity, sigma, k1, k2, kRP, N, OLabel)
% clustering real dataset with labels in first column
% filename: file to be clustered
% hasHeader: if there is a header in the 1st row
% hasGraph:  if the graph is created or not
% preprocessed: pre-process (scale, zscore, etc.), data or not
% outfile:  result output

scale = 1;              % sparsity of the random matrix
% kRP = 200;              % columns of random projection matrix

% graph_type = 2; % knn graph type
% similarity = 'euclidean'; % knn similarity metric
% sigma = 0; % bandwidth of RBF function

% OLabel = {'1'};

disp 'Reading data file ...';
if hasHeader == true
    row = 1;
else
    row = 0;
end
col = 1; % class column
X = dlmread(filename, ',', row, col);

n = size(X,1)
d = size(X,2)

disp 'Getting labels ...';
fid = fopen(filename);
labels = textscan(fid, '%s %*[^\n]','delimiter', ','); % read 1st column
labels = labels{1};
if hasHeader == true
    labels(1) = [];
end
fclose(fid);

% [Class, I, J] = unique(labels); % labels = class(J)
% k = length(Class) % number of clusters
% labels = J; % convert to nummerical values
% 
% % data analysis
% cluster_sizes = zeros(k,1);
% for j=1:k
%     cluster_sizes(j) = size(find(labels==j),1);
% end

% normalization
if preprocess == true
    Z = zscore(X);
    % Z = minmaxScale(X);
else
    Z = X; 
end
clear X;

if hasGraph == true
    load(['Output/' filename(10:size(filename,2)-4) '_graph.mat']);    
else
    if sigma == 0 && strcmp(similarity, 'RBF') % self tune
        sigma = kernel_bandwidth(Z, k1);
    end

    tgraph = tic;
    disp 'Creating knn graph ...'
    G = knn_components_sparse(Z, k1, graph_type, similarity, sigma);
    G = connect_components_mix(Z, G, similarity, sigma);
    % G = connect_components_MST(Z, G, similarity, sigma)
    t0 = toc(tgraph)
    % save(['Output/' filename(10:size(filename,2)-4) '_graph.mat'], ...
    %    'G', 'k1', 'graph_type', 'similarity', 'sigma', 't0');        
end

disp 'Calculating distance based ED ...';
tEDOF = tic;
[O1,OF1] = TopN_Outlier_Pruning_Block(Z, k2, N, N);
t1 = toc(tEDOF)

disp 'Calculating LOF ...';
tLOF = tic;
[O2,OF2] = LOF_Outlier(Z, k2, N);
t2 = toc(tLOF)

% disp 'Calculating distance based CTD ...';
% tCDOF = tic;
% [O3, OF3] = TopN_Outlier_Pruning_Block_CTD(G, 0.1, 50, k2, N, N);
% t3 = toc(tCDOF)

% result = ismember(labels(O3(1:N)), OLabel);
% TP = size(find(result == 1),1);
% sprintf('CDOF Precision = %0.2g%%', TP*100/N)

disp 'Calculating distance based CTD-ST ...';
tCDOFa = tic;
[O3a, OF3a] = TopN_Outlier_Pruning_Block_CTD_ST(G, kRP, scale, k2, N, N);
% N3a = max(size(find(OF3a>mean(OF3a)+3*std(OF3a)),2),1)
t3a = toc(tCDOFa)

str = sprintf('n = %d, d = %d, nOutliers = %d, preprocess = %d, graph type = %d, k1 = %d, similarity = %s, sigma = %f, k2 = %d, kRP = %d, N = %d\n\n', ...
            n, d, size(find(ismember(labels, OLabel)==1),1), preprocess, graph_type, k1, similarity, sigma, k2, kRP, N);

% EDOF result
result = ismember(labels(O1(1:N)), OLabel);
TP = size(find(result == 1),1);
str = [str sprintf('Using labels as benchmark:\n')];
str = [str sprintf('EDOF: Precision = %0.2g%%, time = %0.2f\n', TP*100/N, t1)];

% LOF result
result = ismember(labels(O2(1:N)), OLabel);
TP = size(find(result == 1),1);
str = [str sprintf('LOF: Precision = %0.2g%%, time = %0.2f\n', TP*100/N, t2)];

% CDOF result
result = ismember(labels(O3a(1:N)), OLabel);
TP = size(find(result == 1),1);
str = [str sprintf('aCDOF: Precision = %0.2g%%, time = %0.2f\n\n', TP*100/N, t0+t3a)];

% Using union(EDOF,LOF) as benchmark
str = [str sprintf('Using union of EDOF & LOF as benchmark:\n')];
O = union(O1,O2);
%[O3a, OF3a] = TopN_Outlier_Pruning_Block_CTD_ST(G, kRP, scale, k2, size(O,2), size(O,2));
TP = size(intersect(O,O3a),2);
str = [str sprintf('U(EDOF,LOF) = %d, I(EDOF,LOF) = %d, I(EDOF,CDOF) = %d, I(LOF,CDOF) = %d\n', ...
            size(O,2), size(intersect(O1,O2),2), size(intersect(O1,O3a),2), size(intersect(O2,O3a),2))];
str = [str sprintf('CDOF: Precision = %0.2g%%\n\n', TP*100/N)];

str 

%[Y, variances, PC] = PCADR(Z,2);
% drawGraph([filename ' - Detected outliers'], G, Y, true, O3a);

% O = find(ismember(labels, OLabel)==1);
% str = [str sprintf('Data file: %s (n = %d, d = %d)\n', filename, n, d)];
% str = [str sprintf('Actual outliers (N = %d): %s\n', size(O,1), num2str(O'))];
% str = [str sprintf('Predicted outliers (N = %d): %s\n', N, num2str(O3a))];
% str = [str sprintf('All points: average node degree = %0.2f, average weight degree = %0.2f\n', nnz(G)/n, full(sum(sum(G)))/n)];
% str = [str sprintf('Actual outliers: average node degree = %0.2f, average weight degree = %0.2f\n', nnz(G(O,:))/size(O,1), full(sum(sum(G(O,:))))/size(O,1))];
% str = [str sprintf('Predicted outliers: average node degree = %0.2f, average weight degree = %0.2f\n', nnz(G(O3a,:))/N, full(sum(sum(G(O3a,:))))/N)];
% str = [str sprintf('Preprocess = %d, graph type = %d, k1 = %d, similarity = %s, sigma = %f, k2 = %d, kRP = %d\n\n', preprocess, graph_type, k1, similarity, sigma, k2, kRP)];
% 
% for i=1:N  
%     str = [str sprintf('Outlier %d:\tactual (index = %d,\tdegree = %d,\tweight sum = %0.2f)\t\tpredicted (index = %d,\tdegree = %d,\tweight sum = %0.2f)\n', i, O(i), nnz(G(O(i),:)), sum(full(G(O(i),:))), O3a(i), nnz(G(O3a(i),:)), sum(full(G(O3a(i),:))))];   
% end

fid_out = fopen(outfile,'w');
fprintf(fid_out, '%s', str);
fclose(fid_out);

% save([outfile(1:size(outfile,2)-4) '.mat']);

'aaa'


%------------------------------------------------------------------
function result = expPerformance(DatasetSize, d, nOutliers, nTrials, k1, similarity, k2, kRP, N, outfile)
% compare computation b/w EDOF, LOF and CDOF
% DatasetSize: size of each dataset
% nTrials: number of trials for each dataset size

graph_type = 2; % knn graph type
%similarity = 'RBF'; % knn similarity metric
sigma = 0;

scale = 1;      % sparsity of the random matrix

nSizes = size(DatasetSize,2);
result = zeros(nSizes, 4);

for i=1:nSizes
    n = DatasetSize(i);
    sprintf('Dataset %d (size = %d)',i,n)
    
    t1 = zeros(nTrials,1);
    t2 = t1;
    t3a = t1;
    t0 = t1;
    % do nTrials times 
    for j=1:nTrials               
        X = datagen(n, d, nOutliers);
        
        % randomization the data
        index = randperm(n);
        X = X(index,:);

        % EDOF and LOF is unchanged over many runs
        tEDOF = tic;
        disp 'Calculating distance based ED ...';
        [O1,OF1] = TopN_Outlier_Pruning_Block(X, k2, N, N);
        t1(j) = toc(tEDOF)

        tLOF = tic;
        disp 'Calculating LOF ...';        
        [O2,OF2] = LOF_Outlier(X, k2, N);
        t2(j) = toc(tLOF)

        if sigma == 0 && strcmp(similarity, 'RBF') % self tune
            sigma = kernel_bandwidth(X, k1);
        end

        disp 'Building knn graph ...';
        tGraph = tic;
        G = knn_components_sparse(X, k1, graph_type, similarity, sigma);
        G = connect_components_mix(X, G, similarity, sigma);
        t0(j) = toc(tGraph)

        taCDOF = tic;
        disp 'Calculating distance based CTD-ST ...';
        [O3a,OF3a] = TopN_Outlier_Pruning_Block_CTD_ST(G, kRP, scale, k2, N, N);
        t3a(j) = toc(taCDOF);
        t3a(j) = t0(j) + t3a(j)
    end
    
    result(i,1) = n;
    result(i,2) = mean(t1);
    result(i,3) = mean(t2);
    result(i,4) = mean(t3a);
    
    csvwrite(outfile, result); 
end

h = figure('Name','Performance', 'NumberTitle','off');
plot(result(:,1),result(:,2),'-or', result(:,1), result(:,3),'-dg', ...
        result(:,1),result(:,4),'-^b');
legend('Location','NorthWest','EDOF','LOF','aCDOF');    
xlabel('Data sizes');
ylabel('Time (s)');       
saveas(h,[outfile(1:size(outfile,2)-4) '.eps'],'psc2');


%------------------------------------------------------------------
function result = expEffectiveness(DatasetSize, d, nOutliers, nTrials, k1, similarity, k2, kRP, N, outfile)
% compare computation and accuracy b/w LOF and CTD
% DatasetSize: size of each dataset
% nTimes: number of times testing with each dataset

graph_type = 2; % knn graph type
%similarity = 'RBF'; % knn similarity metric
sigma = 0;

scale = 1;      % sparsity of the random matrix

nSizes = size(DatasetSize,2);
result = zeros(nSizes, 4);

for i=1:nSizes  % for each dataset    
    n = DatasetSize(i);
    sprintf('Dataset %d (size = %d)',i,n)

    t3 = zeros(nTrials,1);
    t3a = t3;
    t0 = t3;
    p = t3;
    % do nTimes times 
    for j=1:nTrials       
        X = datagen(n, d, nOutliers);

        % randomization the data
        index = randperm(n);
        X = X(index,:);

        if sigma == 0 && strcmp(similarity, 'RBF') % self tune
            sigma = kernel_bandwidth(X, k1);
        end
        disp 'Building knn graph ...';
        tGraph = tic;
        G = knn_components_sparse(X, k1, graph_type, similarity, sigma);
        G = connect_components_mix(X, G, similarity, sigma);
        t0(j) = toc(tGraph)

        disp 'Calculating distance based CTD ...';
        tCDOF = tic;
        [O3, OF3] = TopN_Outlier_Pruning_Block_CTD(G, 1, 50, k2, N, N);
        t3(j) = toc(tCDOF);
        t3(j) = t0(j) + t3(j)
        
        disp 'Calculating distance based CTD-ST ...';
        tCDOFa = tic;
        [O3a, OF3a] = TopN_Outlier_Pruning_Block_CTD_ST(G, kRP, scale, k2, N, N);
        t3a(j) = toc(tCDOFa);
        t3a(j) = t0(j) + t3a(j)
        
        % OF3r(O3) = OF3;
        % OF4r(O4) = OF4;
        % p1(j) = corr(OF3r',OF4r','type','Spearman');
        I = intersect(O3',O3a');
        p(j) = size(I,1)/N;
    end
    
    result(i,1) = n;
    result(i,2) = mean(t3);
    result(i,3) = mean(t3a);    
    result(i,4) = mean(p)*100;
    
    csvwrite(outfile, result); 
end

h = figure('Name','Effectiveness', 'NumberTitle','off');
% bar graph
bar(result(:,1),result(:,4));
xlabel('Data Sizes');
ylabel('Outlier Percentage (%)');

% To overlay the concentration data on the bar graph, position a second 
% axes at the same location as the first axes, 
% but first save the handle of the first axes:
h1 = gca;

% Create the second axes at the same location before plotting the second data set:
h2 = axes('Position',get(h1,'Position'));
plot(result(:,1),result(:,2),'-r',result(:,1),result(:,3),'--g','LineWidth',3)

% To ensure that the second axes does not interfere with the first, 
% locate the y-axis on the right side of the axes, make the background transparent, 
% and set the second axes' x tick marks to the empty matrix:
set(h2,'YAxisLocation','right','Color','none','XTickLabel',[])

% Align the x-axis of both axes and display the grid lines on top of the bars:
set(h2,'XLim',get(h1,'XLim'),'Layer','top')

% Annotating the Graph.  
text(mean(result(:,1)),mean(result(:,2)),'CDOF','Rotation',35,'FontSize',16,'Color','Red');
text(mean(result(:,1)),mean(result(:,3))+30,'aCDOF','Rotation',5,'FontSize',16,'Color','Green');
ylabel('Time (s)');

saveas(h,[outfile(1:size(outfile,2)-4) '.eps'],'psc2');


%------------------------------------------------------------------
function result = checkk2(X, kmin, kmax, step, k1, similarity, kRP, N)
% determine k1 and k2 and accuracy
scale = 1;      % sparsity of the random matrix

graph_type = 2; % knn graph type
%similarity = 'RBF'; % knn similarity metric
sigma = 0;

result = zeros((kmax-kmin)/step+1, 4);
n = size(X,1);
  
if sigma == 0 && strcmp(similarity, 'RBF') % self tune
    sigma = kernel_bandwidth(X, k1);
end
tic
[G, tree] = knn_components_sparse(X, k1, graph_type, similarity, sigma);
G = connect_components_mix(X, G, similarity, sigma);
toc

for i=kmin:step:kmax
    i 
    k2 = i;
    
    [O1,OF1] = TopN_Outlier_Pruning_Block(X, k2, N, N);
    [O2,OF2] = LOF_Outlier(X, k2, N);        
    [O3,OF3] = TopN_Outlier_Pruning_Block_CTD_ST(G, kRP, scale, k2, N, N);
    
    p1 = size(find(O1 > n-N),2)*100/N;
    p2 = size(find(O2 > n-N),2)*100/N;
    p3 = size(find(O3 > n-N),2)*100/N;
    
    result((i-kmin)/step+1,1) = i;
    result((i-kmin)/step+1,2) = p1;
    result((i-kmin)/step+1,3) = p2;
    result((i-kmin)/step+1,4) = p3;
end

h = figure('Name','knn', 'NumberTitle','off');
set(gca,'XTick',kmin:step:kmax)
plot(result(:,1),result(:,2),'-or', result(:,1),result(:,3),'-dg', ...
        result(:,1),result(:,4),'-^b');
legend('Location','SouthEast','EDOF','LOF','CDOF');    
xlabel('k2');       
ylabel('Precision');
saveas(h,'Output/test_k_accuracy.eps','psc2');

'aaa'


%------------------------------------------------------------------
function checkkRP(filename, kRPs, k1, similarity, k2, N)
% check parameters kRP of random projection in CD-ST
% check accuracy 
%
% filename  : file to be checked
% kRPs      : columns in random projection

graph_type = 2; % knn graph type
%similarity = 'RBF'; % knn similarity metric
sigma = 0;

disp 'Reading data file ...';
X = csvread(filename);

n = size(X,1);

% normalization
% Z = zscore(X);
Z = X;
clear X;

if sigma == 0 && strcmp(similarity, 'RBF') % self tune
    sigma = kernel_bandwidth(Z, k1);
end
tGraph = tic;
G = knn_components_sparse(Z, k1, graph_type, similarity, sigma);
G = connect_components_mix(Z, G, similarity, sigma);
t0 = toc(tGraph);

nkRPs = size(kRPs,2);
accuracy = zeros(nkRPs, 1); % for clustering accuracy of CD-ST
time = zeros(nkRPs, 1);  % for computational time of CD-ST

for l=1:nkRPs
    kRP = kRPs(l);
    scale = 1;

    tCDST = tic;
    [O, OF] = TopN_Outlier_Pruning_Block_CTD_ST(G, kRP, scale, k2, N, N);
    t = toc(tCDST);
    accuracy(l) = size(find(O > n-N),2)*100/N;
    time(l) = t0 + t;
end       

h = figure('Name',['Test kRP - ' filename], 'NumberTitle','off');
plot(kRPs, accuracy, '-or');
xlabel('kRP');       
ylabel('Precision');
saveas(h,['Output/' filename(10:size(filename,2)-4) '_' similarity '_kRP_accuracy.eps'],'psc2');

h = figure('Name',['Test kRP - ' filename], 'NumberTitle','off');
h = plot(kRPs, time,'-or');
xlabel('kRP');       
ylabel('Time');
saveas(h,['Output/' filename(10:size(filename,2)-4) '_' similarity '_kRP_time.eps'],'psc2');

% save(['Output/' filename(10:size(filename,2)-4) '_kRP.mat']);

'aaa'


%------------------------------------------------------------------
function [G, tree] = creatGraph(infile, k, graph_type, similarity, outfile)
% create graph from data file 'infile' and save graph to 'outfile'

X = csvread(infile); 

sprintf('Creating a graph G from file %s ...', infile)
tic
[G, tree] = knn_components(X, k, graph_type, similarity);
G = connect_components_mix(X, G);
sprintf('Writing the graph to file %s ...', outfile)
save(outfile, 'G', 'tree');
toc
    

%------------------------------------------------------------------
function duplicates = findDuplications(X)
% compute the euclidean distances
n = size(X,1); % observation
duplicates = [];
for i=1:n
    for j=i+1:n
        if X(i,:)==X(j,:)
            ['Observation ' int2str(j) ' is the same as ' int2str(i)]
            duplicates = [duplicates j];
        end
    end
end


%------------------------------------------------------------------
function Y = minmaxScale(X)
n = size(X,1);
d = size(X,2);
Y = zeros(n,d);
for i=1:d
    min_val = min(X(:,i));
    max_val = max(X(:,i));
    if (max_val == min_val)
        Y(:,i) = X(:,i);
    else
        Y(:,i) = (X(:,i)-min_val)/(max_val - min_val);
    end
end


%------------------------------------------------------------------
function [Gnew, inng, innw] = GraphAdd(X, tree, G, p, k)
% update the graph when a new point comes in
% X, tree, G: dataset and corresponding knn graph and kd-tree
% p: new point

% the nearest point is at the end
inn = kdtree_k_nearest_neighbors(tree, p, k);  

isolate =  true; % check if new point does not connect to any point
inng = []; % store neighbors of p on graph
innw = []; % % store weights of edges connecting p to its neighbors on graph

Gnew = G;
n = size(G,1);
Gnew = [Gnew sparse(n,1)];
Gnew = [Gnew; sparse(1,n+1)];
n = n+1;
for j=1:k % for each of the nearest neighbors q of p    
    q = X(inn(j),:); 
    % store neighbors of j on graph    
    qnn = kdtree_k_nearest_neighbors(tree, q, k+1); 
    qnn(k+1) = [];        
    dmax = dist(q, X(qnn(1),:)); % = 1/G(qnn(1),inn(j)) : the farest neighbor of qnn
    d = dist(p,q);
    if (d<dmax && d>0) || (j==k && isolate==true)
    % p belongs to knn of q, qnn(1) does not belong to knn of q
    % p and q are mutual nearest neighbors while q and qnn(1) are not
    % mutual nearest neighbors anymore
    % in case p is not mutual knn of any, connect p to the nearest point
    % G(i,inn(j)) = G(inn(j),i) = w;
    % G(qnn(1),inn(j)) = G(inn(j),qnn(1)) = 0; Not consider this atm so
    % that the graph is assured to be connected
    % w(i,inn(j)) increase 1/d, w(qnn(1),inn(j)) decreases 1/dmax
        isolate = false;
        dw1 = 1/d;
        Gnew(n,inn(j)) = dw1;
        Gnew(inn(j),n) = dw1;

        %dw2 = -1/dmax; % be careful, graph can be disconnected
        %total_weight = total_weight + 2*dw2;

        inng = [inng inn(j)]; % neighbors of i on graph
        innw = [innw dw1]; % weights of e_ij
    end
end    
    

%------------------------------------------------------------------
function [Gnew, inng, innw] = GraphAdd_no_tree(X, G, p, k)
% update the graph when a new point comes in
% X, G: dataset and corresponding knn graph 
% p: new point

[inn, dnn_p] = k_nearest_neighbors(X, p, k); % 

isolate =  true; % check if new point does not connect to any point
inng = []; % store neighbors of p on graph
innw = []; % % store weights of edges connecting p to its neighbors on graph

Gnew = G;
n = size(G,1);
Gnew = [Gnew sparse(n,1)];
Gnew = [Gnew; sparse(1,n+1)];
n = n+1;
for j=1:k % for each of the nearest neighbors q of p    
    q = X(inn(j),:); 
    % store neighbors of j on graph    
    [qnn, dnn_q] = k_nearest_neighbors(X, q, k+1); % including q
    dmax = max(dnn_q); % the farest neighbor of qnn
    d = dnn_p(j); % dist(p,q);
    if d<dmax 
    % p belongs to knn of q, qnn(1) does not belong to knn of q
    % p and q are mutual nearest neighbors while q and qnn(1) are not
    % mutual nearest neighbors anymore
    % in case p is not mutual knn of any, connect p to the nearest point
    % G(i,inn(j)) = G(inn(j),i) = w;
    % G(qnn(1),inn(j)) = G(inn(j),qnn(1)) = 0; Not consider this atm so
    % that the graph is assured to be connected
    % w(i,inn(j)) increase 1/d, w(qnn(1),inn(j)) decreases 1/dmax
        isolate = false;
        dw1 = 1/d;
        Gnew(n,inn(j)) = dw1;
        Gnew(inn(j),n) = dw1;

        %dw2 = -1/dmax; % be careful, graph can be disconnected
        %total_weight = total_weight + 2*dw2;

        inng = [inng inn(j)]; % neighbors of i on graph
        innw = [innw dw1]; % weights of e_ij
    elseif j==k && isolate==true
        [mind, mini] = min(dnn_p);
        dw1 = 1/mind;
        Gnew(n,inn(mini)) = dw1;
        Gnew(inn(mini),n) = dw1;

        %dw2 = -1/dmax; % be careful, graph can be disconnected
        %total_weight = total_weight + 2*dw2;

        inng = [inng inn(mini)]; % neighbors of i on graph
        innw = [innw dw1]; % weights of e_ij
    end
end   


function [inn, dnn] = k_nearest_neighbors(X, p, k)
% find in dataset X the knn of point p 

n = size(X,1);
inn = zeros(k,1);
dnn = zeros(k,1);
l = 1;    
for i=1:n
    d = dist(p, X(i,:));
    if l<=k
        dnn(l) = d;
        inn(l) = i;
        l = l+1;
    else % l>k
        % find the farthest point            
        [maxd,maxi] = max(dnn);

        % replace the farthest point
        if d<maxd 
            dnn(maxi) = d;
            inn(maxi) = i;
        end
    end       
end
        

%------------------------------------------------------------------
function [sigma, bandwidth] = kernel_bandwidth(X, k)
% find the bandwith of each data point
% help to determine the kernel bandwidth

% X: dataset
% k: knn

n = size(X,1); % No. of observations
   
bandwidth = zeros(n,1); % bandwidth for each data point

% build a kd tree
tree = kdtree_build(X);

for i=1:n   
    % knn
    q = X(i,:);    
    % the nearest point (the same point) is at the end, just ignore it 
    inn = kdtree_k_nearest_neighbors(tree, q, k+1);    % in euclidean
    
    bandwidth(i) = dist(X(i,:),X(inn(1),:)); % distance to k-th nearest neighbor
end

sigma = max(bandwidth);
kdtree_delete(tree);


%------------------------------------------------------------------
function A = knn(X, k, graph_type, outlying_cluster_size, similarity)
% find a k-nn graph of the dataset X
% graph_type = 1: knn
% graph_type = 2: mutual knn
% graph_type = 3: fully connected graph
% similarity = how to compute weights of the edge, only apply for full graph
% outlying_cluster_size: threshold b/w sizes of normal and outlying clusters 

% A: graph adjacency matrix

A = knn_components_sparse(X, k, graph_type, similarity);

%A = connect_components(X, A, outlying_cluster_size);
%A = connect_components_MST(X, A);
A = connect_components_mix(X, A);


%------------------------------------------------------------------
function [A, tree] = knn_components(X, k, graph_type, similarity)
% find a k-nn graph of the dataset X, can be disconnected
% graph_type = 1: knn
% graph_type = 2: mutual knn
% graph_type = 3: fully connected graph
% similarity = how to compute weights of the edge, only apply for full graph

% A: graph adjacency matrix

n = size(X,1); % No. of observations

if nargin<4
    similarity = 'euclidean';
end
    
% fully connected graph
if graph_type == 3
    A = zeros(n,n); % dense graph
    for i=1:n
        for j=i+1:n
            w = sim(X(i,:),X(j,:),similarity);
            if w > 0
                A(i,j) = w;
                A(j,i) = w;
            end
        end
    end
        
    return
end

% nearest neighbor graph
A = sparse(n,n); % sparse graph
dnn = zeros(1,k);

% use kd-tree if similarity = euclidean
% otherwise use nested loop
if strcmp(similarity,'euclidean') == 1
    % build a kd tree
    tree = kdtree_build(X);
else
    inn = zeros(1,k);
end

for i=1:n
    if strcmp(similarity,'euclidean') == 0 % not euclidean
        % find the knn
        l = 1;    
        for j=1:n
            if j~=i
                d = 1/sim(X(i,:),X(j,:),similarity);
                if l<=k
                    dnn(l) = d;
                    inn(l) = j;
                    l = l+1;
                else % l>k
                    % find the farthest point            
                    [maxd,maxi] = max(dnn);

                    % replace the farthest point
                    if d<maxd 
                        dnn(maxi) = d;
                        inn(maxi) = j;
                    end
                end
            end
        end
    else
        % knn
        q = X(i,:);    
        % the nearest point (the same point) is at the end, just ignore it 
        inn = kdtree_k_nearest_neighbors(tree, q, k+1);    % euclidean?  
        for j=1:k
            dnn(j) = dist(X(i,:),X(inn(j),:));
        end
    end
    
    for l=1:k
        if dnn(l)~=0
            w = 1/dnn(l); % inverse of distance
        else
            w = 0;
        end        
        A(i, inn(l)) = w;
       
        if graph_type == 1 % knn graph
            A(inn(l), i) = w;
        end
    end
end

% if strcmp(similarity,'euclidean') == 1
%     % cleanup
%     kdtree_delete(tree);
% end

if graph_type == 2 % mutual knn graph
    for i=1:n
        for j=1:n
            if A(i,j) ~= A(j,i)
                A(i,j) = 0;
                A(j,i) = 0;
            end
        end
    end
end


%------------------------------------------------------------------
function [A, tree] = knn_components_sparse(X, k, graph_type, similarity, sigma)
% optimize the sparse matrix
% find a k-nn graph of the dataset X, can be disconnected
% graph_type = 1: knn
% graph_type = 2: mutual knn
% graph_type = 3: fully connected graph
% similarity = how to compute weights of the edge
% A: graph adjacency matrix

if nargin<5
    sigma = [];
end

n = size(X,1); % No. of observations
   
% fully connected graph
if graph_type == 3
    A = zeros(n,n); % dense graph
    for i=1:n
        for j=i+1:n
            w = sim(X(i,:), X(j,:), similarity, sigma);
            if w > 0
                A(i,j) = w;
                A(j,i) = w;
            end
        end
    end
    
    A = sparse(A); % sparse graph
    return
end

% nearest neighbor graph
nodes1 = zeros(2*n*k,1); % nk = maximum number of nnz for knn graph
nodes2 = nodes1;
nodeweights = nodes1;
ne = 0;

% build a kd tree
tree = kdtree_build(X);

for i=1:n   
    % knn
    q = X(i,:);    
    % the nearest point (the same point) is at the end, just ignore it 
    inn = kdtree_k_nearest_neighbors(tree, q, k+1);    % in euclidean
    
    for l=1:k
        w = sim(X(i,:), X(inn(l),:), similarity, sigma);
        
        if w < 1e-6 % not suitable sigma
            sprintf('sigma is too small');
            w = 1e-6;
        end
        
        ne = ne + 1;
        nodes1(ne) = i;
        nodes2(ne) = inn(l);
        nodeweights(ne) = w;
        
        if graph_type == 1
            ne = ne + 1;        
            nodes1(ne) = inn(l);
            nodes2(ne) = i;
            nodeweights(ne) = w;                    
        end
    end
end

if graph_type == 2 % mutual knn graph
    nodes1(ne+1:2*n*k) = [];
    nodes2(ne+1:2*n*k) = [];
    nodeweights(ne+1:2*n*k) = [];

    for i=1:ne
        neighbors = nodes1==nodes2(i);
        flag = find(nodes2(neighbors)==nodes1(i),1);
        if isempty(flag) % not found
            nodeweights(i) = 0;  
        end
    end
end

% remove duplicate information in nodes1 and nodes2 to avoid adding in
% nodeweights by sparse function
[nodes,index] = unique([nodes1 nodes2],'rows','first');
nodeweights = nodeweights(index);

A = sparse(nodes(:,1), nodes(:,2), nodeweights, n, n);


%------------------------------------------------------------------
function Anew = connect_components_MST(X, A, similarity, sigma)
% connect disconnected graph components from using inverse MST
% this MST tends to connect nodes which near to each other
% so that there will be more overlapping between MST and A

Anew = A;

E = euclidean(X);
T = mst(sparse(E));
% T = affinity(X, similarity, sigma);

[i,j] = find(T);
for l=1:nnz(T)
    if i(l)<j(l) && A(i(l),j(l))==0
        s = sim_d(T(i(l),j(l)), similarity, sigma);
        if s < 1e-6 % not suitable sigma
            sprintf('sigma is too small');
            s = 1e-6;
        end
        Anew(i(l),j(l)) = s;
        Anew(j(l),i(l)) = s;
    end
end


%------------------------------------------------------------------
function Anew = connect_components(X, A, outlying_cluster_size)
% connect disconnected graph components from A
% outlying_cluster_size: threshold b/w sizes of normal and outlying clusters 

% connecting normal cluster together
% connecting outlying clusters to nearest normal clusters

n = size(X,1);

% connected components
[ci, sizes] = components(A);
Anew = A;

if size(sizes,1)==1 % connected
    return;
end

% sort components in A in descending order 
[sizes, indexS] = sort(sizes, 'descend');
nClusters = size(sizes,1);

sprintf('There are %d disconnected components', nClusters)

indexC = [];
for i=1:nClusters
    index = find(ci' == indexS(i));
    indexC = [indexC index];
end

% outlying clusters
index = 0;
nOutlyingClusters = 0;
for i=1:nClusters
    if sizes(i) > outlying_cluster_size
        index = index + sizes(i); % starting index for outlying clusters
        
        % connect normal clusters together
        if i<nClusters && sizes(i+1) > outlying_cluster_size
            index1 = indexC(index - sizes(i) + randi(sizes(i),1));
            index2 = indexC(index + randi(sizes(i+1),1));
            
            d = dist(X(index1,:),X(index2,:));         
            Anew(index1,index2) = 1/d;
            Anew(index2,index1) = Anew(index1,index2);       
        end
        
    else
        nOutlyingClusters = nOutlyingClusters+1;
    end  
end


% connects outlying clusters to nearest normal clusters
if nOutlyingClusters > 0
    distances = zeros(1,nOutlyingClusters);
    start_point = zeros(1,nOutlyingClusters);
    end_point = zeros(1,nOutlyingClusters);

    k = 0; % outlying cluster index
    po = 0; % past outlying cluster
    for i=index+1:n
        co = ci(indexC(i)); % current outlying cluster 
        if co~=po
            k = k+1;
        end

        % nearest distance from outlying clusters to normal clusters
        for j=1:index
           d = dist(X(indexC(i),:),X(indexC(j),:));
           if d < distances(k) || distances(k) == 0
               distances(k) = d;
               start_point(k) = indexC(i);  % point in outlying cluster
               end_point(k) = indexC(j);    % point in normal cluster
           end
        end

        po = co;
    end

    % connect outlying clusters to nearest points of the normal cluster
    for k=1:nOutlyingClusters
        d = dist(X(start_point(k),:),X(end_point(k),:));
        Anew(start_point(k),end_point(k)) = 1/d;
        Anew(end_point(k),start_point(k)) = Anew(start_point(k),end_point(k));    
    end
end


%------------------------------------------------------------------
function Anew = connect_components_mix(X, A, similarity, sigma)
% connect disconnected graph components from A by using MST
% for all representative points from each components

% connected components
[ci, sizes] = components(A);

Anew = A;
nClusters = size(sizes,1);
sprintf('There are %d disconnected components', nClusters)
if nClusters > 1 % disconnected
    indexT = zeros(nClusters,1); % store the representative point from all components
        
    for i=1:nClusters
        index = find(ci' == i,1); % any point from the cluster
        indexT(i) = index;
    end

    tree = connect_components_MST(X(indexT,:), A(indexT,indexT), similarity, sigma);

    Anew(indexT,indexT) = tree;
end


%------------------------------------------------------------------
function [A, sampled_vertices_all] = knn_sampling(X, k, graph_type, outlying_cluster_size, pSampling, similarity)
% find a k-nn graph of the dataset X
% graph_type = 1: knn
% graph_type = 2: mutual knn
% graph_type = 3: fully connected graph
% similarity = how to compute weights of the edge, only apply for full graph
% outlying_cluster_size: threshold b/w sizes of normal and outlying clusters 
% pSampling: percentage of samples

% A: sampled similarity matrix 

A = knn_components(X, k, graph_type, similarity);

%[A, sampled_vertices_all] = RW_sampling(A, outlying_cluster_size);
[A, sampled_vertices_all] = vertex_sampling(A, pSampling, outlying_cluster_size);
A = knn_components(X(sampled_vertices_all,:), k, graph_type, similarity);

A = connect_components_mix(X(sampled_vertices_all,:), A);

% if pSampling == 1
%     A = connect_components_MST(X(sampled_vertices_all,:), A);   
% else
%     A = connect_components(X(sampled_vertices_all,:), A, outlying_cluster_size);
% end

%------------------------------------------------------------------
function [Anew, sampled_vertices_all] = RW_sampling(A, outlying_cluster_size)
% sample graph A using a random walk with restart
% A: similarity matrix 
% outlying_cluster_size: threshold b/w sizes of normal and outlying
% clusters 
% Anew: sampled similarity matrix
% sampled_vertices_all: sampled vertices

% sample only big components

% connected components
[ci, sizes] = components(A);

% sampling each big component
nClusters = size(sizes,1);
sampled_vertices_all = [];
for i=1:nClusters
    cluster_index = find(ci' == i);
    cluster_size = size(cluster_index,2);
    sampled_vertices = [];
    %nSamples = round(0.5*cluster_size); 
    
    if cluster_size > outlying_cluster_size % sampling
        nWalks = round(cluster_size/100); % No. of random walk
        nSteps = 1000; % No. of steps a RW takes
        restart_rate = 0.15; % avoid situation the RW getting stuck
        for i1=1:nWalks
            % randomly pick a vertice in the cluster for a random walk
            j = cluster_index(randi(cluster_size));
            %jstart = j;
            if size(find(sampled_vertices ==j),2)==0
                sampled_vertices = [sampled_vertices j];
            end
            
            l = 1;
            while l<nSteps
                if rand()<=restart_rate % restart the RW with any point traveled so far
                    j = sampled_vertices(randi(size(sampled_vertices,2)));
                    %j = jstart ;
                end

                nbs = find(A(j,:));
                [weights,index] = sort(A(j,nbs),'descend');
                s = sum(A(j,nbs));
                r = rand()*s;
                j1 = 1;
                r1 = weights(j1);
                while r>r1
                    j1 = j1+1;
                    r1 = r1 + weights(j1);
                end

                j = nbs(index(j1));
                if size(find(sampled_vertices ==j),2)==0 % expensive
                    sampled_vertices = [sampled_vertices j];
                end

                l = l+1;
            end       
        end
        
        sampled_vertices_all = [sampled_vertices_all sampled_vertices];
    else
        sampled_vertices_all = [sampled_vertices_all cluster_index];
    end   
end

Anew = A(sampled_vertices_all,sampled_vertices_all);

%------------------------------------------------------------------
function [Anew, sampled_vertices_all] = vertex_sampling(A, pSampling, outlying_cluster_size)
% sample graph A using a random walk with restart
% A: similarity matrix 
% pSampling: percentage of samples
% outlying_cluster_size: threshold b/w sizes of normal and outlying clusters 
% Anew: sampled similarity matrix
% sampled_vertices_all: sampled vertices

% sample only big components

% connected components
[ci, sizes] = components(A);

% sampling each big component
nClusters = size(sizes,1);
sampled_vertices_all = [];
for i=1:nClusters
    cluster_index = find(ci' == i);
    cluster_size = size(cluster_index,2);
    
    if cluster_size > outlying_cluster_size % sampling
        index = randperm(cluster_size);
        nSamples = round(pSampling*cluster_size);
        sampled_vertices = cluster_index(index(1:nSamples));

%         l = 1;
%         while l<=nSamples
%             j = cluster_index(randi(cluster_size));
%             if size(find(sampled_vertices ==j),2)==0 % expensive
%                 sampled_vertices = [sampled_vertices j];
%                 l = l+1;
%             end
%         end
          
        sampled_vertices_all = [sampled_vertices_all sampled_vertices];
    else
        sampled_vertices_all = [sampled_vertices_all cluster_index];
    end   
end

Anew = A(sampled_vertices_all,sampled_vertices_all);


%------------------------------------------------------------------
function si = sim(x, y, s, sigma)
% compute the similarity b/w two observations x and y
% sigma: bandwidth for RBF function
% s: similarity type

if strcmp(s,'cosine') == 1
    si = cosine(x,y);    
elseif strcmp(s,'RBF') == 1
    si = RBF(x,y,sigma);   
else
    d = dist(x,y);
    if d~=0
        si = 1/d;
    else
        si = 0;
    end
end


%------------------------------------------------------------------
function si = sim_d(d, s, sigma)
% compute the similarity b/w two observations with euclidean distance d
% s: similarity type
% only use for euclidean and RBF

if strcmp(s,'RBF') == 1
    si = exp(-d^2/(2*sigma*sigma));
else
    if d~=0
        si = 1/d;
    else
        si = 0;
    end
end


%------------------------------------------------------------------
function d = dist(x, y)
% compute the euclidean distance b/w two observations
d = norm(x - y);


%------------------------------------------------------------------
function c = cosine(x, y)
% compute the cosine between two vectors
c = dot(x,y)/(norm(x)*norm(y));


%------------------------------------------------------------------
function s = RBF(x, y, sigma)
% compute the RBF function
d = dist(x, y);
s = exp(-d^2/(2*sigma*sigma));


%------------------------------------------------------------------
function d = commute_dist(lii, ljj, S, Vi, Vj, total_weight)
% compute the commute distance b/w two observations i and j
lij = 0;
m = size(S,1);
for l=2:m
    lij = lij+S(l,l)*Vi(l)*Vj(l);
end
d = total_weight*(lii+ljj-2*lij);


%------------------------------------------------------------------
function d = commute_dist_1(i, j, t, total_weight)
% compute the commute distance b/w two observations i and j
n = size(t, 2);
ei = zeros(n,1);
ej = ei;

ei(i,1) = 1;
ej(j,1) = 1;
xi = t*ei;
xj = t*ej;
d = total_weight*(xi-xj)'*(xi-xj);


%------------------------------------------------------------------
function E = euclidean(X)
% compute the euclidean distances
n = size(X,1); % observation

E = zeros(n,n);
for i=1:n
    for j=i+1:n
        E(i,j) = dist(X(i,:),X(j,:));
        E(j,i) = E(i,j);
    end
end


%------------------------------------------------------------------
function A = affinity(X, similarity, sigma)
% compute the affinity matrix
E = euclidean(X);

% A = exp(-(E.*E) ./ (2*sigma*sigma));
n = size(X,1);
A = zeros(n,n);
for i=1:n
    for j=i+1:n
        A(i,j) = sim_d(E(i,j),similarity,sigma);
        A(j,i) = A(i,j);
    end
end


%------------------------------------------------------------------
function [V, S, total_weight, L, D] = computeCTD(A, pEigens, maxEigens, normalized)
% compute matrix of eigenvectors and eigenvalues
% A: graph adjacency matrix
% pEigens: percentage of eigen vectors for approximation
% maxEigens: maximum No. of eigen vectors for approximation
% normalized: normalize Laplacian or not
% V: matrix of eigenvectors
% S: diagonal matrix of engenvalues
% total_weight: graph volume

n = size(A,1); % observations
k = round(pEigens*n); % No. of eigen vectors
if k > maxEigens && k<n
    k = maxEigens;
end
sprintf('No. of eigenvectors used = %d', min(k, round(pEigens*n)))

% D: graph diagonal matrix 
% total_weight: graph volume
% D = sparse(n,n);
% total_weight = 0;
% for i=1:n
%     D(i,i) = sum(A(i,:));
%     total_weight = total_weight + D(i,i);                
% end

D = sparse(1:n,1:n,sum(A,1),n,n);
total_weight = sum(diag(D));

if normalized == true
    d = sqrt(1./diag(D));
    Dn = spdiags(d, 0, n, n);
    L = Dn*(D-A)*Dn; % L = D^(-1/2)(D-A)D^(-1/2)
else
    L = D-A;
end

[V,S] = small_eig(L, k);


%------------------------------------------------------------------
function [V,D] = small_eig(A,k)
% find k smallest singular values and their eigen vectors
n = size(A,1);
if k==n
    [V,D] = eig(full(A));
else
    opts.disp = 0; % no information output
    opts.issym = 1; % A is symmetric
    opts.isreal = 1;
    opts.tol = 1e-6;

    [V,D] = eigs(A,k,opts.tol,opts); % k smallest in descending order

    m = size(D,1);
    d = diag(D);
    D = sparse(1:m,1:m,d(m:-1:1),m,m);
    V = V(:,m:-1:1);
end

% %------------------------------------------------------------------
% function [V,D] = small_eig(A,k)
% % find k smallest singular values and their eigen vectors
% opts.disp = 0; % no information output
% opts.issym = 1; % A is symmetric
% opts.isreal = 1;
% opts.tol = 1e-6;
% 
% [V,D] = eigs(A,k,'sa',opts);


%------------------------------------------------------------------
function Ai = chol_pinv(A)
% pseudo inverse of A using Cholesky factorization
n = size(A,1);
I = speye(n);
e = ones(n,1);

R = chol(A(1:n-1,1:n-1),'lower');
%R = cholinc(A(1:n-1,1:n-1),'0');
%R = R';
Ai = sparse(n,n);
for i=1:n
    ei = I(:,i);
    yi=(I-e*e'/n)*ei;
    
    li2 = R'\(R\yi(1:n-1,:));
    li1= [li2; 0];
    
    li = (I-e*e'/n)*li1;
    Ai(:,i) = li;
end


%------------------------------------------------------------------
function [V,S] = rep_eig(X, np, k)
% find np-1 eigen vectors from np representative points of X
n = size(X,1); 

[IDX,Xp] = kmeans(X, np, ...
            'start', 'cluster', ...
            'emptyaction', 'singleton');

nC = zeros(1, np); % the number of points for each cluster
for i=1:n
    nC(IDX(i)) = nC(IDX(i))+1;
end

% plot cluster
%hold on;
%plot(Xp(:,1), Xp(:,2), '+g');
%hold off;

% euclidean distances 
ED = euclidean(Xp);

% Building knn graph
graph_type = 2;
kn=10;
% link weights of G is the inverse of Laplacian matrix
A = knn(ED, kn, graph_type, true);

% D: graph diagonal matrix 
D = sparse(np,np);
for i=1:np
    for j=1:np
        D(i,i) = D(i,i)+ A(i,j);        
    end
end

L = D-A;

% Computing the smallest eigen vectors of the Laplacian matrix 
% remove eigen value 0 and its eigen vector
k = np;

%[Vp,Sp] = eig(full(L));
[Vp,Sp] = eigs(A,k,'sa');
Vp(:,1) = [];
Sp(:,1)= [];
Sp(1,:)= [];

% u = [v1, ..., v1, v2, ..., v2, vk, ..., vk]'
V = zeros(n,k-1);
S = Sp;
for i=1:k-1
    start = 0;
    for j=1:np
        for l=1:nC(j)
            V(start+l,i) = Vp(j,i);            
        end
        start = start+nC(j);
    end
end


%------------------------------------------------------------------
function O = DB_Outlier(X, k, D)
% find DB(k,D) outliers, given data matrix X

n = size(X,1);

O = [];
for i=1:n
    l = 0;    
    for j=1:n
        if j~=i
            d = dist(X(i,:),X(j,:));
            if d<=D 
                l = l+1;
            end
        end
    end
    
    if l<k 
        O = [O i];
    end
end


%------------------------------------------------------------------
function [O, LOF] = LOF_Outlier(X, k, N)
% find density based outliers, given a data matrix X

n = size(X,1);

inn = sparse(n,n); 
k_array = zeros(1,n);
lrd = k_array;
LOF = lrd;
for i=1:n
    % find N-k-distance(i)   
    Ei = zeros(1,n);
    for j=1:n
        Ei(j) = dist(X(i,:),X(j,:));                
    end
    [Ei, index] = sort(Ei);
    Ei(1) = []; % Ei(1) = 0 
    
    ki = k;
    while ki<n && Ei(ki)==Ei(ki+1)
        ki= ki + 1;
    end
    k_array(i) = ki;
    Ei = Ei(1:ki); 
    inn(i,1:ki) = index(2:ki+1);
    
    reach_i = zeros(1,n);
    for j=1:n
        if i~=j    
            d = dist(X(i,:),X(j,:));
            reach_i(j) = max([Ei(ki) d]);                    
        end
    end
    
    for m=1:ki
        lrd(i) = lrd(i) + reach_i(inn(i,m));
    end     
    lrd(i) = 1/(lrd(i)/ki);
end

for i=1:n
    for m=1:k_array(i)
        LOF(i) = LOF(i) + lrd(inn(i,m));
    end
    LOF(i) = LOF(i)/(lrd(i)*k_array(i));
end

[LOF,O] = sort(LOF, 'descend');
O = O(1:N);
LOF = LOF(1:N);


%------------------------------------------------------------------
function [O, LOF] = LOF_Outlier_CTD(T, total_weight, k, N)
% find density based outliers, given a distance matrix E

n = size(t,2);

inn = zeros(n,n);
k_array = zeros(1,n);
reach = zeros(n,n);
lrd = k_array;
LOF = lrd;
for i=1:n
    % find N-k-distance(i)   
    [Ei, index] = sort(E(i,:));    
    ki = k;
    while ki<n && Ei(ki)==Ei(ki+1)
        ki= ki + 1;
    end
    k_array(i) = ki;
    Ei = Ei(2:ki+1); % remove Ei(1)
    inn(i,1:ki) = index(2:ki+1);
    
    for j=1:n
        if i~=j             
            reach(i,j) = max([Ei(ki) E(i,j)]);                    
        end
    end
    
    for m=1:ki
        lrd(i) = lrd(i) + reach(i,inn(i,m));
    end     
    lrd(i) = 1/(lrd(i)/ki);
end

sumLOF = 0;
for i=1:n
    for m=1:k_array(i)
        LOF(i) = LOF(i) + lrd(inn(i,m));
    end
    LOF(i) = LOF(i)/(lrd(i)*k_array(i));
    
    sumLOF = sumLOF + LOF(i);
    %['LOF[', int2str(i), '] = ', num2str(LOF(i))]
    
end
%bar(LOF*100/sumLOF);
%bar(LOF);
title('LOF');
xlabel('Observations');
ylabel('LOF');

[LOF,O] = sort(LOF, 'descend');
O = O(1:N);
LOF = LOF(1:N);


%------------------------------------------------------------------
function [O,OF] = TopN_Outlier(ED, k, N)
% find top N outliers  by comparing average distances to knn
n = size(ED,1);
DBOF = zeros(1,n);
dnn = zeros(1,k);
count = 0;
for i=1:n
    % find knn
    l = 1;    
    for j=1:n
        count = count + 1;
        if j~=i
            %d = dist(X(i,:),X(j,:));
            d = ED(i,j);
            if l<=k
                dnn(l) = d;
                l = l+1;
            else % l>k
                % find the farthest point            
                [maxd,maxi] = max(dnn);

                % replace the farthest point
                if d<maxd 
                    dnn(maxi) = d;
                end
                count = count+k;
            end
        end
    end
    
    DBOF(i) = mean(dnn, 2);
end
count
%bar(DBOF);
[OF,O] = sort(DBOF, 'descend');
O = O(1:N);
OF = OF(1:N);


%------------------------------------------------------------------
function [O,OF] = TopN_Outlier_CTD(V, S, total_weight, k, N)
% find top N outliers  by comparing average distances to knn
n = size(V,1);
DBOF = zeros(1,n);
dnn = zeros(1,k);
count = 0;

% store diagonal L+(i,i) to avoid many repeatations
Lii = zeros(1,n);
m = size(S,1);
for i=1:n
    for j=1:m
        Lii(i) = Lii(i) + S(j,j)*V(i,j)*V(i,j);
    end
end

for i=1:n
    % find knn
    l = 1;    
    for j=1:n
        count = count + 1;
        if j~=i
            d = commute_dist(Lii(i), Lii(j), S, V(i,:), V(j,:), total_weight);  
            if l<=k
                dnn(l) = d;
                l = l+1;
            else % l>k
                % find the farthest point            
                [maxd,maxi] = max(dnn);

                % replace the farthest point
                if d<maxd 
                    dnn(maxi) = d;
                end
                count = count+k;
            end
        end
    end
    
    DBOF(i) = mean(dnn, 2);
end
%count
%bar(DBOF);
[OF,O] = sort(DBOF, 'descend');
O = O(1:N);
OF = OF(1:N);


%------------------------------------------------------------------
function [O, OF, Y, Y_time, knn_time, total_time] = TopN_Outlier_Pruning_Block_CTD(G, pEigens, maxEigens, k, N, block_size)
% find top N outliers  by comparing average distances to knn with pruning technique
% G: similarity graph
% pEigens, maxEigens: number of eigenvectors used
% k, N, block_size: for EDOF
t = tic;

tY = tic;
disp 'Forming matrix Y ...'
[V, S, total_weight] = computeCTD(G, pEigens, maxEigens, 0);

Si = S;
for i=2:size(S)
    if S(i,i) > 0
        % k largest singular values
        Si(i,i) = 1/S(i,i);
    end
end

Y = sqrt(full(total_weight)).*(V*sqrt(Si));
Y_time = toc(tY);

tknn = tic;
[O,OF] = TopN_Outlier_Pruning_Block(Y, k, N, block_size);
knn_time = toc(tknn);

total_time = toc(t)


%------------------------------------------------------------------
function [O, OF, Y, Z_time, knn_time, total_time] = TopN_Outlier_Pruning_Block_CTD_ST(G, kRP, scale, k, N, block_size)
% find top N outliers  by comparing average distances to knn with pruning technique
% G: similarity graph
% kRP, scale: for random projection
% k, N, block_size: for EDOF

t = tic;

tZ = tic;
disp 'Building matrix Z using Spielman-Tang solver ...'
Z = approx_resistance(G, kRP, 1e-6, 100, scale);
total_weight = sum(sum(G));
Y = sqrt(full(total_weight)).*Z';
Z_time = toc(tZ);

tknn = tic;
disp 'Detecting outliers in the commute time embedding ...'
[O,OF] = TopN_Outlier_Pruning_Block_ORIGINAL(Y, k, N, block_size);
knn_time = toc(tknn);

total_time = toc(t)

% find top N outliers  by comparing average 
% distances to knn with pruning technique
function [O,OF] = TopN_Outlier_Pruning_Block_ORIGINAL(X,k,N,block_size)
	n = size(X,1);
	OF = zeros(1,N);
	O = OF;

	c = 0;
	count = 0;
	while (n-count>0)
		B = zeros(1,block_size);
		B = (count+1 : count+block_size);
		count = count + block_size;        
		
		if count<=n
			sizeB = block_size;
		else
			sizeB = n - (count-block_size);
		end
		neighbours = zeros(sizeB,k);
		neighbours_dist = zeros(sizeB,k);
		score = zeros(1,sizeB);

		l = 1;
		for i=1 : n
			for j=1 : sizeB
				if i~=B(j) && B(j)~=0
					d = dist(X(i,:),X(B(j),:))^2;
		            
					if l>1 && l<=k+1 && neighbours(j,l-1)==0
						l = l-1;
					elseif l<k && neighbours(j,l)~=0
						l = l+1;
					end
		            
					if l<=k 
						neighbours(j,l) = i;   
						neighbours_dist(j,l) = d;
						if l==k
							score(j) = mean(neighbours_dist(j,:),2);
						end
					else % l>k
						% find the farthest point
						[maxd,maxi] = max(neighbours_dist(j,:));
						% replace the farthest point
						if d<maxd 
							neighbours(j,maxi) = i;
							neighbours_dist(j,maxi) = d;
							% update the score
							score(j) = (score(j)*k - maxd + d)/k;
							if score(j)<=0
								% avoid round off error
								score(j) = max(mean(neighbours_dist(j,:),2),0);
							end
						end                    
					end
		            
					if l>=k && score(j)<c
						B(j) = 0;                    
						score(j) = 0;                   
					end                                            
				end
			end
			l = l+1;
		end
		
		% O = Top(B U O,N)
		BO = [B(1:sizeB) O];
		BOF = [score OF];
		[BOF,index] = sort(BOF, 'descend');
		BO = BO(index);
		
		O = BO(1:N);
		OF = BOF(1:N);    
		% c = weakest outlier
		c = OF(N);
	end

%------------------------------------------------------------------
function drawGraph(name, A, X, label, label_list)
% plot a graph based on adjacent matrix A and data X

figure('Name',name, 'NumberTitle','off');

hold on;
axis equal;

n = size(A,1);
m = nnz(A);

h = plot(X(:,1), X(:,2), '.r');

[i,j] = find(A);
d = 0;
for l=1:m
    if j(l)<i(l) % symmatrix, lower triangle only
        node1 = [X(j(l),1) X(i(l),1)]';
        node2 = [X(j(l),2) X(i(l),2)]';
        h = plot(node1, node2);
        d = d + 1/A(i(l),j(l));
    end
end
d = d/(m/2);

['Graph invariances: Vertices = ' int2str(n) ', Edges = ' int2str(m/2) ', Average degree = ' num2str(m/n) ', Average distance = ' num2str(d)]

if label == true
    if nargin<4
        label_list = 1:size(A,1);
    end
    for k=1:size(label_list,2)
        h = plot(X(label_list(k),1), X(label_list(k),2), 'xg','MarkerSize', 10, 'LineWidth', 3);        
        % h = text(X(label_list(k),1), X(label_list(k),2), int2str(label_list(k)));        
    end
end
hold off;

%------------------------------------------------------------------
function S = Sim(X)
% compute the similarity matrix
n = size(X,1); % observation
d = size(X,2); % dimension

S = zeros(n,n);
for i=1:n
    for j=i+1:n
        a = X(i,:)'; 
        b = X(j,:)';
        
        if norm(a)~=0 && norm(b)~=0
            S(i,j) = dot(a,b)/(norm(a)*norm(b));
        end
        if S(i,j)<0
            S(i,j)=0;
        end
        S(j,i) = S(i,j);
    end
end


%------------------------------------------------------------------
function [O,OF] = OutRankA(S, error, T, N)
% S: similarity matrix
% e: error tolerance
% T: max iteration
% N: top N outliers

n = size(S,1);

for i=1:n
    totalS = 0;
    for j=1:n
        totalS = totalS + S(i,j);
    end
    
    if totalS > 0
        for j=1:n
            S(i,j) = S(i,j)/totalS;
        end
    end
end

d=0.1; % damping factor
t = 0; % step
e = ones(n,1);
cp = (1/n)*e;
while true 
    c = d/n + (1-d)*S'*cp;
    delta = norm(c-cp,1);
    cp = c;
    if delta<error || t>T
        break;
    end
    t = t+1;
end
[OF,O] = sort(c');
OF = OF(1:N);
O = O(1:N);


%------------------------------------------------------------------
function [O,OF,Snew] = OutRankB(S, error, T, N)
% S: similarity matrix
% e: error tolerance
% T: max iteration
% N: top N outliers
n = size(S,1);
M = [];
for i=1:n
    for j=i+1:n
        if S(i,j)>0
            M = [M S(i,j)];
        end
    end
end
m = mean(M);
s = std(M);
threshold = (m-s+m)/2;
clear M;

M = S;
for i=1:n
    for j=i+1:n
        if M(i,j)<threshold
            M(i,j)= 0;
            M(j,i)= M(i,j);
        end        
    end
end

Snew = zeros(n,n);
for i=1:n
    X = find(M(i,:)>0);
    for j=i+1:n
        Y = find(M(j,:));
        Snew(i,j) = size(intersect(X,Y),2);
        Snew(j,i) = Snew(i,j);
    end    
end

[O,OF] = OutRankA(Snew, error, T, N);