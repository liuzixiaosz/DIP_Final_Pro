function invH = inv_func(H, k, alp)
    a = 1;
    H_ = conj(H);
    H2 = H .* H_;
    invH = (H ./ H2) .^ alp .* (H ./ (K + H2)) .^ (1 - alp);
end
