% This is an improved implementation, based on the code provided by Nguyen Lu 
% Dang Khoa for the thesis titled "Large Scale Anomaly Detection and Clustering 
% Using Random Walks"
%-------------------------------------------------------------------------------
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Find top N outliers by comparing average distances to k nearest neighbours 
% with pruning technique.
function [outliers,outlier_scores] = TopN_Outlier_Pruning_Block_IMPROVED(data, k, N, block_size)
	data_size      = size(data,1);
	
	outliers       = zeros(1,N);    % keep these in sorted 
	outlier_scores = zeros(1,N);    % (descending) order

	cutoff = 0;
	count = 0;
	
	while (data_size - count > 0) % load a block of examples from D
	    if (count <= data_size)
			actual_block_size = block_size;
		else
			actual_block_size = data_size - count;
		end
		block = zeros(1, actual_block_size);
		block = (count+1 : count+actual_block_size);
		count = count + actual_block_size;
		
		neighbours      = zeros(actual_block_size, k);  % keep these in sorted
		neighbours_dist = zeros(actual_block_size, k);  % (ascending) order
		
		score           = zeros(1, actual_block_size);
		found           = zeros(1, actual_block_size);
		
		for vector1_index = 1 : data_size % for each d in D
			for block_index = 1 : actual_block_size % for each b in B
			    vector2_index = block(block_index);
			    
				if (vector1_index ~= vector2_index && vector2_index ~= 0)
					d = euclidean_dist(data(vector1_index,:), data(vector2_index,:))^2;
		            
		            old_found = found;
		            [neighbours, neighbours_dist, maxd, found] = sorted_insert(neighbours, neighbours_dist, found, vector1_index, d, 'ascend');
		            
		            if (found ~= old_found)
					    % Update the score
					    score(block_index) = (score(block_index)*k - maxd + d)/k;
					    
					    % Set new cutoff
					    if score(block_index) < cutoff
					        block(block_index) = 0;             
					        score(block_index) = 0;         
				        end
				    end
				end
			end
		end
		
		% outliers = Top(B U outliers,N)
		[outliers, outlier_scores, cutoff] = best_outliers(outliers, outlier_scores, block(1:actual_block_size), score);
	end
%-------------------------------------------------------------------------------

% Add a (index,value)-pair into a pair of sorted arrays.
function [index_array, value_array, removed_value, found] = sorted_insert(index_array, value_array, curr_size, new_index, new_value, sorting)
    if size(index_array) ~= size(value_array)
        error('index_array and value_array are not suitable pairs.');
    end
    
    if not(strcmpi(sorting, 'descend')) && not(strcmpi(sorting, 'ascend'))
        error('Sorting mode must be either "ascend" or "descend".');
    end

    index = 0;
    removed_value = 0;
    
    for i = size(value_array,1) : 1
        if sorting == 'descend'
            if new_value > value_array(i)
                if i == size(value_array,1)
                    removed_value = index_array(i);
                end
            
                index_array(i) = index_array(i-1);
                value_array(i) = value_array(i-1);
                index = i;
            else
                break;
            end
        elseif sorting == 'ascend'
            if new_value < value_array(i)
                if i == size(value_array,1)
                    removed_value = index_array(i);
                end
                
                index_array(i) = index_array(i-1);
                value_array(i) = value_array(i-1);
                index = i;
            else
                break;
            end
        end
    end
    
    if index ~= 0
        index_array(index) = new_index;
        value_array(index) = new_value;
    end
%-------------------------------------------------------------------------------

% Note that the (outliers, outlier_scores) arrays should already be sorted.
function [outliers, outlier_scores, cutoff] = best_outliers(outliers, outlier_scores, block, scores)
    % Sort the (block, scores) arrays.
	[scores, index] = sort(scores, 'descend');
	block = block(index);
		
    % Merge the two arrays.
    [outliers, outlier_scores] = merge(outliers, outlier_scores, block, scores, 'descend');
    
    % Update the cutoff
    cutoff = outlier_scores(size(outlier_scores,1));
%-------------------------------------------------------------------------------

% Merge two sorted arrays. Takes two pairs of 1xN arrays and returns a pair of 
% 1xN arrays.
function [index_array, value_array] = merge(index_array1, value_array1, index_array2, value_array2, sorting)
    if size(index_array1) ~= size(value_array1)
        error('index_array1 and value_array1 are not suitable pairs.');
    end
    
    if size(index_array2) ~= size(value_array2)
        error('index_array1 and value_array1 are not suitable pairs.');
    end
    
    if size(index_array1) ~= size(index_array1)
        error('Array-pair 1 and array-pair 2 are not the same dimensions.');
    end
    
    if not(strcmpi(sorting, 'descend')) && not(strcmpi(sorting, 'ascend'))
        error('Sorting mode must be either "ascend" or "descend".');
    end
    
    % descending
    iter1 = 1;
    iter2 = 1;
    for i = 1 : size(index_array1)
        if value_array1(iter1) == value_array2(iter2)
            index_array(i) = index_array1(iter1);
            value_array(i) = value_array1(iter1);
            iter1 = iter1+1;
            i     = i+1;
            
            if i <= size(index_array1)
                index_array(i) = index_array2(iter2);
                value_array(i) = value_array2(iter2);
                iter2 = iter2+1;
            end
        elseif value_array1(iter1) > value_array2(iter2)
            if sorting == 'descend'
                index_array(i) = index_array1(iter1);
                value_array(i) = value_array1(iter1);
                iter1 = iter1+1;
            elseif sorting == 'ascend'
                index_array(i) = index_array2(iter2);
                value_array(i) = value_array2(iter2);
                iter2 = iter2+1;
            end
        elseif value_array1(iter1) < value_array2(iter2)
            if sorting == 'descend'
                index_array(i) = index_array2(iter2);
                value_array(i) = value_array2(iter2);
                iter2 = iter2+1;
            elseif sorting == 'ascend'
                index_array(i) = index_array1(iter1);
                value_array(i) = value_array1(iter1);
                iter1 = iter1+1;
            end
        end
    end
%-------------------------------------------------------------------------------

function dist = euclidean_dist(X1,X2)
    V = X1 - X2;
    dist = sqrt(V * V');
%-------------------------------------------------------------------------------
