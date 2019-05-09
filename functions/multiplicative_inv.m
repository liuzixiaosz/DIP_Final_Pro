function outimg = multiplicative_inv(inimg, varargin)
    r = -1; btw_order = -1; n = 0; K = 0; alp = 1;
    H = varargin{1};
    if length(varargin) > 1
        r = varargin{2};
    end
    if length(varargin) > 2
        btw_order = varargin{3};
    end
    if length(varargin) > 3
        n = varargin{4};
    end
    if length(varargin) > 4
        K = varargin{5};
    end
    if length(varargin) > 5
        alp = varargin{6};
    end

    inimg = double(inimg) - double(n);
    sz = size(inimg);
    m1 = minus1_pow_mtx(sz);
    G = fft2(inimg .* m1);
    if r >= 0
        [v, u] = meshgrid(1:sz(2), 1:sz(1));
        H(((u - sz(1) ./ 2) .^ 2 + (v - sz(2) ./ 2) .^ 2) > (r) .^ 2) = 1;
    end
    if btw_order <= -1
        B = 1;
    else
        B = butterworth_lowpass(sz, r, btw_order);
    end
    F_hat = G .* inv_func(H, K, alp);
    F_hat = F_hat .* B;
    outimg = ifft2(F_hat) .* m1;
    outimg = map2_0_255(real(outimg));
    outimg = uint8(outimg);
end
