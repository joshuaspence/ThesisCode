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
    dataset = data(d);
    
    % Iterate over all iterations
    for j = 1 : iterations
        rerandomize = true;
        
        % Iterate over all profiler profiles
        for k = 1 : length(profiles_func)
            profile_name = profiles_name(k);
            profile_func = profiles_func(k);

            output_dir = char(strcat(profiling_root_dir, filesep, profile_name, filesep, dataset, filesep, int2str(j), filesep));
            
            str = sprintf('Processing iteration %d of data set "%s" for profile "%s".\nTo be executed using function "%s"\nTo be output to directory "%s"', j, char(dataset), char(profile_name), char(profile_func), output_dir);
            disp(str);

            % if output_dir already exists, then we don't need to profile
            % anything
            if exist(output_dir, 'dir') ~= 0
                disp('Skipping as it appears that this data set has been profiled previously.');
                continue;
            end

            % profile execution
            profile on;
            evalc(commute_distance_anomaly(strcat(dataset, '.csv'), rerandomize, profile_func));
            profile off;

            rerandomize = false;
            
            % Save profiler report
            % NOTE: This throws an error for some reason
            try
                profsave(profile('info'), output_dir);
            catch exception
            end

            % Save profile data to a MAT file
            %p = profile('info');
            %save(char(strcat(output_dir, 'profiledata.mat')), p);
            %clear(p);

            % save variables
            copyfile('output.csv', output_dir);
            copyfile('random.mat', output_dir);
            copyfile('variables.mat', output_dir);
            copyfile('variables.txt', output_dir);

            % save the graph
            print('-dpng', strcat(output_dir, 'output.png'));

            % delete the output CSV file
            delete('output.csv', 'variables.mat', 'variables.txt');
        end
    end
end
