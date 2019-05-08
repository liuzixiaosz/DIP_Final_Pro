function [r_lo, r_hi, c_lo, c_hi] = neighbor_idx(row, col, n_size, max_)
    % This function gets the index of the pixel of the neighborhood 

    width_ = n_size(1);
    height_ = n_size(2);
    max_row = max_(1);
    max_col = max_(2);
    delta_w = floor((width_ - 1) / 2);
    delta_h = floor((height_ - 1) / 2);
    r_lo = row - delta_w;
    r_hi = row + delta_w;
    c_lo = col - delta_h;
    c_hi = col + delta_h;

    % checkout situations when the center is at sides or the coners
    if r_lo < 1
        r_lo = 1;
    end
    if r_hi > max_row
        r_hi = max_row;
    end
    if c_lo < 1
        c_lo = 1;
    end
    if c_hi > max_col
        c_hi = max_col;
    end
end
