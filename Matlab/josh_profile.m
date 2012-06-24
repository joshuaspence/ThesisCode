% All data sets are assumed to have a CSV extension
data = { 
	'testCD',
	'testCDST',
	'testCDST2',
	'testCDST3',
	'testoutrank',
	'spam',
	'connect4',
	'pendigits',
	'musk',
	'ball1',
	'letter-recognition',
	'magicgamma',
	'mesh_network',
	'outrank',
	'runningex1k',
	'runningex10k',
	'runningex20k',
	'runningex30k',
	'runningex40k',
	'runningex50k',
	'segmentation',
	'spam_train'
	};
iterations = 10;
profiling_root_dir = 'Profiling';
profiling_name = 'initial_C';

for d = 1 : length(data)
    dataset = data(d);
    
    for j = 1 : iterations,
        output_dir = char(strcat(profiling_root_dir, filesep, profiling_name, filesep, dataset, filesep, int2str(j), filesep));
        
        % if output_dir already exists, then we don't need to profile
        % anything
        if exists(output_dir, 'dir') ~= 0
            continue;
        end
        
        % profile execution
        profile on;
        commute_distance_anomaly(strcat(dataset, '.csv'));
        profile off;

        % save profiler report
        % this throws an error for some reason
        try
            profsave(profile('info'), output_dir);
        catch exception
        end

        % save profile data to a MAT file
        %p = profile('info');
        %save(char(strcat(output_dir, 'profiledata.mat')), p);
        %clear(p);

        % save variables
        %save(char(strcat(output_dir, 'variables.mat')));
        
        % save the graph
        print('-dpng', strcat(output_dir, 'output.png'));
        
        % delete the output CSV file
        delete('output.csv');
    end
end