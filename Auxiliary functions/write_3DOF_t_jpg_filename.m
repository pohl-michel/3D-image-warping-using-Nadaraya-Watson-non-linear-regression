function [ filename ] = write_3DOF_t_jpg_filename( beh_par, disp_par )
% Returns the name of the image file displaying the projected DVF at time t on a Y cross-section
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

    filename = sprintf('DVF Ycs=%d', disp_par.Ycs);
    if beh_par.CROP_FOR_DISP_SAVE
        filename = sprintf('%s ROI', filename);
    end
    filename = sprintf('%s.jpg', filename);


end

