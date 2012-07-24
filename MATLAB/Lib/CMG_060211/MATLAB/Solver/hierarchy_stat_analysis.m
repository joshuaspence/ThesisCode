% stats = hierarchy_stat_analysis(H)
%
% H hieararchy structure
%
function stats =  hierarchy_stat_analysis(H)


stats{1}.number_of_visits =1;
for i=1:(length(H)-1)
    stats{i+1}.nodes = length(H{i+1}.A);
    stats{i+1}.edges = nnz(H{i+1}.A);
    stats{i+1}.number_of_visits = H{i}.repeat* (stats{i}.number_of_visits); 
    
end

