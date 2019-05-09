function display_spctrm(sp)
    % DISPLAYRGB
    %   Detailed explanation goes here

    if length(size(sp)) == 3 && size(sp, 3) == 3
        sp = real(sp);
        r_chan = sp(:, :, 1);
        g_chan = sp(:, :, 2);
        b_chan = sp(:, :, 3);
        imgs = {sp, log(sp - min(sp(:))), r_chan, log(r_chan - min(r_chan(:))) ...
            b_chan, log(b_chan - min(b_chan(:))), g_chan, log(g_chan - min(g_chan(:)))};
        titles = {'Frequency Domain (F)', 'log F', 'R', 'log R', 'G', 'log G', 'B', 'log B'};
        display_img(imgs, 2, 4, titles);
    else
        imgs = {sp, log(sp) - min(sp(:))};
        titles = {'Frequency Domain (F)', 'log F'};
        display_img(imgs, 1, 2, titles);
    end


end
