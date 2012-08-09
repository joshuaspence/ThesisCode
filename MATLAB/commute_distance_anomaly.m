% Commute distances from knn graph derived from data.
%
% USAGE
%   commute_distance_anomaly dataset [func_name]
%
% ARGUMENTS
%   dataset         The path to the input data set.
%   func_name       The name of the "TopN_Outlier_Pruning_Block" function to 
%                   use. Defaults to 'TopN_Outlier_Pruning_Block'.
%
function commute_distance_anomaly (dataset, varargin)

% only want 1 optional inputs at most
numvarargs = length(varargin);
if numvarargs > 1
    error('commute_distance_anomaly:TooManyInputs', 'requires at most 1 optional inputs');
end

% Set defaults for optional inputs
optargs = {'TopN_Outlier_Pruning_Block'};

% Now put these defaults into the valuesToUse cell array, 
% and overwrite the ones specified in varargin.
optargs(1 : numvarargs) = varargin;

% Place optional args in memorable variable names
global func_name;
[func_name] = optargs{:};

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

% Rerandomize state
randomness_file = 'random.mat';
if exists(randomness_file, '') == true
    disp 'Rerandomizing...'
    randnState = randn('state');
    randState = rand('state');
    save(randomness_file, 'randnState', 'randState');
else
    lastState = load(randomness_file, 'randnState', 'randState');
    rand('state', lastState.randState);
    randn('state', lastState.randnState);
end

disp 'Reading data file ...';
tRead = tic;
X = csvread(dataset);
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
%save(strcat(base_dir, filesep, 'graph.txt'), 'G', '-ASCII');

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
function [O,OF] = TopN_Outlier_Pruning_Block(X, k, N, block_size)
% find top N outliers  by comparing average distances to knn with pruning
% technique
n = size(X,1);
OF = zeros(1,N);
O = OF;

c = 0;
count = 0;
while (n-count>0)
    B = zeros(1,block_size);
    B =(count+1:count+block_size);
    count = count + block_size;        
    
    if count<=n
        sizeB = block_size;
    else
        sizeB = n - (count - block_size);
    end
    neighbours = zeros(sizeB,k);
    neighbours_dist = zeros(sizeB,k);
    score = zeros(1,sizeB);

    l = 1;
    for i=1:n
        for j=1:sizeB
            if i~=B(j) && B(j)~=0 % pruning B(j)<>0
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
                        neighbours_dist(j,maxi)=d;
                        % update the score
                        score(j) = (score(j)*k - maxd + d)/k;
                        if score(j)<=0
                            % avoid round off error
                            score(j) = max(mean(neighbours_dist(j,:),2),0);
                        end
                    end                    
                end
                
                if l>=k && score(j)<c % prune B(j)
                    B(j)=0;                    
                    %neighbours(j,:) = 0;
                    %neighbours_dist(j,:)=0;
                    score(j)=0;                   
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
%bar(OF);

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
[O,OF] = TopN_Outlier_Pruning_Block(Y, k, N, block_size);
knn_time = toc(tknn);

total_time = toc(t)

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