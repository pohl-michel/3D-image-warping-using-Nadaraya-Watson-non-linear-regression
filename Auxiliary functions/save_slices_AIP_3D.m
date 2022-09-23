function save_slices_AIP_3D( I, filename_struct, beh_par, disp_par, im_par, display_idx )
% Saves cross sections and average intensity projections of the image I.
% If I represents the warped image, then it is also saved as a 3D dicom image.
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

    enhance_flag = true;

    yslice = transpose(squeeze(I(disp_par.Ycs,:,:)));
    save_crop_enhance_2Dim_jpg(yslice, filename_struct.yslice_filename, beh_par.CROP_FOR_DISP_SAVE, enhance_flag, disp_par, im_par.x_m, im_par.x_M, im_par.z_m, im_par.z_M);

    xslice = transpose(squeeze(I(:,disp_par.Xcs,:)));
    save_crop_enhance_2Dim_jpg(xslice, filename_struct.xslice_filename, beh_par.CROP_FOR_DISP_SAVE, enhance_flag, disp_par, im_par.y_m, im_par.y_M, im_par.z_m, im_par.z_M);        
    
    AIP_ydir = transpose(squeeze(uint16(mean(I, 1)))); % 1 car direction y
    save_crop_enhance_2Dim_jpg(AIP_ydir, filename_struct.AIP_ydir_filename, beh_par.CROP_FOR_DISP_SAVE, enhance_flag, disp_par, im_par.x_m, im_par.x_M, im_par.z_m, im_par.z_M);

    AIP_xdir = transpose(squeeze(uint16(mean(I, 2)))); % 2 car direction x
    save_crop_enhance_2Dim_jpg(AIP_xdir, filename_struct.AIP_xdir_filename, beh_par.CROP_FOR_DISP_SAVE, enhance_flag, disp_par, im_par.y_m, im_par.y_M, im_par.z_m, im_par.z_M);        

    if (display_idx == 2) % if we are saving warped images, we also save the 3D warped image
        save_crop_3Dim_dcm(I, filename_struct.warped3D_im_filename, beh_par.CROP_FOR_DISP_SAVE, im_par);    
    end
    
end

