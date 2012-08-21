%==========================================================================
% This script runs a MATLAB command and profiles the command using the 
% MATLAB profiler. This script returns the standard output from the MATLAB
% command.
%==========================================================================

function matlab_output = run_and_profile(cmd)
    fprintf('Running MATLAB command: "%s"\n', cmd);
    profile on;
    matlab_output = evalc(cmd);
    profile off;
