%==========================================================================
% This script is used to generate a new random state. If a random state 
% already exists at the specified location, then the existing state will be
% used instead.
%==========================================================================

function randomness_file = make_randomness(iteration_output_dir)
    randomness_file = strcat(iteration_output_dir, filesep, 'random.mat');
    if exist(randomness_file, 'file') ~= 2
        fprintf('\nRandomizing...\n');
        randnState = randn('state');
        randState = rand('state');
        save(randomness_file, 'randnState', 'randState');
    else
        fprintf('\nUsing randomness from file...\n');
    end
