%==========================================================================
% This script moves the C variable dump file, if one exists.
%==========================================================================

function move_c_vardump(output_dir)
    vardump_file = strcat('.', filesep, 'vars.dat');
    if exist(vardump_file, 'file') == 2	
        fprintf('Moving C vardump file to "%s/%s".\n', output_dir, vardump_file);
        movefile(vardump_file, strcat(output_dir, filesep));
    end
