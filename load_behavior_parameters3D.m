function [ beh_par ] = load_behavior_parameters3D()
% The structure beh_par contains important information about the behavior of the whole algorithm.
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

%% IMPORTANT PARAMETERS

beh_par.SAVE_ORG_IM_SLICES_AIP = true;
    % saving cross-sections and average intensity projections of the original image 

beh_par.SAVE_DVF_JPG = true;
    % saving a cross-section of the deformation vector field

beh_par.CROP_FOR_DISP_SAVE = false;
    % if this parameter is set to true, the deformation vector field and the images to be saved are displayed only around the
    % tumor area, that is to say the area "enclosed" in x_m, x_M, y_m, y_M, z_m, z_M. 

end