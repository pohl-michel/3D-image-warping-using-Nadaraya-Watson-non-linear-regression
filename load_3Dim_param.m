function [ im_par ] = load_3Dim_param()
% Loading parameters concerning the image to be warped
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

im_par_file = '3Dim_seq_par.xlsx';
opts = detectImportOptions(im_par_file);
opts.DataRange = '2:2'; % pour pouvoir écrire commentaires sur les variables en dessous ds fichier excel
im_par = table2struct(readtable(im_par_file, opts));

end

