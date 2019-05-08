function display_img(imgs, varargin)
    %
    % display image.
    %
    num_ = length(imgs(:));
    if nargin == 2
        ro = varargin{1};
        co = num_ ./ ro;
    elseif nargin > 2
        ro = varargin{1};
        co = varargin{2};
    end
    
    if nargin == 4
        titles = varargin{3};
    else
        titles = cell(1, num_);
    end
    
    for idx = 1:num_
        subplot(ro, co, idx), imshow(imgs{idx}, []);
        title(titles{idx});
    end

end
