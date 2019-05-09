classdef ImageRegister
    %IMAGECREATER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        img_path
        img
        org_img
    end
    
    methods
        function obj = ImageRegister(img_path)
            %IMAGECREATER Construct an instance of this class
            %   Detailed explanation goes here
            obj.img_path = img_path;
            obj.img = ImageClass(img_path);
            obj.org_img = ImageClass(img_path);
        end
        
        function p_ = getpath(obj)
            p_ = obj.img_path;
        end

        function imgobj = getimg(obj)
            imgobj = obj.img;
        end
        
        function obj = reset(obj)
            obj.img = obj.org_img;
        end
        
        function obj = newimg(obj, inimg)
            obj.img = ImageClass(inimg);
        end
    end
end

