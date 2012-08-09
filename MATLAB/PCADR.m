%--------------------------------------------------------------------------
% Robust PCA computation
function [Xnew, total_variance, PC] = PCADR(Xo, dnew, draw)
% transform a d dimensional dataset X into a dnew dimensional space Xnew
% using PCA and MCD
% total_variance = total variance of data on dnew dimensional space

n = size(Xo, 1); % No. of observations
d = size(Xo, 2); % No. of variables

if d == dnew
    Xnew = Xo;
    total_variance = 1;
    return
end

if d>n
    [COEFF,SCORE,latent] = princomp(Xo, 'econ');
else
    [COEFF,SCORE,latent] = princomp(Xo);
end

Xnew = SCORE(:,1:dnew);
PC = COEFF(:,1:dnew);
total_variance = sum(latent(1:dnew))/sum(latent);

% visualization
if nargin==3 && draw == true
    hold on;
    axis equal;
    h = plot(Xnew(:,1), Xnew(:,2), '.r');
    %h = plot3(Xnew(:,1), Xnew(:,2), Xnew(:,3), '.r');
    for i=1:n
        h = text(Xnew(i,1), Xnew(i,2), int2str(i), ...
            'VerticalAlignment','bottom',...
            'HorizontalAlignment','center');
    end
    hold off;
end
%--------------------------------------------------------------------------

