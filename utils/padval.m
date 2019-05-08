function [outmtx, rs, cs] = padval(inmtx, size_mtx, varargin)
    % pad 0, and the data is in the center
    if isempty(varargin)
        val_ = 0;
    else
        val_ = varargin{1};
    end
    [r1, c1, dim] = size(inmtx);
    r2 = size_mtx(1);
    c2 = size_mtx(2);
    outmtx = val_ .* ones(r2, c2, dim);
    mid_row = ceil((r2 + 1) / 2);
    mid_col = ceil((c2 + 1) / 2);
    rs = mid_row - floor(r1 / 2);
    cs = mid_col - floor(r1 / 2);
    outmtx(rs:rs + r1 - 1, cs:cs + c1 - 1, :) = inmtx;
end
