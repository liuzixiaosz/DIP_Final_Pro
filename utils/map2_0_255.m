function img = map2_0_255(img0)
    % map value to [0, 255];
    img0 = double(img0);
    min_ = min(img0(:));
    max_ = max(img0(:));
    i_tmp1 = img0 - min_;
    img = i_tmp1 ./ (max_ - min_) * 255;
end

