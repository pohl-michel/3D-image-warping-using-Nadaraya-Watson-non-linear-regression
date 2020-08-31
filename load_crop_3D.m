function [ im ] = load_crop_3D(CROP, im_par)
% Returns the image to be warped.
% The image is cropped if specified in the behavior parameters.
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

    im_filename = 'original_image.dcm';
    im = single(squeeze(dicomread(im_filename)));
        % squeeze is necessary because when Matlab opens a 3D image with dicomread the 3rd dimension is a singleton
    
    if CROP
        im = im(im_par.y_m:im_par.y_M, im_par.x_m:im_par.x_M, im_par.z_m:im_par.z_M);
    end

end