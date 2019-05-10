function [outimg] = window_filter(inimg, f, varargin)
    win = varargin{1};
    inimg = double(inimg);
    outimg = zeros(size(inimg));
    vars = {};
    if length(varargin) > 1
        vars = varargin(2:end);
    end
    for row = 1:size(inimg, 1)
        for col = 1:size(inimg, 2)

            % get neighborhood
            [r1, r2, c1, c2] = neighbor_idx(row, col, win, [size(inimg, 1), size(inimg, 2)]);

            % get the median of the neighbor hood
            mask = inimg(r1:r2, c1:c2, :);
            val_ = zeros(1, 1, size(inimg, 3));
            for i = 1:size(inimg, 3)
                val_(i) = feval(f, mask(:, :, i), vars{:});
            end
            outimg(row, col, :) = val_;
        end
    end
    outimg = uint8(outimg);
end
