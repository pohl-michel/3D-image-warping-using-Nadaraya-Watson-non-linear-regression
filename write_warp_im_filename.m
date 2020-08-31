function [ im_filename_struct] = write_warp_im_filename(disp_par, warp_par, display_idx )
% Returns the name of the images to be saved (cross sections, average intensity projections and 3D image)
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

    switch(display_idx)
        case 1 % original image
            im_filename_struct.yslice_filename = sprintf('Original image y slice y = %d %s', disp_par.Ycs);
            im_filename_struct.xslice_filename = sprintf('Original image x slice x = %d %s', disp_par.Xcs);
            im_filename_struct.AIP_ydir_filename = sprintf('Original image AIP y direction');
            im_filename_struct.AIP_xdir_filename = sprintf('Original image AIP x direction');            
        case 2 % warped image
            warp_par_str  = sprintf_warp_param( warp_par );
            im_filename_struct.yslice_filename = sprintf('Warped image y slice y = %d %s', disp_par.Ycs, warp_par_str);
            im_filename_struct.xslice_filename = sprintf('Warped image x slice x = %d %s', disp_par.Xcs, warp_par_str);
            im_filename_struct.AIP_ydir_filename = sprintf('Warped image AIP y direction %s', warp_par_str);
            im_filename_struct.AIP_xdir_filename = sprintf('Warped image AIP x direction %s', warp_par_str); 
            im_filename_struct.warped3D_im_filename = sprintf('Warped 3Dimage %s', warp_par_str);

    end
    
end

