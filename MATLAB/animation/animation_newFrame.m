function anim = animation_newFrame(anim)
    frame = getframe(anim.figure);
    
    anim.frame_counter = anim.frame_counter + 1;
    anim.animation(:,:,1,anim.frame_counter) = rgb2ind(frame.cdata, anim.colour_map, 'nodither');
    
    fprintf('Plotted animation frame %d\n', anim.frame_counter);
    
    if anim.frame_counter >= 1500
        % Save the animation
        anim.filecounter = 0;
        anim = animation_save(anim);
        
        % Clear and start again.
        anim.frame_counter = 0;
    end