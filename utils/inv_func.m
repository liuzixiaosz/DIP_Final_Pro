function invH = inv_func(H, K, alp)
    H_ = conj(H);
    H2 = H .* H_;
    invH = (H_ ./ H2) .^ alp .* (H_ ./ (K + H2)) .^ (1 - alp);
end
