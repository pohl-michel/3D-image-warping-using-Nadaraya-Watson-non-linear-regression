function [ u_t ] = load_crop_3D_DVF(CROP, im_par)
% Loads and crops (if specified) a 3D deformation vector field
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

    OF_t_filename = 'DVF_for_warping.mat';
    load(OF_t_filename, 'u_t');
    
    if CROP
        v_temp = u_t(im_par.y_m:im_par.y_M, im_par.x_m:im_par.x_M, im_par.z_m:im_par.z_M,:);
        u_t = v_temp;
    end

end