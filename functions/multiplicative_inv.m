function outimg = multiplicative_inv(inimg, f_, inv_func, varargin)
    n = 0; r = -1; btw_order = -1; k = 0; alp = 1
    if ~isempty(varargin)
        r = varargin{1};
        btw_order = 10;
        if length(varargin) > 1
            btw_order = varargin{2};
        end
        if length(varargin) > 2
            n = varargin{3};
        end
        if length(varargin) > 3
            k = varargin{4};
        end
        if length(varargin) > 4
            alp = varargin{5};
        end
    end

    inimg = double(inimg) - double(n);
    sz = size(inimg);
    m1 = minus1_pow_mtx(sz);
    G = fft2(inimg .* m1);
    [y, x] = meshgrid(1:sz(1), 1:sz(2));
    H = f_(x - sz(1) ./ 2, y - sz(2) ./ 2, k, alp);
    if r ~= -1
        H(((x - sz(1) ./ 2) .^ 2 + (y - sz(2) ./ 2) .^ 2) > (r) .^ 2) = 1;
    end
    if btw_order == -1
        B = 1;
    else
        B = butterworth_lowpass(sz, r, btw_order);
    end
    F_hat = G .* inv_func(H);
    F_hat = F_hat .* B;
    outimg = ifft2(F_hat) .* m1;
    outimg = map2_0_255(real(outimg));
    outimg = uint8(outimg);
    
end
