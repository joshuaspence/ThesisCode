% All data sets are assumed to have a CSV extension
% Note: Data sets are listed here in increasing order of size, so that the 
% script produces as many results as quickly as possible. The command used 
% to do this is `du *.csv | sort -n | awk '{print $2}'`.
data_dir = 'Datasets';
data = {
    'testoutrank', ...
    'ball1', ...
    'testCD', ...
    'runningex1k', ...
    'testCDST2', ...
    'testCDST3', ...
    'testCDST', ...
    'runningex10k', ...
    'runningex20k', ...
    'segmentation', ...
    'runningex30k', ...
    'pendigits', ...
    'runningex40k', ...
    'spam_train', ...
    'runningex50k', ...
    'spam', ...
    'letter-recognition', ...
    'mesh_network', ...
    'magicgamma', ...
    'musk', ...
    'connect4', ...
};

% Each data set will be profiled with each of the following profiles.
profiles = [
    struct('name', 'original',         'func', 'TopN_Outlier_Pruning_Block_ORIGINAL'), ...
    struct('name', 'original_inline',  'func', 'TopN_Outlier_Pruning_Block_ORIGINAL_INLINE'), ...
    struct('name', 'improved',         'func', 'TopN_Outlier_Pruning_Block_IMPROVED'), ...
    struct('name', 'improved_inline',  'func', 'TopN_Outlier_Pruning_Block_IMPROVED_INLINE'), ...
%    struct('name', 'initial_C',        'func', 'TopN_Outlier_Pruning_Block'), ...
    ];

% Number of iterations for each data set.
iterations = 3;

% The hostname of this machine.
[~, hostname] = system('hostname');

% Get the date
theDate = datestr(now, 'yyyy-mm-dd');

% Root output directory.
profiling_root_dir = strcat('.', filesep, 'Profiling', filesep, hostname, filesep, theDate);
if exist(profiling_root_dir, 'dir') == 7
    rmdir(profiling_root_dir, 's');
end
mkdir(profiling_root_dir);

% Iterate over all data sets.
for d = 1 : length(data)
    dataset      = char(data(d));
    dataset_file = strcat(data_dir, filesep, dataset, '.csv');
    output_dir   = strcat(profiling_root_dir, filesep, dataset);
    if exist(output_dir, 'dir') ~= 7
        mkdir(output_dir);
    end
    
    % Iterate over all iterations.
    for j = 1 : iterations
        iter_output_dir = strcat(output_dir, filesep, int2str(j));
        if exist(iter_output_dir, 'dir') ~= 7
            mkdir(iter_output_dir);
        end
    
        % Randomize data.
        randomness_file = strcat(iter_output_dir, filesep, 'random.mat');
        if exist(randomness_file, 'file') ~= 2
            fprintf('\nRandomizing...\n');
            randnState = randn('state');
            randState = rand('state');
            save(randomness_file, 'randnState', 'randState');
        else
            fprintf('\nUsing randomness from file...\n');
        end
        
        % Iterate over all profiles.
        for k = 1 : length(profiles)
            profile_name       = profiles(k).name;
            profile_func       = profiles(k).func;
            profile_output_dir = strcat(iter_output_dir, filesep, profile_name);
            
            fprintf('\nDate: %s\n', datestr(now));
            fprintf('Data set: "%s"\n', dataset);
            fprintf('Iteration: %d\n', j);
            fprintf('Profile: "%s"\n', profile_name);
            fprintf('Function: "%s"\n', profile_func);
            fprintf('Output directory: "%s"\n', output_dir);
            fprintf('Randomness: "%s"\n', randomness_file);

            % If output_dir already exists, then we don't need to profile anything.
            if exist(profile_output_dir, 'dir') == 7
                fprintf('Skipping as it appears that this data set has been profiled previously.\n');
                continue;
            else
                mkdir(profile_output_dir);
            end

            % Profile execution.
            matlab_command = sprintf('commute_distance_anomaly(''%s'', ''%s'', ''%s'', ''%s'')', dataset_file, randomness_file, profile_func, profile_output_dir);
            fprintf('Running MATLAB command: "%s"\n', matlab_command);
            profile on;
            matlab_output = evalc(matlab_command);
            profile off;
            
            % Save profiler report.
            % NOTE: This throws an error for some reason
            disp('Saving profiler data to "%s".', profile_output_dir);
            try
                profsave(profile('info'), profile_output_dir);
            catch exception
            end

            % Save profile data to a MAT file.
            %p = profile('info');
            %save(char(strcat(profile_output_dir, 'profiledata.mat')), p);
            %clear(p);
            
            % Save MATLAB output to a log file.
            matlab_log_file = strcat(profile_output_dir, filesep, 'matlab_output.log');
            fprintf('Saving MATLAB output to "%s".\n', matlab_log_file);
            fid = fopen(matlab_log_file, 'w');
            fprintf(fid, '%s', matlab_output);
            fclose(fid);
        end
    end
end
