function [H] = linear_motion_deg(u, v, T, a, b)
    X = pi .* (a .* u + b .* v);
    X(X == 0) = 1e-5;
    H = (T ./ X) .* sin(X) .* exp(-1i .* X);
end

