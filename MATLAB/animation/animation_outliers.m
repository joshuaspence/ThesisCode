function anim = animation_outliers(anim, outliers)
    % Remove old outliers
    for i = 1 : size(anim.outliers,2)
        delete(anim.outliers(i));
    end
    
    % Highlight outlier vectors
    hold on;
    for i = 1 : size(outliers,2)
        anim.outliers(i) = plot(anim.data(outliers(i),1), anim.data(outliers(i),2), 'Marker', 'x', 'MarkerSize', 10, 'LineWidth', 3, 'Color', 'green');
    end
    hold off;

    % Add the new frame to the animation
    anim = animation_newFrame(anim);