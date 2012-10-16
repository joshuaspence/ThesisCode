% This is the original implementation as provided by Nguyen Lu Dang Khoa
% or the thesis titled "Large Scale Anomaly Detection and Clustering Using
% Random Walks".
%--------------------------------------------------------------------------
% Note that the "dist" function was substituted with a "euclidean_dist"
% function as it seems that a strange implementation of "dist" was causing
% some issues.
%
% The code was also modified for readability purposes.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Find the top N outliers by comparing average distances to the k nearest
% neighbours with pruning technique.
function [O, OF] = TopN_Outlier_Pruning_Block_MATLAB_ORIGINAL(X, k, N, block_size)
    n  = size (X,1);
    OF = zeros(1,N);
    O  = OF;

    c = 0;
    count = 0;
    while (n-count > 0)
        B = zeros(1, block_size);
        B = (count+1 : count+block_size);
        count = count + block_size;

        if count <= n
            sizeB = block_size;
        else
            sizeB = n - (count - block_size);
        end

        neighbours      = zeros(sizeB,k);
        neighbours_dist = zeros(sizeB,k);
        score           = zeros(1,sizeB);

        l = 1;
        for i = 1 : n
            for j = 1 : sizeB
                if i ~= B(j) && B(j) ~= 0 % pruning B(j)<>0
                    d = euclidean_dist_squared(X(i,:), X(B(j),:));

                    if l>1 && l<=k+1 && neighbours(j,l-1) == 0
                        l = l-1;
                    elseif l<k && neighbours(j,l) ~= 0
                        l = l+1;
                    end

                    if l <= k
                        neighbours     (j,l) = i;
                        neighbours_dist(j,l) = d;
                        if l == k
                            score(j) = mean(neighbours_dist(j,:), 2);
                        end
                    else % l > k
                        % find the farthest point
                        [maxd,maxi] = max(neighbours_dist(j,:));

                        % replace the farthest point
                        if d < maxd
                            neighbours     (j,maxi) = i;
                            neighbours_dist(j,maxi) = d;

                            % update the score
                            score(j) = (score(j)*k - maxd + d)/k;
                            if score(j) <= 0
                                % avoid round off error
                                score(j) = max(mean(neighbours_dist(j,:),2),0);
                            end
                        end
                    end

                    if l >= k && score(j) < c % prune B(j)
                        B(j) = 0;
                        %neighbours     (j,:) = 0;
                        %neighbours_dist(j,:)=0;
                        score(j) = 0;
                    end
                end
            end
            l = l+1;
        end

        % O = Top(B U O,N)
        BO  = [B(1:sizeB) O];
        BOF = [score OF];
        [BOF,index] = sort(BOF, 'descend');
        BO = BO(index);

        O  = BO(1:N);
        OF = BOF(1:N);

        % c = weakest outlier
        c = OF(N);
    end
%--------------------------------------------------------------------------

% Calculate the Euclidean distance between two vectors.
function dist = euclidean_dist(X, Y)
    dist = norm(X - Y);
%--------------------------------------------------------------------------

% Calculate the squared Euclidean distance between two vectors.
function dist_squared = euclidean_dist_squared(X, Y)
    V = X - Y;
    dist_squared = V * V';
%--------------------------------------------------------------------------