function outval = contraharmonic_mean(inval, varargin)
    if isempty(varargin)
        order_ = 1;
    else
        order_ = varargin{1};
    end
    outval = sum(inval(:) .^ (order_ + 1)) ./ sum(inval(:) .^ (order_));
end