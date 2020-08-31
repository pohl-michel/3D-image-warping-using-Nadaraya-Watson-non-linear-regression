function save_crop_enhance_2Dim_png(im, im_filename, crop_flag, enhance_flag, disp_par, x_m, x_M, y_m, y_M)
% Saves the 2D image "im" after enhancing it and cropping it if specified.
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

        f = figure;
        im = enhance_2Dim( im, enhance_flag);
        
        if crop_flag
            imshow(im(y_m:y_M, x_m:x_M), []);
            im_filename = sprintf('%s ROI', im_filename);
        else
            imshow(im, []);
        end
            
        im_filename = sprintf('%s.jpg', im_filename);
        
        set(gca,'position',[0 0 1 1],'units','normalized');
        print(im_filename, '-djpeg', disp_par.wrp_im_res);
        close(f);
        
end

