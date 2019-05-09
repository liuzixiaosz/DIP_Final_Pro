function outimg = inverse_filter(inimg, f, n, varargin)
    if ~isempty(varargin)
        r = varargin{1};
        btw_order = 10;
        if length(varargin) > 1
            btw_order = varargin{2};
        end
    else
        r = -1;
        btw_order = -1;
    end
    inimg = double(inimg) - double(n);
    sz = size(inimg);
    m1 = minus1_pow_mtx(sz);
    G = fft2(inimg .* m1);
    [y, x] = meshgrid(1:sz(1), 1:sz(2));
    H = f(x - sz(1) ./ 2, y - sz(2) ./ 2);
    if r ~= -1
        H(((x - sz(1) ./ 2) .^ 2 + (y - sz(2) ./ 2) .^ 2) > (r) .^ 2) = 1;
    end
    if btw_order == -1
        B = 1;
    else
        B = butterworth_lowpass(sz, r, btw_order);
    end
    F_hat = G ./ H;
    F_hat = F_hat .* B;
    outimg = ifft2(F_hat) .* m1;
    outimg = map2_0_255(real(outimg));
%     outimg = cutter(outimg, [rs, cs], sz, [0, 0]);
    outimg = uint8(outimg);
    
end
