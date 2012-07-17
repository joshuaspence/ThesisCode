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

% Add a (index,value)-pair into a pair of sorted arrays. Assumes that the 
% (index,value) array pair is already in sorted order.
%
% The curr_size argument is used to indicate that some values in the array 
% represent uninitialised values.
%
% The array can be sorted in ascending ('ascend') or descending ('descend') 
% order.
function [index_array, value_array, removed_value, curr_size] = sorted_insert(index_array, value_array, curr_size, new_index, new_value, sorting)
    % Error checking
    if (size(index_array) ~= size(value_array))
        error('index_array and value_array are not suitable pairs.');
    end
    if (not(strcmpi(sorting, 'descend')) && not(strcmpi(sorting, 'ascend')))
        error('Sorting mode must be either "ascend" or "descend".');
    end

    index = 0;          % the index at which the new pair will be inserted
    removed_value = 0;  % the value that was removed from the value_array
    
    if strcmpi(sorting, 'descend')
        % Shuffle array elements from front to back. Elements less than the new
        % value will be right-shifted by one index in the array.
        %
        % Note that uninitialised values in the array will appear on the right. 
        % That is, if the array is incomplete (has a size n < N) then the data 
        % in the array is stored in the leftmost n indexes.
        for i = min(curr_size+1, size(value_array,2)) : -1 : 1
            % If the array is incomplete, then we ignore the last value (as it 
            % represents the uninitialised value, regardless of its actual 
            % value).
            if (new_value > value_array(i)) || (i == curr_size + 1 && curr_size < size(value_array,2))
                if i == size(value_array,2) && curr_size >= size(value_array,2)
                    % The removed value is the value of the last element in the 
                    % array.
                    removed_value = index_array(i);
                end

                % Shuffle values down the array.            
                if (i > 1)
                    index_array(i) = index_array(i-1);
                    value_array(i) = value_array(i-1);
                end
                index = i;
            else
                % We have found the insertion point.
                break;
            end
        end
    elseif strcmpi(sorting, 'ascend')
        % Shuffle array elements from front to back. Elements greater than the 
        % new value will be right-shifted by one index in the array.
        %
        % Note that uninitialised values in the array will appear on the left. 
        % That is, if the array is incomplete (has a size n < N) then the data 
        % in the array is stored in the rightmost n indexes.
        if curr_size < size(value_array,2)
            % Special handling required if the array is incomplete.
            
            for i = size(value_array,2)-curr_size : 1 : size(value_array,2)
                if (new_value > value_array(i) || i == size(value_array,2)-curr_size)
                    % Shuffle values down the array.
                    if (i ~= 1)
                        index_array(i-1) = index_array(i);
                        value_array(i-1) = value_array(i);
                    end
                    index = i;
                else
                    % We have found the insertion point.
                    break;
                end
            end
        else
            for i = size(value_array,2) : -1 : 1
                if new_value < value_array(i)
                    if i == size(value_array,2)
                        % The removed value is the value of the last element in 
                        % the array.
                        removed_value = index_array(i);
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
%-------------------------------------------------------------------------------

% Calculate the Euclidean distance between two vectors.
function dist = euclidean_dist(X1,X2)
    V = X1 - X2;
    dist = sqrt(V * V');
%-------------------------------------------------------------------------------
