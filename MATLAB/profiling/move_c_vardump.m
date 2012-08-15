function [] = move_c_vardump(output_dir)
    vardump_file = 'vars.dat';
    if exist(vardump_file, 'file') == 2
        fprintf('Moving C vardump file to "%s".\n', output_dir);
        movefile(vardump_file, strcat(output_dir, filesep));
    end
