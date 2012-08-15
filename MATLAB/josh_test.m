%==========================================================================
% This script is used to test the execution profile of various MATLAB code 
% profiles. The execution time will be profiled using each data set from 
% the "data" array.
%
% Profiling results will be output in the following subdirectory:
%     Testing/${base_dir}/${data_set}/${iteration}/${profile}
%
%==========================================================================

function [] = josh_test(base_dir)
    [data, data_file] = all_datasets;
    allprofiles = all_profiles;
    base_profile = allprofiles(1);
    profiles = allprofiles(2 : size(allprofiles, 2));
    iterations = 3;

    % The name of the file that the "commute_distance_anomaly" script saves  
    % output variables to... from "commute_distance_anomaly.m"
    results_file_name = 'TopN_Outlier_Pruning_Block.mat';
    
    % Root output directory.
    root_dir = 'Testing';
    base_dir = strcat(root_dir, filesep, base_dir);
    if exist(base_dir, 'dir') == 7
        rmdir(base_dir, 's');
    end
    mkdir(base_dir);

    % Number of failed tests.
    num_failures = 0;

    % A small value for comparing doubles.
    eps = 1e-6;

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
            for k = 1 : length(allprofiles)
                profile_name       = allprofiles(k).name;
                profile_func       = allprofiles(k).func;
                profile_output_dir = strcat(iteration_output_dir, filesep, profile_name);
                mkdir(profile_output_dir);
                
                fprintf('\nDate: %s\n', datestr(now));
                fprintf('Data set: "%s"\n', dataset);
                fprintf('Iteration: %d\n', j);
                fprintf('Profile: "%s"\n', profile_name);
                fprintf('Function: "%s"\n', profile_func);
                fprintf('Output directory: "%s"\n', profile_output_dir);
                fprintf('Randomness: "%s"\n', randomness_file);
                
                % Run command.
                fprintf('Running MATLAB command.\n');
                matlab_command = sprintf('commute_distance_anomaly_profiling(''%s'', ''%s'', ''%s'', ''%s'', 0)', dataset_file, randomness_file, profile_func, profile_output_dir);
                matlab_output = evalc(matlab_command);
                
                % Save MATLAB output.
                save_output(profile_output_dir, matlab_output);
                
                % Move C vardump file.
                move_c_vardump(profile_output_dir);
            end
            
            % Compare results.
            base_results_file = strcat(iteration_output_dir, filesep, base_profile.name, filesep, results_file_name);
            base_results = load(base_results_file);

            for k = 1 : length(profiles)
                profile_name = profiles(k).name;
                fprintf('\nComparing results for "%s"...\n', profile_name);
                results_file = strcat(iteration_output_dir, filesep, profile_name, filesep, results_file_name);
                results = load(results_file);
                
                % Compare OF_sum.
                % No pass/fail criteria set.
                var = char('OF_sum');
                fprintf('Checking variable "%s"...\n', var);
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
    else
        fprintf('\n%d tests failed.\n', num_failures);
    end
