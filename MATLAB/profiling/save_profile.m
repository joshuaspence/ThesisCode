function [] = save_profile(output_dir)
    % NOTE: This throws an error for some reason (hence the try/catch).
    fprintf('Saving profiler data to "%s".\n', output_dir);
    try
        profsave(profile('info'), output_dir);
    catch exception
    end
    
    % Save profile data to a MAT file.
    %p = profile('info');
    %save(char(strcat(output_dir, 'profiledata.mat')), p);
    %clear(p);
