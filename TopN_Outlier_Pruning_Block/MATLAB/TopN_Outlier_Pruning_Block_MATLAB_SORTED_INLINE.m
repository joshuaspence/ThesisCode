% This is an improved implementation, based on the code provided by Nguyen
% Lu Dang Khoa for the thesis titled "Large Scale Anomaly Detection and
% Clustering Using Random Walks".
%--------------------------------------------------------------------------
% Differences between original implementation:
%   * Keeps (neighbours, neighbours_dist) in sorted (ascending) order to
%     reduce the amount of time required to locate the maximum distance.
%   * Added the "found" array which makes more logical sense than the
%     confusing "l" variable in the original implementation.
%   * Utilised sorted property of (outliers, outlier_scores) when
%     determining the best global outliers.
%
% This file has all code inline to reduce runtime overhead.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Find top N outliers by comparing average distances to k nearest
% neighbours with pruning technique.
function [outliers, outlier_scores] = TopN_Outlier_Pruning_Block_MATLAB_SORTED_INLINE(data, k, N, block_size)
    data_size      = size(data,1);  % the number of vectors n the dataset
    outliers       = zeros(1,N);    % /- keep these in sorted
    outlier_scores = zeros(1,N);    % \- (descending) order
    outliers_size  = 0;             % the number of initialised elements in the outliers array
    cutoff = 0;                     %
    count = 0;                      % the number of vectors processed in a block

    while (data_size - count > 0) % load a block of examples from D
        actual_block_size = min(block_size, data_size-count);
        block             = (count+1 : count+actual_block_size);
        count             = count + actual_block_size;

        neighbours      = zeros(actual_block_size, k);  % /- keep these in sorted
        neighbours_dist = zeros(actual_block_size, k);  % \- (ascending) order

        score           = zeros(1, actual_block_size); % the outlier score for each vector in the current block
        found           = zeros(1, actual_block_size); % the number of neighbours found for each vector in the current block

        for vector1_index = 1 : data_size % for each d in D
            for block_index = 1 : actual_block_size % for each b in B
                vector2_index = block(block_index);

                if vector1_index ~= vector2_index && vector2_index ~= 0
                    % d = euclidean_dist_squared(data(vector1_index,:), data(vector2_index,:));
                    % Inline {
                        V = data(vector1_index,:) - data(vector2_index,:);
                        dist_squared = V * V';

                        % Output argument setup
                        d = dist_squared;
                    % }

                    % Keep track of the k nearest neighbours to each vector
                    % in the block.
                    % [neighbours(block_index,:), neighbours_dist(block_index,:), found(block_index), maxd] = sorted_insert(neighbours(block_index,:), neighbours_dist(block_index,:), found(block_index), vector1_index, d);
                    % Inline {
                        % Input argument setup
                        index_array = neighbours(block_index,:);
                        value_array = neighbours_dist(block_index,:);
                        curr_size   = found(block_index);
                        new_index   = vector1_index;
                        new_value   = d;

                        index = 0;
                        removed_value = -1;

                        if curr_size < size(value_array,2)
                            for i = size(value_array,2)-curr_size : 1 : size(value_array,2)
                                if new_value > value_array(i) || i == size(value_array,2)-curr_size
                                    if (i ~= 1)
                                        index_array(i-1) = index_array(i);
                                        value_array(i-1) = value_array(i);
                                    end
                                    index = i;
                                    removed_value = 0;
                                else
                                    break;
                                end
                            end
                        else
                            for i = size(value_array,2) : -1 : 1
                                if new_value < value_array(i)
                                    if i == size(value_array,2)
                                        removed_value = value_array(i);
                                    end

                                    if (i ~= 1)
                                        index_array(i) = index_array(i-1);
                                        value_array(i) = value_array(i-1);
                                    end
                                    index = i;
                                else
                                    break;
                                end
                            end
                        end

                        if index ~= 0
                            index_array(index) = new_index;
                            value_array(index) = new_value;

                            if (curr_size < size(value_array,2))
                                curr_size = curr_size + 1;
                            end
                        end

                        % Output argument setup
                        neighbours(block_index,:)      = index_array;
                        neighbours_dist(block_index,:) = value_array;
                        found(block_index)             = curr_size;
                        maxd                           = removed_value;
                    % }

                    % Update the score.
                    if maxd ~= -1
                        score(block_index) = (score(block_index)*k - maxd + d)/k;
                    end

                    if found(block_index) == k && score(block_index) < cutoff
                        block(block_index) = 0;
                        score(block_index) = 0;
                    end
                end
            end
        end

        % Keep track of the best outliers so far.
        % [outliers, outlier_scores, outliers_size] = best_outliers(outliers, outlier_scores, outliers_size, block(1:actual_block_size), score);
        % Inline {
            % Input argument setup
            outliers       = outliers;
            outlier_scores = outlier_scores;
            outliers_size  = outliers_size;
            current_block  = block(1:actual_block_size);
            scores         = score;

            [scores, index] = sort(scores, 'descend');
            current_block = current_block(index);

            % Merge the two arrays.
            % [outliers, outlier_scores, outliers_size] = merge(outliers, outlier_scores, outliers_size, current_block, scores, size(current_block,2), size(outliers,2));
            % Inline {
                % Input argument setup
                index_array1 = outliers;
                value_array1 = outlier_scores;
                array1_size  = outliers_size;
                index_array2 = current_block;
                value_array2 = scores;
                array2_size  = size(current_block,2);

                index_array = zeros(1,N);
                value_array = zeros(1,N);
                array_size  = 0;

                iter  = 1;
                iter1 = 1;
                iter2 = 1;
                while iter <= N && (iter1 <= array1_size || iter2 <= array2_size)
                    if iter1 > array1_size && iter2 <= array2_size
                        index_array(iter)     = index_array2(iter2);
                        value_array(iter)     = value_array2(iter2);
                        iter1                 = iter1+1;
                        iter2                 = iter2+1;
                    elseif iter1 <= array1_size && iter2 > array2_size
                        index_array(iter)     = index_array1(iter1);
                        value_array(iter)     = value_array1(iter1);
                        iter1                 = iter1+1;
                        iter2                 = iter2+1;
                    elseif iter1 > array1_size && iter2 > array2_size
                        iter1                 = iter1+1;
                        iter2                 = iter2+1;
                    elseif value_array1(iter1) >= value_array2(iter2)
                        index_array(iter) = index_array1(iter1);
                        value_array(iter) = value_array1(iter1);
                        iter1             = iter1+1;
                    elseif value_array1(iter1) <= value_array2(iter2)
                        index_array(iter) = index_array2(iter2);
                        value_array(iter) = value_array2(iter2);
                        iter2             = iter2+1;
                    end

                    iter       = iter+1;
                    array_size = array_size+1;
                end

                % Output argument setup
                outliers       = index_array;
                outlier_scores = value_array;
                outliers_size  = array_size;
            % }

            % Output argument setup
            outliers       = outliers;
            outlier_scores = outlier_scores;
            outliers_size  = outliers_size;
        % }

        % Update the cutoff.
        cutoff = outlier_scores(size(outlier_scores,2));
    end
%-------------------------------------------------------------------------------
