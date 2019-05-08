function outimg = adaptive_median_3d(inimg, win, varargin)
    sz = size(inimg);
    outimg = uint8(zeros(sz));
    for i = 1:size(inimg, 3)
       outimg(:, :, i) = adaptive_median_1d(inimg(:, :, i), win, varargin{1});
    end
end