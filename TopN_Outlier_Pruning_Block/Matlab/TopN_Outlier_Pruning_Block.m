% find top N outliers  by comparing average 
% distances to knn with pruning technique
function [O,OF] = TopN_Outlier_Pruning_Block_ORIGINAL(X, k, N, block_size)
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

% find top N outliers  by comparing average 
% distances to knn with pruning technique
function [outliers,outlier_scores] = TopN_Outlier_Pruning_Block_IMPROVED(data, k, N, block_size)
	n = size(data,1);
	outliers = zeros(1,N);
	outlier_scores = zeros(1,N);

	cutoff = 0;
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

		found = zeros(1, sizeB);
		for i = 1 : n
			for j = 1 : sizeB
				if i ~= B(j) && B(j) ~= 0
					d = dist(data(i,:), data(B(j),:))^2;
					%fprintf('dist=%e\n', d);
		            
					if found(j) < k
						found(j) = found(j)+1;
						
						neighbours(j, found(j)) = i;
						neighbours_dist(j, found(j)) = d;
						
						if found(j) == k
							score(j) = mean(neighbours_dist(j,:), 2);
							disp(neighbours(j,:));
							disp(neighbours_dist(j,:));
						end
						fprintf('no need to replace\n');
					else % found > k
						% find the farthest point
						[maxd, maxi] = max(neighbours_dist(j,:));
						% replace the farthest point
						if d < maxd 
							fprintf('replacing %d (%f) with %d (%f)\n', neighbours(j, maxi), neighbours_dist(j, maxi), i, d);
							neighbours(j, maxi) = i;
							neighbours_dist(j, maxi) = d;
							% update the score
							score(j) = (score(j)*k - maxd + d)/k;
							if score(j) <= 0
								% avoid round off error
								score(j) = max(mean(neighbours_dist(j,:),2), 0);
							end
							disp(neighbours(j,:));
							disp(neighbours_dist(j,:));
						end            
					end
		            
					if found(j) >= k && score(j) < cutoff
						B(j) = 0;                    
						score(j) = 0;  
						fprintf('should skip\n');             
					end
					fprintf('i=%d, j=%d, B(j)=%d, found=%d, score=%e\n', i, j, B(j), found(j), score(j));
				end
			end
		end
		
		% outliers = Top(B U outliers,N)
		BO = [B(1:sizeB) outliers];
		BOF = [score outlier_scores];
		[BOF, index] = sort(BOF, 'descend');
		BO = BO(index);
		
		outliers = BO(1:N);
		outlier_scores = BOF(1:N);    
		% cutoff = weakest outlier
		cutoff = outlier_scores(N);
	end
