%==========================================================================
% This script saves the output from MATLAB command to a log file in the 
% specified output directory.
%==========================================================================

function save_output(output_dir, text)
    matlab_log_file = strcat(output_dir, filesep, 'matlab_output.log');
    fprintf('Saving MATLAB output to "%s".\n', matlab_log_file);
    fid = fopen(matlab_log_file, 'w');
    fprintf(fid, '%s', text);
    fclose(fid);
