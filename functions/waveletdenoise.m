function outimg = waveletdenoise(inimg, varargin)
    inimg = double(inimg);
    [c, l] = wavedec2(inimg, 2, 'coif2');
    n = [1, 2];
    p = [10.12, 23.28];

    if ~isempty(varargin)
        p = varargin{1};
    end

    nc = wthcoef2('h', c, l, n, p, 's');
    outtmp = waverec2(nc, l, 'coif2');
    outimg = uint8(map2_0_255(outtmp));

end
