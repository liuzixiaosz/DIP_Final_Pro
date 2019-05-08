function mtx = minus1_pow_mtx(size_)
    % generate the matrix of -1^(m + n), where m, n refer to the subscripts of an element

    mtx = (mod(toeplitz(1:size_(1), 1:size_(2)), 2) - 0.5) * 2;
end
