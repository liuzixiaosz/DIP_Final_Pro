function [H] = gaussian_deg(u, v, k, a, b)
    H = k .* exp(-a .* (u .^ 2 + v .^ 2) .^ b);
end

