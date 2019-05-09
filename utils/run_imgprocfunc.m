function outimg = run_imgprocfunc(func_, img0, varargin)
    varargin = varargin{1};
    paramstr = 'func_(img0, ';
    for i = 1:length(varargin) - 1
        paramstr = strcat(paramstr, mat2str(varargin{i}), ',');
    end
    paramstr = strcat(paramstr, mat2str(varargin{end}), ')');
    outimg = eval(paramstr);
end