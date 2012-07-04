% commute distances from knn graph derived from data
function commute_distance_anomaly(dataset, varargin)

% only want 4 optional inputs at most
numvarargs = length(varargin);
if numvarargs > 4
    error('commute_distance_anomaly:TooManyInputs', 'requires at most 4 optional inputs');
end

% Set defaults for optional inputs
optargs = {'' 'TopN_Outlier_Pruning_Block', '.', false};

% Now put these defaults into the valuesToUse cell array, 
% and overwrite the ones specified in varargin.
optargs(1 : numvarargs) = varargin;

% Place optional args in memorable variable names
global func_name;
global base_dir;
[randomness, func_name, base_dir, close_graph] = optargs{:};

tic
k1 = 10;        % number of k nearest neighbours of graph
k2 = 15;        % number of k nearest neighbours for outlier detection
N = 40;         % top N outliers

pEigens = 0.1;  % pecentage of smallest eigenvectors for approximation
maxEigens = 50; % maximum No of smallest eigenvectors for approximation
pSampling = 01; % pecentage of samples

kRP = 200;      % columns of random projection matrix
scale = 1;      % sparsity of the random matrix

graph_type = 2; % knn graph type, mutual knn
similarity = 'euclidean'; % knn similarity metric
sigma = 0;

% Extrapolate filename of data set for input
filename = char(strcat('Datasets/', dataset));

% Rerandomize state
if strcmp(randomness, '') == true
    disp 'Rerandomizing...'
    randnState = randn('state');
    randState = rand('state');
    save(strcat(base_dir, filesep, 'random.mat'), 'randnState', 'randState');
else
    lastState = load(randomness, 'randnState', 'randState');
    rand('state', lastState.randState);
    randn('state', lastState.randnState);
end

disp 'Reading data file ...';
tRead = tic;
X = csvread(filename);
toc(tRead);

n = size(X, 1)
d = size(X, 2)

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

%result = checkk2(Z, 5, 100, 5, k1, 'euclidean', kRP, 40);

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
sprintf('No. of sampled vertices = %d', size(sampled_vertices))
t0 = toc(tGraph)
disp 'Writing the graph to file graph.mat';
save(strcat(base_dir, filesep, 'graph.mat'), 'G');
save(strcat(base_dir, filesep, 'graph.txt'), 'G', '-ASCII');

% disp 'Calculating distance based CTD ...';
% tCDOF = tic;
% [O3, OF3, Y_CD, Y_time, knn_time_CD] = TopN_Outlier_Pruning_Block_CTD(G, pEigens, maxEigens, k2, N, N);
% t3 = toc(tCDOF)

disp 'Calculating distance based CTD-ST ...';
tCDOFa = tic;
[O3a, OF3a] = TopN_Outlier_Pruning_Block_CTD_ST(G, kRP, scale, k2, N, N);
t3a = toc(tCDOFa)

label = O3a(1:N);
graph = drawGraph('PCA plot', G, Y(sampled_vertices,:), true, label);
print(graph, strcat(base_dir, filesep, 'output.png'), '-dpng');
if close_graph
	close(graph);
end

O = sampled_vertices(O3a);
OF = OF3a;

disp 'Writing the result to file output.csv';
csvwrite(strcat(base_dir, filesep, 'output.csv'),[O' OF']);

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
    for i=1:n
        for j=i+1:n
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

% if strcmp(similarity,'euclidean') == 1
%     % cleanup
%     kdtree_delete(tree);
% end

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
% T = affinity(X, similarity, sigma);

[i,j] = find(T);
for l = 1 : nnz(T)
    if i(l) < j(l) && A(i(l), j(l)) == 0
        s = sim_d(T(i(l),j(l)), similarity, sigma);
        if s < 1e-6 % not suitable sigma
            sprintf('sigma is too small');
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
sprintf('There are %d disconnected components', nClusters)
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

%[A, sampled_vertices_all] = RW_sampling(A, outlying_cluster_size);
[A, sampled_vertices_all] = vertex_sampling(A, pSampling, outlying_cluster_size);
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

%         l = 1;
%         while l <= nSamples
%             j = cluster_index(randi(cluster_size));
%             if size(find(sampled_vertices ==j),2) == 0 % expensive
%                 sampled_vertices = [sampled_vertices j];
%                 l = l+1;
%             end
%         end
          
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

tknn = tic;
disp 'Detecting outliers in the commute time embedding ...'
global func_name;
func_handle = str2func(char(func_name));
[O,OF] = func_handle(Y, k, N, block_size);

% save variables
global base_dir;
save(strcat(base_dir, filesep, 'TopN_Outlier_Pruning_Block.mat'), 'Y', 'k', 'N', 'block_size', 'O', 'OF');
save(strcat(base_dir, filesep, 'TopN_Outlier_Pruning_Block.txt'), 'Y', 'k', 'N', 'block_size', 'O', 'OF', '-ASCII');

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

% find top N outliers  by comparing average 
% distances to knn with pruning technique
function [O,OF] = TopN_Outlier_Pruning_Block_ORIGINAL(X, k, N, block_size)
	n = size(X,1);
	OF = zeros(1,N);
	O = OF;

	c = 0;
	count = 0;
	while (n-count > 0)
		B = zeros(1, block_size);
		B = (count+1 : count+block_size);
		count = count + block_size;        
		
		if count <= n
			sizeB = block_size;
		else
			sizeB = n - (count-block_size);
		end
		neighbours = zeros(sizeB, k);
		neighbours_dist = zeros(sizeB, k);
		score = zeros(1, sizeB);

		l = 1;
		for i = 1 : n
			for j = 1 : sizeB
				if i ~= B(j) && B(j) ~= 0
					d = dist(X(i,:), X(B(j),:))^2;
					fprintf('dist=%f\n', d);
		            
					if l > 1 && l <= k+1 && neighbours(j,l-1) == 0
						l = l-1;
					elseif l < k && neighbours(j,l) ~= 0
						l = l+1;
					end
		            
					if l <= k
						neighbours(j,l) = i;   
						neighbours_dist(j,l) = d;
						if l == k
							score(j) = mean(neighbours_dist(j,:), 2);
						end
					else % l>k
						% find the farthest point
						[maxd, maxi] = max(neighbours_dist(j,:));
						% replace the farthest point
						if d < maxd 
							fprintf('d<maxd\n');
							neighbours(j, maxi) = i;
							neighbours_dist(j, maxi) = d;
							% update the score
							score(j) = (score(j)*k - maxd + d)/k;
							if score(j) <= 0
								% avoid round off error
								score(j) = max(mean(neighbours_dist(j,:),2), 0);
							end
						end            
					end
		            
					if l >= k && score(j) < c
						B(j) = 0;                    
						score(j) = 0;                
					end
					fprintf('i=%d, j=%d, B(j)=%d, found=%d, score=%f\n', i, j, B(j), l, score(j));
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
