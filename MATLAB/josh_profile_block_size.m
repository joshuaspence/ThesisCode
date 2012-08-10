%==========================================================================
% This script is used to record the execution profile of a MATLAB 
% code profile with varying block sizes. The execution time will be 
% profiled using each data set from the "data" array.
%
% Profiling results will be output in the following subdirectory:
%     {output_dir}/{hostname}/{date:yyyy-mm-dd}/...
%
%==========================================================================

% All data sets are assumed to have a CSV extension
% Note: Data sets are listed here in increasing order of size, so that the 
% script produces as many results as quickly as possible. The command used 
% to do this is `du *.csv | sort -n | awk '{print $2}'`.
output_dir = strcat('.', filesep, 'Profiling');
data_dir   = strcat('.', filesep, 'Datasets');
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

% Each data set will be profiled with the following profile.
blocking_profile    = struct('name', 'C_sorted',      'func', 'TopN_Outlier_Pruning_Block_C_SORTED');
nonblocking_profile = struct('name', 'C_no_blocking', 'func', 'TopN_Outlier_Pruning_Block_C_NO_BLOCKING');

% Each data set will be profiled with the following block sizes.
%block_sizes = [1 10 40 100 1000 10000];
block_sizes = [1 10 15 30 40 45 60 90 100 1000 10000 100000 1000000];

% Number of iterations for each data set.
iterations = 3;

% The hostname of this machine.
[~, hostname] = system('hostname');

% Get the date.
theDate = datestr(now, 'yyyy-mm-dd');

% Root output directory.
profiling_root_dir = strcat(output_dir, filesep, hostname, filesep, theDate);
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
        
        % Profile without blocking
        profile_output_dir = strcat(iter_output_dir, filesep, 'no-blocking');
        
        fprintf('\nDate: %s\n', datestr(now));
        fprintf('Data set: "%s"\n', dataset);
        fprintf('Iteration: %d\n', j);
        fprintf('Profile: "%s"\n', nonblocking_profile.name);
        fprintf('Function: "%s"\n', nonblocking_profile.func);
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
        matlab_command = sprintf('commute_distance_anomaly_profiling(''%s'', ''%s'', ''%s'', ''%s'', %d)', dataset_file, randomness_file, nonblocking_profile.func, profile_output_dir, 0);
        fprintf('Running MATLAB command: "%s"\n', matlab_command);
        profile on;
        matlab_output = evalc(matlab_command);
        profile off;
        
        % Save profiler report.
        % NOTE: This throws an error for some reason (hence the try/catch).
        fprintf('Saving profiler data to "%s".\n', profile_output_dir);
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
        
        % Iterate over all block_sizes.
        for k = 1 : length(block_sizes)
            block_size         = block_sizes(k);
            profile_output_dir = strcat(iter_output_dir, filesep, 'block_size-', int2str(block_size));
            
            fprintf('\nDate: %s\n', datestr(now));
            fprintf('Data set: "%s"\n', dataset);
            fprintf('Iteration: %d\n', j);
            fprintf('Profile: "%s"\n', blocking_profile.name);
            fprintf('Function: "%s"\n', blocking_profile.func);
            fprintf('Block size: %d\n', block_size);
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
            matlab_command = sprintf('commute_distance_anomaly_profiling(''%s'', ''%s'', ''%s'', ''%s'', %d)', dataset_file, randomness_file, blocking_profile.func, profile_output_dir, block_size);
            fprintf('Running MATLAB command: "%s"\n', matlab_command);
            profile on;
            matlab_output = evalc(matlab_command);
            profile off;
            
            % Save profiler report.
            % NOTE: This throws an error for some reason (hence the try/catch).
            fprintf('Saving profiler data to "%s".\n', profile_output_dir);
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
            
            % Move C vardump file.
            vardump_file = 'vars.dat';
            if exist(vardump_file, 'file') == 2
                fprintf('Moving C vardump file to "%s".\n', profile_output_dir);
                movefile(vardump_file, strcat(profile_output_dir, filesep));
            end
        end
    end
end
