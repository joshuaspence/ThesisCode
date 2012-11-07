function anim = animation_outerVector(anim, outer)    
    % Highlight outer vector
    if outer ~= anim.last_outer_vector
        anim.outer_vector_counter = mod(anim.outer_vector_counter + 1, anim.outer_vector_modulo);
        if anim.outer_vector_counter == 0
            hold on;
            plot1 = plot(anim.data(outer,1), anim.data(outer,2), 'Marker', '*', 'MarkerSize', 10, 'LineWidth', 3, 'Color', 'blue');
            hold off;
            anim.last_outer_vector = outer;

            % Add the new frame to the animation
            anim = animation_newFrame(anim);

            % Clean up
            delete(plot1);
        end
    end