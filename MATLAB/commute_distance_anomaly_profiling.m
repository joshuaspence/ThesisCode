% Commute distances from knn graph derived from data.
%
% USAGE
%   commute_distance_anomaly_profiling dataset randomness func_name base_dir block_sizes
%
% ARGUMENTS
%   dataset         The path to the input data set.
%   randomness      The path to the randomness file.
%   func_name       The name of the "TopN_Outlier_Pruning_Block" function to 
%                   use.
%   base_dir        The base directory for output files.
%   block_size      The block_size to use for outlier pruning. If set to less 
%                   than or equal to 0, then the default is used.
%
function commute_distance_anomaly_profiling(dataset, randomness, func_name, base_dir, block_size)

% This function accepts a wide range of parameters and is used by my 
% testing and profiling scripts.

global g_func_name;
global g_base_dir;
g_func_name = func_name;
g_base_dir = base_dir;

tic;
k1 = 10;        % number of k nearest neighbours of graph
k2 = 15;        % number of k nearest neighbours for outlier detection
N = 40;         % top N outliers

pSampling = 01; % pecentage of samples

kRP = 200;      % columns of random projection matrix
scale = 1;      % sparsity of the random matrix

graph_type = 2; % knn graph type, mutual knn
similarity = 'euclidean'; % knn similarity metric
sigma = 0;

% Rerandomize state
if strcmp(randomness, '') == true || exist(randomness, 'file') ~= 2
    disp 'Rerandomizing...'
    randnState = randn('state');
    randState = rand('state');
    save(strcat(g_base_dir, filesep, 'random.mat'), 'randnState', 'randState');
else
    lastState = load(randomness, 'randnState', 'randState');
    rand('state', lastState.randState);
    randn('state', lastState.randnState);
end

if block_size <= 0
    block_size = N;
end

disp 'Reading data file ...';
tRead = tic;
X = csvread(dataset);
toc(tRead);

% Data set size
n = size(X, 1);
d = size(X, 2);
fprintf('Data set dimensions = %u*%u\n', n, d);

disp 'Data preprocessing ...';
tPre = tic;
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

if sigma == 0 && strcmp(similarity, 'RBF') % self tune
    sigma = kernel_bandwidth(Z, k1);
end

disp 'Building knn graph ...';
tGraph = tic;
if pSampling == 1
    G = knn_components_sparse(Z, k1, graph_type, similarity, sigma);
    G = connect_components_mix(Z, G, similarity, sigma);
    sampled_vertices = 1 : n;
else
    [G, sampled_vertices] = knn_sampling(Z, k1, graph_type, k2, pSampling, similarity);
end
fprintf('No. of sampled vertices = %d\n', size(sampled_vertices));
t0 = toc(tGraph);
graph_output = strcat(g_base_dir, filesep, 'graph.mat');
fprintf('Writing the graph to file %s\n', graph_output);
save(graph_output, 'G');
%save(strcat(g_base_dir, filesep, 'graph.txt'), 'G', '-ASCII');

disp 'Calculating distance based CTD-ST ...';
tCDOFa = tic;
[O3a, OF3a] = TopN_Outlier_Pruning_Block_CTD_ST(G, kRP, scale, k2, N, block_size);
t3a = toc(tCDOFa);

label = O3a(1:N);
graph = drawGraph('PCA plot', G, Y(sampled_vertices,:), true, label);

O = sampled_vertices(O3a);
OF = OF3a;

csv_output = strcat(g_base_dir, filesep, 'output.csv');
fprintf('Writing the result to file %s\n', csv_output);
csvwrite(csv_output, [O' OF']);

'Done'

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

for i = 1 : n   
    % knn
    q = X(i,:);    
    % the nearest point (the same point) is at the end, just ignore it 
    inn = kdtree_k_nearest_neighbors(tree, q, k+1);    % in euclidean
    
    bandwidth(i) = dist(X(i,:), X(inn(1),:)); % distance to k-th nearest neighbor
end

sigma = max(bandwidth);
kdtree_delete(tree);

%------------------------------------------------------------------
function [A, tree] = knn_components(X, k, graph_type, similarity)
% find a k-nn graph of the dataset X, can be disconnected
% graph_type = 1: knn
% graph_type = 2: mutual knn
% graph_type = 3: fully connected graph
% similarity = how to compute weights of the edge, only apply for full graph

% A: graph adjacency matrix

n = size(X,1); % No. of observations

if nargin < 4
    similarity = 'euclidean';
end
    
% fully connected graph
if graph_type == 3
    A = zeros(n,n); % dense graph
    for i = 1 : n
        for j = i + 1 : n
            w = sim(X(i,:), X(j,:), similarity);
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

for i = 1 : n
    if strcmp(similarity,'euclidean') == 0 % not euclidean
        % find the knn
        l = 1;    
        for j = 1 : n
            if j ~= i
                d = 1/sim(X(i,:), X(j,:), similarity);
                if l <= k
                    dnn(l) = d;
                    inn(l) = j;
                    l = l+1;
                else % l>k
                    % find the farthest point            
                    [maxd, maxi] = max(dnn);

                    % replace the farthest point
                    if d < maxd 
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
        for j = 1 : k
            dnn(j) = dist(X(i,:), X(inn(j),:));
        end
    end
    
    for l = 1 : k
        if dnn(l) ~= 0
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

if graph_type == 2 % mutual knn graph
    for i = 1 : n
        for j = 1 : n
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

if nargin < 5
    sigma = [];
end

n = size(X,1); % No. of observations
   
