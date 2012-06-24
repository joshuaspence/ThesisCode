% All data sets are assumed to have a CSV extension
data = { 
    'ball1', ...
	'letter-recognition', ...
	'magicgamma', ...
	'mesh_network', ...
	'outrank', ...
	'runningex1k', ...
	'runningex10k', ...
	'runningex20k', ...
	'runningex30k', ...
	'runningex40k', ...
	'runningex50k', ...
	'segmentation', ...
	'spam_train', ...
	'testCD', ...
	'testCDST', ...
	'testCDST2', ...
	'testCDST3', ...
	'testoutrank', ...
	'spam', ...
	'connect4', ...
	'pendigits', ...
	'musk', ...
	};
profiles_func = {
    'TopN_Outlier_Pruning_Block_ORIGINAL', ...
    'TopN_Outlier_Pruning_Block'
    };
profiles_name = {
    'original', ...
    'initial_C'
    };
iterations = 10;
profiling_root_dir = 'Profiling';

% Iterate over all data sets
for d = 1 : length(data)
    dataset      = char(data(d));
    dataset_file = strcat(dataset, '.csv');
    
    % Iterate over all iterations
    for j = 1 : iterations
        rerandomize = true;
        
        % Iterate over all profiler profiles
        for k = 1 : length(profiles_func)
            profile_name = char(profiles_name(k));
            profile_func = char(profiles_func(k));
            output_dir   = strcat(profiling_root_dir, filesep, profile_name, filesep, dataset, filesep, int2str(j));
            
            disp('');
            disp(datestr(now));
            str = sprintf('Processing iteration %d of data set "%s" for profile "%s".\nFunction = "%s"\nOutput directory = "%s"', j, dataset, profile_name, profile_func, output_dir);
            disp(str);

            % If output_dir already exists, then we don't need to profile anything
            if exist(output_dir, 'dir') ~= 0
                disp('Skipping as it appears that this data set has been profiled previously.');
                continue;
            else
                mkdir(output_dir);
            end

            % profile execution
            disp('Running MATLAB command.');
            profile on;
            matlab_command = sprintf('commute_distance_anomaly(''%s'', %d, ''%s'', ''%s'')', dataset_file, rerandomize, profile_func, output_dir);
            matlab_output = evalc(matlab_command);
            profile off;

            rerandomize = false;
            
            % Save profiler report
            % NOTE: This throws an error for some reason
            disp('Saving profiler data.');
            try
                profsave(profile('info'), output_dir);
            catch exception
            end

            % Save profile data to a MAT file
            %p = profile('info');
            %save(char(strcat(output_dir, 'profiledata.mat')), p);
            %clear(p);
            
            % Save MATLAB output
            disp('Saving MATLAB output.');
            fid = fopen(strcat(output_dir, filesep, 'matlab_output.log'), 'w');
            fprintf(fid, '%s', matlab_output);
            fclose(fid);

            % save the graph
            disp('Saving the graph.');
            print('-dpng', strcat(output_dir, 'output.png'));
        end
    end
end
