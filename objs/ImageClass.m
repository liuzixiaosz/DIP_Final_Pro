classdef ImageClass
    %TESTCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        img_double
        minus_1_pow_mtx
        img_spectrum
        padded_img
        padded_img_spectrum
        padded_rs
        padded_cs
        padded_minus_1_pow_mtx
        img_uint8
        size_
    end
    
    
    methods (Access = public)
        
        function obj = ImageClass(img_info)
            %TESTCLASS Construct an instance of this class
            %   Detailed explanation goes here
            if isa(img_info, 'char')
               img = imread(img_info);
            else
               img = img_info;
            end
            d_img = double(img);
            sz_ = size(d_img);
            obj.img_double = d_img;
            obj.img_uint8 = uint8(d_img);
            obj.minus_1_pow_mtx = minus1_pow_mtx(sz_);
            obj.img_spectrum = fft2(d_img .* obj.minus_1_pow_mtx);
            new_sz = sz_; new_sz(1) = sz_(1) .* 2; new_sz(2) = sz_(2) .* 2;
            [obj.padded_img, obj.padded_rs, obj.padded_cs] = ...
                padval(d_img, new_sz);
            obj.padded_minus_1_pow_mtx = ... 
                minus1_pow_mtx(new_sz);
            obj.padded_img_spectrum = ... 
                fft2(obj.padded_img .* obj.padded_minus_1_pow_mtx);
        end
        
        function i_ = getimg_uint8(obj)
           i_ = obj.img_uint8;
        end
        
        function i_ = getimg_double(obj)
           i_ = obj.img_double;
        end
        
        function i_spectrum = getspectrum(obj)
           i_spectrum = obj.img_spectrum;
        end
        
        function sz = getsize(obj)
           sz = size(obj.img_double);
        end
    end
end

