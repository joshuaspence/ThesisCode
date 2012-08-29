%==========================================================================
% This script is used to record the execution profile of a MATLAB 
% code profile with varying block sizes. The execution time will be 
% profiled using each data set from the "data" array.
%
% Profiling results will be output in the following subdirectory:
%     Profiling/${base_dir}/${data_set}/${iteration}/${block_size}
%
%==========================================================================

function [] = josh_profile_block_size(base_dir)
    [data, data_file] = all_datasets;
    [~, blocking_profile, nonblocking_profile] = all_profiles;
    block_sizes = all_block_sizes;
    iterations = 1;

    % Root output directory.
    root_dir = 'Profiling';
    base_dir = strcat('.', filesep, root_dir, filesep, base_dir);
    if exist(base_dir, 'dir') == 7
        rmdir(base_dir, 's');
    end
    mkdir(base_dir);

    % Iterate over all data sets.
    for d = 1 : length(data)
        dataset            = char(data(d));
        dataset_file       = char(data_file(d));
        dataset_output_dir = strcat(base_dir, filesep, dataset);
        mkdir(dataset_output_dir);
        
        % Iterate over all iterations.
        for j = 1 : iterations
            iteration_output_dir = strcat(dataset_output_dir, filesep, int2str(j));
            mkdir(iteration_output_dir);
            
            % Randomize data.
            randomness_file = make_randomness(iteration_output_dir);
            
            % Profile without blocking
            profile_output_dir = strcat(iteration_output_dir, filesep, 'no-blocking');
            mkdir(profile_output_dir);
            
            fprintf('\nDate: %s\n', datestr(now));
            fprintf('Data set: "%s"\n', dataset);
            fprintf('Iteration: %d\n', j);
            fprintf('Profile: "%s"\n', nonblocking_profile.name);
            fprintf('Function: "%s"\n', nonblocking_profile.func);
            fprintf('Output directory: "%s"\n', profile_output_dir);
            fprintf('Randomness: "%s"\n', randomness_file);
            
            % Profile execution.
            matlab_command = sprintf('commute_distance_anomaly_profiling(''%s'', ''%s'', ''%s'', ''%s'', %d)', dataset_file, randomness_file, nonblocking_profile.func, profile_output_dir, 0);
            matlab_output  = run_and_profile(matlab_command);
            
            % Save profile.
            save_profile(profile_output_dir);
            
            % Save MATLAB output to a log file.
            save_output(profile_output_dir, matlab_output);
            
            % Move C vardump file.
            move_c_vardump(profile_output_dir);
            
            % Iterate over all block_sizes.
            for k = 1 : length(block_sizes)
                block_size         = block_sizes(k);
                profile_output_dir = strcat(iteration_output_dir, filesep, 'block_size-', int2str(block_size));
                mkdir(profile_output_dir);
                
                fprintf('\nDate: %s\n', datestr(now));
                fprintf('Data set: "%s"\n', dataset);
                fprintf('Iteration: %d\n', j);
                fprintf('Profile: "%s"\n', blocking_profile.name);
                fprintf('Function: "%s"\n', blocking_profile.func);
                fprintf('Block size: %d\n', block_size);
                fprintf('Output directory: "%s"\n', profile_output_dir);
                fprintf('Randomness: "%s"\n', randomness_file);
                
                % Profile execution.
                matlab_command = sprintf('commute_distance_anomaly_profiling(''%s'', ''%s'', ''%s'', ''%s'', %d)', dataset_file, randomness_file, blocking_profile.func, profile_output_dir, block_size);
                matlab_output  = run_and_profile(matlab_command);
                
                % Save profile.
                save_profile(profile_output_dir);
                
                % Save MATLAB output to a log file.
                save_output(profile_output_dir, matlab_output);
                
                % Move C vardump file.
                move_c_vardump(profile_output_dir);
            end
        end
    end
