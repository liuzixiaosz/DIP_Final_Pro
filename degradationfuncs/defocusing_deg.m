function H = defocusing_deg(x, y, R)
    m1_pow = minus1_pow_mtx(size(x));
    x2y2 = (x .^ 2 + y .^ 2);
    h = 1 ./ (pi .* R) .* ones(size(x));
    h(x2y2 >= R .^ 2) = 0;
    H = fft2(h .* m1_pow);
%     H = H - real(H);
    H = H .* m1_pow;
end

