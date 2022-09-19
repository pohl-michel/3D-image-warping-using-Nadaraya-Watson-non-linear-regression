function [ disp_par ] = load_3Ddisplay_parameters(beh_par, im_par)
% Loading parameters concerning the display of the warped images and deformation vector field
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

    disp_par_file = '3Ddisp_par.xlsx';
    opts = detectImportOptions(disp_par_file);
    opts = setvartype(opts,'double');
    opts.DataRange = '2:2'; % pour pouvoir écrire commentaires sur les variables en dessous ds fichier excel
    disp_par = table2struct(readtable(disp_par_file, opts));

    disp_par.OF_res = sprintf('-r%d', int16(disp_par.OF_res));
    disp_par.wrp_im_res = sprintf('-r%d', int16(disp_par.wrp_im_res));

    if beh_par.CROP_FOR_DISP_SAVE
        disp_par.Ycs_after_crop = disp_par.Ycs - (im_par.y_m - 1);
        disp_par.Xcs_after_crop = disp_par.Xcs - (im_par.x_m - 1);
    else
        disp_par.Ycs_after_crop = disp_par.Ycs;
        disp_par.Xcs_after_crop = disp_par.Xcs;
    end

end
