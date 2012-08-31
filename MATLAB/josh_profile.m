%==========================================================================
% This script is used to record the execution profile of various MATLAB 
% code profiles. The execution time will be profiled using each data set 
% from the "data" array.
%
% Profiling results will be output in the following subdirectory:
%     Profiling/${base_dir}/${data_set}/${iteration}/${profile}
%
%==========================================================================

function josh_profile(base_dir, dataset_dir)
    [data, data_file] = all_datasets(dataset_dir);
    profiles = all_profiles;
    iterations = 3;
    
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
            
            % Iterate over all profiles.
            for k = 1 : length(profiles)
                profile_name       = profiles(k).name;
                profile_func       = profiles(k).func;
                profile_output_dir = strcat(iteration_output_dir, filesep, profile_name);
                mkdir(profile_output_dir);
                
                fprintf('\nDate: %s\n', datestr(now));
                fprintf('Data set: "%s"\n', dataset);
                fprintf('Iteration: %d\n', j);
                fprintf('Profile: "%s"\n', profile_name);
                fprintf('Function: "%s"\n', profile_func);
                fprintf('Output directory: "%s"\n', profile_output_dir);
                fprintf('Randomness: "%s"\n', randomness_file);
                
                % Profile execution.
                matlab_command = sprintf('commute_distance_anomaly_profiling(''%s'', ''%s'', ''%s'', ''%s'', 0)', dataset_file, randomness_file, profile_func, profile_output_dir);
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
