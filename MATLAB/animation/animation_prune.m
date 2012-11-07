function anim = animation_prune(anim, pruned)
    % Highlight pruned vector
    hold on;
    plot(anim.data(pruned,1), anim.data(pruned,2), 'Marker', 'x', 'MarkerSize', 10, 'LineWidth', 3, 'Color', 'black');
    hold off;

    % Add the new frame to the animation
    anim = animation_newFrame(anim);