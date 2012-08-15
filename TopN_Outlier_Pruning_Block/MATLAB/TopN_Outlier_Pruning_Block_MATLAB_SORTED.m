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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Find top N outliers by comparing average distances to k nearest
% neighbours with pruning technique.
function [outliers, outlier_scores] = TopN_Outlier_Pruning_Block_MATLAB_SORTED(data, k, N, block_size)
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
                    d = euclidean_dist_squared(data(vector1_index,:), data(vector2_index,:));

                    % Keep track of the k nearest neighbours to each vector
                    % in the block.
                    [neighbours(block_index,:), neighbours_dist(block_index,:), found(block_index), maxd] = sorted_insert(neighbours(block_index,:), neighbours_dist(block_index,:), found(block_index), vector1_index, d);

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
        [outliers, outlier_scores, outliers_size] = best_outliers(outliers, outlier_scores, outliers_size, block(1:actual_block_size), score);

        % Update the cutoff.
        cutoff = outlier_scores(size(outlier_scores,2));
    end
%-------------------------------------------------------------------------------

% Add a (index,value)-pair into a pair of sorted arrays. Assumes that the
% (index,value) array pair is already in ascending order.
%
% This function assumes that an array element with a zero index is
% uninitialised.
function [index_array, value_array, curr_size, removed_value] = sorted_insert(index_array, value_array, curr_size, new_index, new_value)
    % Error checking.
    if (size(index_array) ~= size(value_array))
        error('index_array and value_array are not suitable pairs.');
    end

    index = 0;          % the index at which the new pair will be inserted
    removed_value = -1; % the value that was removed from the value_array

    % Shuffle array elements from front to back. Elements greater than
    % the new value will be right-shifted by one index in the array.
    %
    % Note that uninitialised values in the array will appear on the
    % left. That is, if the array is incomplete (has a size n < N) then
    % the data in the array is stored in the rightmost n indexes.

    if curr_size < size(value_array,2)
        % Special handling required if the array is incomplete.

        for i = size(value_array,2)-curr_size : 1 : size(value_array,2)
            if new_value > value_array(i) || i == size(value_array,2)-curr_size
                % Shuffle values down the array.
                if (i ~= 1)
                    index_array(i-1) = index_array(i);
                    value_array(i-1) = value_array(i);
                end
                index = i;
                removed_value = 0;
            else
                % We have found the insertion point.
                break;
            end
        end
    else
        for i = size(value_array,2) : -1 : 1
            if new_value < value_array(i)
                if i == size(value_array,2)
                    % The removed value is the value of the last
                    % element in the array.
                    removed_value = value_array(i);
                end

                % Shuffle values down the array.
                if (i ~= 1)
                    index_array(i) = index_array(i-1);
                    value_array(i) = value_array(i-1);
                end
                index = i;
            else
                % We have found the insertion point.
                break;
            end
        end
    end

    % Insert the new pair and increment the current_size of the array (if
    % necessary).
    if index ~= 0
        index_array(index) = new_index;
        value_array(index) = new_value;

        if (curr_size < size(value_array,2))
            curr_size = curr_size + 1;
        end
    end
%--------------------------------------------------------------------------

% Add a (index,value)-pair into a pair of unsorted arrays.
%
% The curr_size argument is used to indicate that some values in the array
% represent uninitialised values.
function [index_array, value_array, curr_size, removed_value] = unsorted_insert(index_array, value_array, curr_size, new_index, new_value)
    % Error checking.
    if (size(index_array) ~= size(value_array))
        error('index_array and value_array are not suitable pairs.');
    end

    index = 0;          % the index at which the new pair will be inserted
    removed_value = -1; % the value that was removed from the value_array

    if curr_size < size(index_array,2)
        index_array(curr_size+1) = new_index;
        value_array(curr_size+1) = new_value;
        curr_size                = curr_size+1;
        removed_value = 0;
    else
        % Find the maximum value.
        [max_value,max_index] = max(value_array);

        if (new_value < max_value)
            % Replace the maximum value.
            index_array(max_index) = new_index;
            value_array(max_index) = new_value;
            removed_value = max_value;
        end
    end
%--------------------------------------------------------------------------

% Take the top N outliers based on the current outliers (identified by the
% (outliers-outlier_scores) pairs) and the new outliers from the current
% block (identified by the (block-scores) pairs).

% Note that the (outliers, outlier_scores) arrays should already be sorted.
% The (block-scores) arrays need not be sorted.
%
% This function uses merge sort.
function [outliers, outlier_scores, outliers_size] = best_outliers(outliers, outlier_scores, outliers_size, current_block, scores)
    % Error checking.
    if (size(outliers) ~= size(outlier_scores))
        error('outliers and outlier_scores are not suitable pairs.');
    end
    if (size(current_block) ~= size(scores))
        error('block and scores are not suitable pairs.');
    end

    % Sort the (current_block, scores) arrays.
    [scores, index] = sort(scores, 'descend');
    current_block = current_block(index);

    % Merge the two arrays.
    [outliers, outlier_scores, outliers_size] = merge(outliers, outlier_scores, outliers_size, current_block, scores, size(current_block,2), size(outliers,2));
%--------------------------------------------------------------------------

% Merge two sorted arrays in descending order. Takes two pairs of 1xN arrays and
% returns a pair of 1xN arrays.
function [index_array, value_array, array_size] = merge(index_array1, value_array1, array1_size, index_array2, value_array2, array2_size, N)
    % Error checking.
    if size(index_array1) ~= size(value_array1)
        error('index_array1 and value_array1 are not suitable pairs.');
    end
    if size(index_array2) ~= size(value_array2)
        error('index_array1 and value_array1 are not suitable pairs.');
    end
    if (size(index_array1, 1) ~= 1)
        error('index_array1 should have only one row.');
    end
    if (size(index_array2, 1) ~= 1)
        error('index_array1 should have only one row.');
    end

    index_array = zeros(1,N);
    value_array = zeros(1,N);
    array_size  = 0;

    iter  = 1;  % iterator through output array
    iter1 = 1;  % iterator through array1
    iter2 = 1;  % iterator through array2
    while iter <= N && (iter1 <= array1_size || iter2 <= array2_size)
        if iter1 > array1_size && iter2 <= array2_size
            % There are no remaining elements remaining in array1
            index_array(iter)     = index_array2(iter2);
            value_array(iter)     = value_array2(iter2);
            iter1                 = iter1+1;
            iter2                 = iter2+1;
        elseif iter1 <= array1_size && iter2 > array2_size
            % There are no remaining elements remaining in array2
            index_array(iter)     = index_array1(iter1);
            value_array(iter)     = value_array1(iter1);
            iter1                 = iter1+1;
            iter2                 = iter2+1;
        elseif iter1 > array1_size && iter2 > array2_size
            % The are no remaining elements in either array1 or array2
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
