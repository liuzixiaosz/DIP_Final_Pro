function outimg = adaptive_median_3d(inimg, varargin)
    sz = size(inimg);
    outimg = uint8(zeros(sz));
    for i = 1:size(inimg, 3)
       outimg(:, :, i) = adaptive_median_1d(inimg(:, :, i), varargin{1}, varargin{2});
    end
end