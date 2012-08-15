function matlab_output = run_and_profile(cmd)
    fprintf('Running MATLAB command: "%s"\n', cmd);
    profile on;
    matlab_output = evalc(cmd);
    profile off;
