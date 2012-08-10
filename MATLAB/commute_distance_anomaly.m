% Commute distances from knn graph derived from data.
%
% USAGE
%   commute_distance_anomaly dataset func_name
%
% ARGUMENTS
%   func_name       The name of the "TopN_Outlier_Pruning_Block" function to 
%                   use.
%
function commute_distance_anomaly(dataset, func_name)

% Note: this function just calls the more advanced (more parameter)
% version of the same function. This function, however, is more user
% friendly.
commute_distance_anomaly_profiling(dataset, '', func_name, '.', 0)
