function anim = animation_setup(adj_matrix, data, filename)
    anim.adjacency_matrix = adj_matrix;
    anim.data = data;
    anim.filename = filename;
    anim.filecounter = -1;

    % Create the first frame
    anim.figure = figure('NumberTitle', 'off');
    hold on;
    axis equal;
    anim = animation_plotData(anim);
    hold off;

    % Get figure size.
    pos = get(anim.figure, 'Position');
    anim.width = pos(3);
    anim.height = pos(4);

    % Preallocate data (for storing frame data).
    anim.animation = zeros(anim.height, anim.width, 1, 1, 'uint8');

    % Create a colourmap for the plots.
    anim.colour_map = [hsv(256-32); gray(32)];

    % Add the new frame to the animation.
    anim.frame_counter = 0;
    anim = animation_newFrame(anim);
    
    % Initialise stuff.
    anim.block = [];
    anim.outliers = [];
    anim.last_outer_vector = 0;
    anim.outer_vector_plot = plot([],[]);
    anim.outer_vector_counter = 0;
    
    % Configuration
    anim.outer_vector_modulo = 1; % round(size(anim.data,1) / 10);
    anim.delay_time = 0;
    anim.loop_count = 0;