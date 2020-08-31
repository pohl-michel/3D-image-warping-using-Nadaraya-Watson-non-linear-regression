function save_crop_3Dim_dcm(im, im_filename, crop_flag, im_par)
% Saves the 3D image "im" after cropping it if specified.
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License
        
        if crop_flag
            im = im(im_par.y_m:im_par.y_M, im_par.x_m:im_par.x_M, im_par.z_m:im_par.z_M);
            l = im_par.x_M - im_par.x_m + 1;            
            w = im_par.y_M - im_par.y_m + 1;
            h = im_par.z_M - im_par.z_m + 1;
        else
            l = im_par.L;            
            w = im_par.W;
            h = im_par.H;            
        end
        
        im_filename = sprintf('%s.dcm', im_filename);
        
        dicomwrite(reshape(uint16(im),[w,l,1,h]),im_filename);
        
end
