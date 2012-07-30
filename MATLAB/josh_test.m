% All data sets are assumed to have a CSV extension
% Note: Data sets are listed here in increasing order of size, so that the 
% script produces as many results as quickly as possible. The command used 
% to do this is `du *.csv | sort -n | awk '{print $2}'`.
data_dir = 'Datasets';
data = {
%    'testoutrank', ...
%    'ball1', ...
    'testCD', ...
%    'runningex1k', ...
%    'testCDST2', ...
%    'testCDST3', ...
%    'testCDST', ...
%    'runningex10k', ...
%    'runningex20k', ...
%    'segmentation', ...
%    'runningex30k', ...
%    'pendigits', ...
%    'runningex40k', ...
%    'spam_train', ...
%    'runningex50k', ...
%    'spam', ...
%    'letter-recognition', ...
%    'mesh_network', ...
%    'magicgamma', ...
%    'musk', ...
%    'connect4', ...
};

% The name of the file that the "commute_distance_anomaly" script saves  
% output variables to... from "commute_distance_anomaly.m"
results_file_name = 'TopN_Outlier_Pruning_Block.mat';

% Each data set will be profiled with each of the following profiles.
base_profile = struct('name', 'original',  'func', 'TopN_Outlier_Pruning_Block_ORIGINAL');
profiles = [
%    struct('name', 'original_inline',  'func', 'TopN_Outlier_Pruning_Block_ORIGINAL_INLINE'), ...
%    struct('name', 'improved',         'func', 'TopN_Outlier_Pruning_Block_IMPROVED'), ...
%    struct('name', 'improved_inline',  'func', 'TopN_Outlier_Pruning_Block_IMPROVED_INLINE'), ...
    struct('name', 'initial_C',        'func', 'TopN_Outlier_Pruning_Block'), ...
    ];

% Number of iterations for each data set.
iterations = 1;

% Root output directory. If this directory exists, it will be deleted.
testing_root_dir = strcat('.', filesep, 'test');
if exist(testing_root_dir, 'dir') == 7
    rmdir(testing_root_dir, 's');
end
mkdir(testing_root_dir);

% Number of failed tests.
num_failures = 0;

% A small value for comparing doubles.
eps = 1e-6;

% Iterate over all data sets.
for d = 1 : length(data)
    dataset      = char(data(d));
    dataset_file = strcat(data_dir, filesep, dataset, '.csv');
    output_dir   = strcat(testing_root_dir, filesep, dataset);
    if exist(output_dir, 'dir') ~= 7;
        mkdir(output_dir);
    end
    
    % Iterate over all iterations.
    for j = 1 : iterations
        output_dir = strcat(output_dir, filesep, int2str(j));
        if exist(output_dir, 'dir') ~= 7
            mkdir(output_dir);
        end
    
        % Randomize data.
        randomness_file = strcat(output_dir, filesep, 'random.mat');
        if exist(randomness_file, 'file') ~= 2
            fprintf('\nRandomizing...\n');
            randnState = randn('state');
            randState = rand('state');
            save(randomness_file, 'randnState', 'randState');
        else
            fprintf('\nUsing randomness from file...\n');
        end
        
        % Iterate over all profiles.
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

            % Run command.
            fprintf('Running MATLAB command.\n');
            matlab_command = sprintf('commute_distance_anomaly(''%s'', ''%s'', ''%s'', ''%s'')', dataset_file, randomness_file, profile_func, profile_output_dir);
            matlab_output = evalc(matlab_command);
            
            % Save MATLAB output.
            fprintf('Saving MATLAB output.\n');
            fid = fopen(strcat(profile_output_dir, filesep, 'matlab_output.log'), 'w');
            fprintf(fid, '%s', matlab_output);
            fclose(fid);
        end
        
        % Compare results.
        base_results_file = strcat(output_dir, filesep, base_profile.name, filesep, results_file_name);
        base_results = load(base_results_file);

        for k = 1 : length(profiles)
            profile_name = profiles(k).name;
            fprintf('\nComparing results for "%s"...\n', profile_name);
            results_file = strcat(output_dir, filesep, profile_name, filesep, results_file_name);
            results = load(results_file);
            
            % Compare OF_sum.
            % A larger value for OF_sum is better...
            var = char('OF_sum');
            fprintf('Checking variable "%s"... ', var);
            if (base_results.(var) - eps) <= results.(var)
                fprintf('YES\n');
               else
                   fprintf('NO\n');
                   num_failures = num_failures + 1;
            end
            fprintf('%s:\t%d\n', base_profile.name, base_results.(var));
            fprintf('%s:\t%d\n', profile_name, results.(var));
            
            % Compare similarity of O.
            % No pass/fail criteria set.
            var = char('O');
            fprintf('Checking variable "%s"... ', var);
            similarity = sum(ismember(base_results.(var), results.(var)));
            theSize = size(base_results.(var),2);
            fprintf('%d out of %d similar\n', similarity, theSize);
            
            % Compare range of OF.
            % Larger values are better.
            var = char('OF');
            fprintf('Checking variable "%s"... ', var);
            base_upper    = base_results.(var)(1);
            results_upper = results.(var)(1);
            base_lower    = base_results.(var)(size(base_results.(var),2));
            results_lower = results.(var)(size(results.(var),2));
            
            if (base_upper - eps <= results_upper) && (base_lower - eps <= results_lower)
                fprintf('YES\n');
               else
                   fprintf('NO\n');
                   num_failures = num_failures + 1;
            end
            fprintf('%s (lowest):\t%d\n', base_profile.name, base_lower);
            fprintf('%s (highest):\t%d\n', base_profile.name, base_upper);
            fprintf('%s (lowest):\t%d\n', profile_name, results_lower);
            fprintf('%s (upper):\t%d\n', profile_name, results_upper);
        end
    end
end

% Done. Delete testing files.
if num_failures == 0
    fprintf('\nAll tests passed successfully.\n');
    %rmdir(testing_root_dir, 's');
else
    fprintf('\n%d tests failed.\n', num_failures);
end
