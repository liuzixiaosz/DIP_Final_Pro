function outimg = adaptive_median_1d(inimg, win, varargin)
    global z_xy z_min z_max z_med;
    orgwin = win;
    outimg = zeros(size(inimg));
    maxwin = floor(size(outimg) / 10);

    if ~isempty(varargin)
        maxwin = varargin{1};
    end

    for row = 1:size(inimg, 1)
        for col = 1:size(inimg, 2)
            win = orgwin;
            val_ = proA();
            outimg(row, col) = val_;
        end
    end
    
    outimg = uint8(outimg);

    function val_ = proA()
        
        % get neighborhood
        [r1, r2, c1, c2] = neighbor_idx(row, col, win, [size(inimg, 1), size(inimg, 2)]);

        % get the median of the neighbor hood
        region = inimg(r1:r2, c1:c2);
        region_1_row = region(:);
        z_min = min(region_1_row);
        z_max = max(region_1_row);
        z_med = median(region_1_row);
        z_xy = inimg(row, col);
        A1 = z_med - z_min;
        A2 = z_med - z_max;
        if (A1 > 0 && A2 < 0)
            val_ = proB();
        else
            flag = 0;

            % enlarge the window
            if win(1) < maxwin(1)
                win(1) = win(1) + 1;
            else
                flag = flag + 1;
            end

            if win(2) < maxwin(2)
                win(2) = win(2) + 1;
            else
                flag = flag + 1;
            end
            
            if flag < 2
                z_med = proA();
            end

            val_ = z_med;
        end

    end

    function val_ = proB()
        B1 = z_xy - z_min;
        B2 = z_xy - z_max;

        if (B1 > 0 && B2 < 0)
            val_ = z_xy;
        else
            val_ = z_med;
        end

    end

end
