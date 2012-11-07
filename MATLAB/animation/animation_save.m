function anim = animation_save(anim)
    if (anim.filecounter >= 0)
        full_filename = strcat(anim.filename, '.', int2str(anim.filecounter), '.gif');
    else
       full_filename = strcat(anim.filename, '.gif');
    end
    
    fprintf('Writing animation to "%s"\n', full_filename);
    imwrite(anim.animation, anim.colour_map, full_filename, 'DelayTime', anim.delay_time, 'LoopCount', anim.loop_count);
    
    % Clear and start again.
    anim.frame_counter = 0;
    anim.animation = zeros(anim.height, anim.width, 1, 1, 'uint8');