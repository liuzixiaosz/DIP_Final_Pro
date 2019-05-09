function H = getH(sz, Hfunc, varargin)
    [v, u] = meshgrid(1:sz(2), 1:sz(1));
    in1 = u - sz(1) ./ 2; in2 = v - sz(2) ./ 2;
    H = feval(Hfunc, in1, in2, varargin{:});
end

