data = { 
	'testCD.csv',
	'testCDST.csv',
	'testCDST2.csv',
	'testCDST3.csv',
	'testoutrank.csv
	'spam.csv',
	'connect4.csv',
	'pendigits.csv',
	'musk.csv',
	'ball1.csv',
	'letter-recognition.csv',
	'magicgamma.csv',
	'mesh_network.csv',
	'outrank.csv',
	'runningex1k.csv',
	'runningex10k.csv',
	'runningex20k.csv',
	'runningex30k.csv',
	'runningex40k.csv',
	'runningex50k.csv',
	'segmentation.csv',
	'spam_train.csv'
	};
iterations = 10;


for d=1:length(data),
    dataset = data(d);
    
    for j=1:iterations,
        output_dir = char(strcat('Profiling/initial_C/', dataset, '/', int2str(j), '/'));
        
        % profile execution
        profile on;
        commute_distance_anomaly(dataset);
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
    end
end
