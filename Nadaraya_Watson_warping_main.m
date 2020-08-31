% This function deforms an original 3D image according to a certain deformation vector field (DVF).
% The deformation method is based on Nadaraya-Watson regression.
% 
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

clear all
close all
clc

%% PARAMETERS 

% Program behavior
beh_par = load_behavior_parameters3D();

% Parameters for image warping
warp_par = load_3Dwarp_par();

% Image parameters
im_par = load_3Dim_param();

% Display parameters
disp_par = load_3Ddisplay_parameters(beh_par, im_par);


%% ---------------------------------------------------------------------------------------------------------------------------------------------------
%  PROGRAM -------------------------------------------------------------------------------------------------------------------------------------------
%  --------------------------------------------------------------------------------------------------------------------------------------------------- 

if beh_par.SAVE_ORG_IM_SLICES_AIP
    display_idx = 1; % we save the original images
    CROP = false;
    I_init = load_crop_3D(CROP, im_par);
    org_im_filename_struct = write_warp_im_filename(disp_par, warp_par, display_idx);
    save_slices_AIP_3D( I_init, org_im_filename_struct, beh_par, disp_par, im_par, display_idx);    
end

if beh_par.SAVE_DVF_JPG
    save_3DOFjpg(beh_par, disp_par, im_par);
end

CROP = false;
I_init = load_crop_3D(CROP, im_par);
u_t = load_crop_3D_DVF(CROP, im_par);

[Iwarped, im_warp_calc_time] = forward_warp3D(I_init, u_t, warp_par);

display_idx = 2; % warped images
warped_im_filename_struct = write_warp_im_filename(disp_par, warp_par, display_idx);
save_slices_AIP_3D( Iwarped, warped_im_filename_struct, beh_par, disp_par, im_par, display_idx);    