function anim = animation_block(anim, block)
    % Remove old block
    for i = 1 : size(anim.block,2)
        delete(anim.block(i));
    end
    
    % Highlight block
    hold on;
    for i = 1 : size(block,2)
        anim.block(i) = plot(anim.data(block(i),1), anim.data(block(i),2), 'Marker', 'x', 'MarkerSize', 10, 'LineWidth', 3, 'Color', 'red');
    end
    hold off;

    % Add the new frame to the animation
    anim = animation_newFrame(anim);