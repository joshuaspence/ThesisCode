% All data sets are assumed to have a CSV extension
data = {
%    'ball1', ...
%	'letter-recognition', ...
%	'magicgamma', ...
%	'mesh_network', ...
%	'outrank', ...
%	'runningex1k', ...
%	'runningex10k', ...
%	'runningex20k', ...
%	'runningex30k', ...
%	'runningex40k', ...
%	'runningex50k', ...
%	'segmentation', ...
%	'spam_train', ...
%    'test', ...
	'testCD', ...
%	'testCDST', ...
%	'testCDST2', ...
%	'testCDST3', ...
%	'testoutrank', ...
%	'spam', ...
%	'connect4', ...
%	'pendigits', ...
%	'musk', ...
	};

% The name of the file that the "commute_distance_anomaly" script saves  
% output variables to
results_file_name = 'TopN_Outlier_Pruning_Block.mat';

% To variables to check for equality
variables_to_check = {
	'O', ...
	'OF', ...
	};

% Each data set will be profiled with each of the following profiles
base_profile = struct('name', 'original',  'func', 'TopN_Outlier_Pruning_Block_ORIGINAL');
profiles = [
	struct('name', 'improved',  'func', 'TopN_Outlier_Pruning_Block_IMPROVED'), ...
    struct('name', 'initial_C', 'func', 'TopN_Outlier_Pruning_Block'), ...
    ];

% Number of iterations for each data set
iterations = 1;

% Root output directory
testing_root_dir = strcat('.', filesep, 'test');
if exist(testing_root_dir, 'dir') == 7
	rmdir(testing_root_dir, 's');
end
mkdir(testing_root_dir);

% Number of failed tests
num_failures = 0;

% Iterate over all data sets
for d = 1 : length(data)
    dataset      = char(data(d));
    dataset_file = strcat(dataset, '.csv');
    output_dir   = strcat(testing_root_dir, filesep, dataset);
    if exist(output_dir, 'dir') ~= 7;
    	mkdir(output_dir);
    end
    
    % Iterate over all iterations
    for j = 1 : iterations
    	output_dir = strcat(output_dir, filesep, int2str(j));
    	if exist(output_dir, 'dir') ~= 7
    		mkdir(output_dir);
    	end
    
    	% Randomize data
    	randomness_file = strcat(output_dir, filesep, 'random.mat');
    	if exist(randomness_file, 'file') ~= 2
			fprintf('\nRandomizing...\n');
			randnState = randn('state');
			randState = rand('state');
		    save(randomness_file, 'randnState', 'randState');
        else
        	fprintf('\nUsing randomness from file...\n');
        end
        
        % Iterate over all profiles
        all_profiles = [base_profile, profiles];
        for k = 1 : length(all_profiles)
            profile_name       = all_profiles(k).name;
            profile_func       = all_profiles(k).func;
            profile_output_dir = strcat(output_dir, filesep, profile_name);
            mkdir(profile_output_dir);
            
            fprintf('\nDate: %s\n', datestr(now));
            fprintf('Data set: "%s"\n', dataset);
            fprintf('Iteration: %d\n', j);
            fprintf('Profile: "%s"\n', profile_name);
            fprintf('Function: "%s"\n', profile_func);
            fprintf('Output directory: "%s"\n', output_dir);
            fprintf('Randomness: "%s"\n', randomness_file);

            % Run command
            fprintf('Running MATLAB command.\n');
            matlab_command = sprintf('commute_distance_anomaly(''%s'', ''%s'', ''%s'', ''%s'', true)', dataset_file, randomness_file, profile_func, profile_output_dir);
            matlab_output = evalc(matlab_command);
            
            % Save MATLAB output
            fprintf('Saving MATLAB output.\n');
            fid = fopen(strcat(profile_output_dir, filesep, 'matlab_output.log'), 'w');
            fprintf(fid, '%s', matlab_output);
            fclose(fid);
        end
        
        % Compare results
        base_results_file = strcat(output_dir, filesep, base_profile.name, filesep, results_file_name);
		base_results = load(base_results_file);

		for k = 1 : length(profiles)
            profile_name = profiles(k).name;
            fprintf('\nComparing results for "%s"...\n', profile_name);
            results_file = strcat(output_dir, filesep, profile_name, filesep, results_file_name);
            results = load(results_file);
            
            for l = 1 : length(variables_to_check)
            	var = char(variables_to_check(l));
            	fprintf('Checking variable "%s"... ', var);
	            if isequal(base_results.(var), results.(var))
	            	fprintf('YES\n');
	           	else
	           		fprintf('NO\n');
	           		num_failures = num_failures + 1;
	           	end
            end
        end
    end
end

% Done. Delete testing files.
if num_failures == 0
	fprintf('\nAll tests passed successfully.\n');
	rmdir(testing_root_dir, 's');
else
	fprintf('\n%d tests failed.\n', num_failures);
end
