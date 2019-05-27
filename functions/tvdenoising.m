function outimg = tvdenoising(inimg, varargin)

    %        ep   - epsilon (of gradient regularization) [1],

    %        lam  - fidelity term lambda [0],
    inimg = double(inimg);
    ep = 1; dt = 0.2; lam = 0; I0 = inimg; C = 0; it = 10;

    if length(varargin) > 0
        ep = varargin{1};
    end

    if length(varargin) > 1
        dt = varargin{2};
    end

    if length(varargin) > 2
        lam = varargin{3};
    end

    if length(varargin) > 3
        C = varargin{4};
    end

    if length(varargin) > 4
        it = varargin{5};
    end

    [ny, nx, nz] = size(inimg); ep2 = ep^2;

    for i = 1:it %% do iterations

        img_x_1 = (inimg(:, [2:nx, nx], :) - inimg(:, [1, 1:nx-1], :)) / 2;
        img_y_1 = (inimg([2:ny ny], :, :) - inimg([1, 1:ny-1], :, :)) / 2;
        img_x_2 = inimg(:, [2:nx nx], :) + inimg(:, [1, 1:nx-1], :) - 2 * inimg;
        img_y_2 = inimg([2:ny ny], :, :) + inimg([1, 1:ny-1], :, :) - 2 * inimg;
        dp = inimg([2:ny ny], [2:nx nx], :) + inimg([1, 1:ny-1], [1, 1:nx-1], :);
        dm = inimg([1, 1:ny-1], [2:nx nx], :) + inimg([2:ny ny], [1, 1:nx-1], :);
        img_x_y = (dp - dm) / 4;
        % compute flow
        num_ = img_x_2 .* (ep2 + img_y_1.^2) - 2 * img_x_1 .* img_y_1 .* img_x_y + img_y_2 .* (ep2 + img_x_1.^2);
        den = (ep2 + img_x_1.^2 + img_y_1.^2).^(3/2);
        img_t = num_ ./ den + lam .* (I0 - inimg + C);
        tmp = inimg + dt * img_t; %% evolve image by dt

    end

    outimg = uint8(map2_0_255(tmp));
end
