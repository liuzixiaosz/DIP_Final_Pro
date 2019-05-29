function outimg = anisotropic_diffusion(inimg, varargin)

    k = 15; lambda = 0.15; iters = 20;

    if length(varargin) > 0
        k = varargin{1};
    end

    if length(varargin) > 1
        lambda = varargin{2};
    end

    if length(varargin) > 2
        iters = varargin{3};
    end

    img = double(inimg);
    [a, b, c] = size(img);

    imgn = zeros(a, b, c);

    for i = 1:iters

        for p = 2:a - 1

            for q = 2:b - 1

                NI = img(p - 1, q, :) - img(p, q, :);
                SI = img(p + 1, q, :) - img(p, q, :);
                EI = img(p, q - 1, :) - img(p, q, :);
                WI = img(p, q + 1, :) - img(p, q, :);

                cN = exp(-NI.^2 / k.^2);
                cS = exp(-SI.^2 / k.^2);
                cE = exp(-EI.^2 / k.^2);
                cW = exp(-WI.^2 / k.^2);

                imgn(p, q, :) = img(p, q, :) + lambda * (cN .* NI + cS .* SI + cE .* EI + cW .* WI);
            end

        end
        img = imgn;
    end
    outimg = uint8(map2_0_255(imgn));
end
