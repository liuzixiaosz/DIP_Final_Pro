function [H] = gaussian_noise(x, y, k, a, b)
    H = k .* exp(-a .* (x .^ 2 + y .^ 2) .^ b);
end

