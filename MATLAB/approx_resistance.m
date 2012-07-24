function [Z, solver_time] = approx_resistance(A, k, tolerance, maxIter, scale)
% From the n x n adjacency matrix A, create the k x n matrix (k=O(logn))
% Z from which we can calculate the approximate effective resistances 
% between any two nodes in the graph.
% Creation of Z requires solving k linear equations which solve by 
% a linear solver.

% tol       : tolerance of the method
% maxIter   : maximum number of iterations
% scale     : decide the sparsity of the random matrix or the scale of the speed up 
%             the lager the scale, the sparser the random matrix

n = size(A,1);
[x,y,w] = find(A); % nonzero entries of A
idx = (x < y); % to avoid counting each edge twice
m = nnz(idx);
l = 1:m;
i = [l'; l'];
j = [x(idx); y(idx)];
s = [ones(m,1); -ones(m,1)];
B = sparse(i,j,s,m,n);
W = sparse(1:m,1:m,w(idx),m,m);
D = sparse(1:n,1:n,sum(A,1),n,n);
clear x y w idx l i j s;

% if normalized == true
%     d = sqrt(1./diag(D));
%     Dn = spdiags(d, 0, n, n);
%     L = Dn*(D-A)*Dn;
%     X = W.^(0.5)*B*Dn;        
% else
%     L = D - A;
%     X = W.^(0.5)*B;        
% end

L = D - A;
X = (W.^(0.5))*B;   
clear B W D A;

if isempty(scale)
    scale = 1;
end

if scale == 0       % normal distribution
    Y = (randn(k,m)*X)./sqrt(k);
elseif scale == 1   % -1 and 1 with probability 1/2
    Y = (randsrc(k,m)*X)./sqrt(k);
elseif scale == 3   % -sqrt(3) 0 and sqrt(3) with probabilities 1/6, 2/3, and 1/6
    Y = (randsrc(k,m,[-1 0 1; 1/6 2/3 1/6])*X).*(sqrt(3)/sqrt(k));
else                % -sqrt(s) 0 and sqrt(s) with probabilities 1/2s, 1-1/s, and 1/2s
    Y = (randsrc(k,m,[-1 0 1; 1/(2*scale) 1-1/scale 1/(2*scale)])*X).*(sqrt(scale)/sqrt(k));
end
    
clear X;

tic
Z = zeros(k,n);
pfun = cmg_sdd(L);    

for i=1:k
    Z(i,:) = pcg(L, Y(i,:)', tolerance, maxIter, pfun);
end    

% if normalized == true
%     Z = Z*Dn; % Z = W^(1/2) * B *D^(-1/2) * L+ * D^(-1/2)
% end

solver_time = toc;


function [Z, solver_time] = approx_resistance_2(A, k, solver, projection)
%%% Georgina's version
%%%function Z = approx_resistance(A, k)
%%%	From the n x n adjacency matrix A, create the k x n matrix
%%%	Z from which we can calculate the effective resistances between
%%%	any two nodes in the graph.

%%%	Creation of Z requires solving k linear equations.

n = size(A,1);
[x,y,w] = find(A); % nonzero entries of A
idx = (x < y);% to avoid counting each edge twice
m = nnz(idx);
l = 1:m;
i = [ l'; l'];
j = [x(idx); y(idx)];
s = [ones(m,1); -ones(m,1)];
B = sparse(i,j,s,m,n);
W = sparse(1:m,1:m,w(idx),m,m);
X = W.^(0.5) * B;
disp('calculated X');
%%%clear B W i j s l x y w;

%%%disp(['number of nonzeros in W.^(0.5) * B: ' num2str(nnz(X))]);
Y = zeros(k,n);
for i = 1:k
	if strcmp(projection, 'randn')
		Y(i,:) = randn(1,m) * X;
	elseif strcmp(projection, 'plusminus1')
		Y(i,:) = randones(1,m) * X;
	elseif strcmp(projection, 'randR2')
		Y(i,:) = achlioptas2(1,m) * X;
	elseif strcmp(projection, 'randR2a')
		Y(i,:) = achlioptas2(1,m) * X ./ sqrt(3);
	elseif strcmp(projection, 'scale')
		Y(i,:) = randones(1,m) * X .* 0.7071;
	else 
		disp('unknown type of random matrix')
		Y(i,:) = randones(1,m) * X;
	end
end
clear X;
disp('calculated Y');

Y = Y ./ sqrt(k);
L = diag(sum(A)) - A;
%%%L2 = B' * W * B;
%%%nnz(L - L2)
%%%sum(sum(L - L2))
tic
Z = zeros(k,n);
if strcmp(solver,'CMG')
	pfun = cmg_dd(A);
    
    for i=1:k
		tolerance = 1e-9;
		maxit=100;
		Z(i,:) = pcg(L, Y(i,:)',tolerance,maxit,pfun);
    end    
elseif strcmp(solver,'pinv')
	pinvL = pinv(full(L));
	for i=1:k
%%%		Z(i,:) = L \ Y(i,:)';
		Z(i,:) = pinvL * Y(i,:)';
%%%		solver_error = norm(L * Z(i,:)' - Y(i,:)')
%%%		x = Z(i,:)' - pinvL * Y(i,:)';
%%%		Lnorm_error = sqrt(x' * L * x)
%%%		actual = pinvL * Y(i,:)';
%%%		relative_error = Lnorm_error / sqrt(actual' * L * actual)
    end	
elseif strcmp(solver, 'mldivide')
%%%	pinvL = pinv(full(L));
	for i=1:k
		Z(i,:) = L \ Y(i,:)';
%%%		solver_error = norm(L * Z(i,:)' - Y(i,:)')
%%%		x = Z(i,:)' - pinvL * Y(i,:)';
%%%		Lnorm_error = sqrt(x' * L * x)
%%%		actual = pinvL * Y(i,:)';
%%%		relative_error = Lnorm_error / sqrt(actual' * L * actual)
	end
end
epsilon  = 24 * log(n) / k;
solver_time = toc;

function Q = randones(k,d)
%%%	function Q = randones(k,d)
%%%	returns a matrix of size (k,d) with random (1,-1) entries
Q = randsrc(k,d);