% fully connected graph
if graph_type == 3
    A = zeros(n,n); % dense graph
    for i = 1 : n
        for j = i + 1 : n
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
nodes1 = zeros(2*n*k, 1); % nk = maximum number of nnz for knn graph
nodes2 = nodes1;
nodeweights = nodes1;
ne = 0;

% build a kd tree
tree = kdtree_build(X);

for i = 1 : n   
    % knn
    q = X(i,:);    
    % the nearest point (the same point) is at the end, just ignore it 
    inn = kdtree_k_nearest_neighbors(tree, q, k+1);    % in euclidean
    
    for l=1:k
        w = sim(X(i,:), X(inn(l),:), similarity, sigma);
        
        if w < 1e-6 % not suitable sigma
            fprintf('sigma is too small\n');
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

    for i = 1 : ne
        neighbors = nodes1 == nodes2(i);
        flag = find(nodes2(neighbors) == nodes1(i), 1);
        if isempty(flag) % not found
            nodeweights(i) = 0;
        end
    end
end

% remove duplicate information in nodes1 and nodes2 to avoid adding in
% nodeweights by sparse function
[nodes, index] = unique([nodes1 nodes2], 'rows', 'first');
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

[i,j] = find(T);
for l = 1 : nnz(T)
    if i(l) < j(l) && A(i(l), j(l)) == 0
        s = sim_d(T(i(l),j(l)), similarity, sigma);
        if s < 1e-6 % not suitable sigma
            fprintf('sigma is too small\n');
            s = 1e-6;
        end
        Anew(i(l), j(l)) = s;
        Anew(j(l), i(l)) = s;
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
fprintf('There are %d disconnected components\n', nClusters)
if nClusters > 1 % disconnected
    indexT = zeros(nClusters, 1); % store the representative point from all components
        
    for i = 1 : nClusters
        index = find(ci' == i, 1); % any point from the cluster
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

[~, sampled_vertices_all] = vertex_sampling(A, pSampling, outlying_cluster_size);
A = knn_components(X(sampled_vertices_all,:), k, graph_type, similarity);

A = connect_components_mix(X(sampled_vertices_all,:), A);

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
nClusters = size(sizes, 1);
sampled_vertices_all = [];
for i = 1 : nClusters
    cluster_index = find(ci' == i);
    cluster_size = size(cluster_index,2);
    
    if cluster_size > outlying_cluster_size % sampling
        index = randperm(cluster_size);
        nSamples = round(pSampling*cluster_size);
        sampled_vertices = cluster_index(index(1:nSamples));
          
        sampled_vertices_all = [sampled_vertices_all sampled_vertices];
    else
        sampled_vertices_all = [sampled_vertices_all cluster_index];
    end   
end

Anew = A(sampled_vertices_all, sampled_vertices_all);

%------------------------------------------------------------------
function si = sim(x, y, s, sigma)
% compute the similarity b/w two observations x and y
% sigma: bandwidth for RBF function
% s: similarity type

if strcmp(s,'cosine') == 1
    si = cosine(x, y);    
elseif strcmp(s,'RBF') == 1
    si = RBF(x, y, sigma);   
else
    d = dist(x, y);
    if d ~= 0
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
    if d ~= 0
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
function E = euclidean(X)
% compute the euclidean distances
n = size(X,1); % observation

E = zeros(n,n);
for i = 1 : n
    for j = i+1 : n
        E(i,j) = dist(X(i,:), X(j,:));
        E(j,i) = E(i,j);
    end
end

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
Y = sqrt(full(total_weight)) .* Z';
Z_time = toc(tZ);

fprintf('Projected data set dimensions = %u*%u\n', size(Y,1), size(Y,2));

tknn = tic;
disp 'Detecting outliers in the commute time embedding ...'
global g_func_name;
func_handle = str2func(char(g_func_name));
[O,OF] = func_handle(Y, k, N, block_size);
OF_sum = sum(OF);

% save variables
global g_base_dir;
save(strcat(g_base_dir, filesep, 'TopN_Outlier_Pruning_Block.mat'), 'Y', 'k', 'N', 'block_size', 'O', 'OF', 'OF_sum');
%save(strcat(g_base_dir, filesep, 'TopN_Outlier_Pruning_Block.txt'), 'Y', 'k', 'N', 'block_size', 'O', 'OF', 'OF_sum', '-ASCII');

knn_time = toc(tknn);

total_time = toc(t)

%------------------------------------------------------------------
function graph = drawGraph(name, A, X, label, label_list)
% plot a graph based on adjacent matrix A and data X

graph = figure('Name', name, 'NumberTitle', 'off');

hold on;
axis equal;

n = size(A,1);
m = nnz(A);

h = plot(X(:,1), X(:,2), '.r');

[i,j] = find(A);
d = 0;
for l = 1 : m
    if j(l) < i(l) % symmatrix, lower triangle only
        node1 = [X(j(l),1) X(i(l),1)]';
        node2 = [X(j(l),2) X(i(l),2)]';
        h = plot(node1, node2);
        d = d + 1/A(i(l),j(l));
    end
end
d = d/(m/2);

['Graph invariances: Vertices = ' int2str(n) ', Edges = ' int2str(m/2) ', Average degree = ' num2str(m/n) ', Average distance = ' num2str(d)]

if label == true
    if nargin < 4
        label_list = 1 : size(A,1);
    end
    for k = 1 : size(label_list,2)
        h = plot(X(label_list(k),1), X(label_list(k),2), 'xg','MarkerSize', 10, 'LineWidth', 3);        
        % h = text(X(label_list(k),1), X(label_list(k),2), int2str(label_list(k)));        
    end
end
hold off;
