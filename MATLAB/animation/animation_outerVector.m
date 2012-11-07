function anim = animation_outerVector(anim, outer)    
    % Highlight outer vector
    if outer ~= anim.last_outer_vector
        hold on;
        plot1 = plot(anim.data(outer,1), anim.data(outer,2), 'Marker', 'x', 'MarkerSize', 10, 'LineWidth', 3, 'Color', 'red');
        hold off;
        anim.last_outer_vector = outer;

        % Add the new frame to the animation
        anim = animation_newFrame(anim);

        % Clean up
        delete(plot1);
    end