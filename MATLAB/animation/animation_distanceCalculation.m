function anim = animation_distanceCalculation(anim, outer, inner)   
%    % Highlight inner and outer vectors
%    hold on;
%    plot1 = plot(anim.data(outer,1), anim.data(outer,2), 'Marker', 'x', 'MarkerSize', 10, 'LineWidth', 3, 'Color', 'red');
%    plot2 = plot(anim.data(inner,1), anim.data(inner,2), 'Marker', 'x', 'MarkerSize', 10, 'LineWidth', 3, 'Color', 'yellow');
%    hold off;
%    
%    % Add the new frame to the animation
%    anim = animation_newFrame(anim);
%    
%    % Clean up
%    delete(plot1);
%    delete(plot2);