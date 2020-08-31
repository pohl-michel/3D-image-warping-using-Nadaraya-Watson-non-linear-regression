function save_3DOFjpg(beh_par, disp_par, im_par)
% Loads a previously computed deformation vector field (or optical flow),
% and displays its projection on a Y-slice of coordinates disp_par.Ycs
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License
    
    % loading image at time t=1
    
    im3D_t1 = load_crop_3D(beh_par.CROP_FOR_DISP_SAVE, im_par);
    im2D_t1 = enhance_2Dim(transpose(squeeze(im3D_t1(disp_par.Ycs_after_crop, :, :))), true);  
        % the image is cropped if we select a specific region where the optical flow should be displayed (beh_par.CROP_FOR_DISP_SAVE = 1)
        % Transposition because otherwise horizontally will be the Z axis and vertically the X axis
    clear im3D_t1
    [H, L] = size(im2D_t1); 
 
    x = 1:L; % coordinates in the image
    z = 1:H;
    [X,Z] = meshgrid(x,z);
    % the matrices X and Y have the same dimensions : H*L 
    
    % creation of a mask for displaying arrows spaced by dist_vec only.
    G = zeros(H,L);
    i_max = floor((L-1)/disp_par.dist_vec);
    j_max = floor((H-1)/disp_par.dist_vec);
    for i = 0:i_max % x-coordinate / dist_vec
        for j = 0:j_max % y-coordinate / dist_vec
            G(1+j*disp_par.dist_vec,1+i*disp_par.dist_vec) = 1;
        end
    end    
    
    % preparation of the variable containing the 2D optical flow
    u_t_2D = zeros(H, L, 2, 'single');

    % loading the optical flow u_t
    u_t = load_crop_3D_DVF(beh_par.CROP_FOR_DISP_SAVE, im_par);

    % projection of the DVF on the plane Y = Yslice
    u_t_2D(:,:,1) = transpose ( squeeze( u_t(disp_par.Ycs_after_crop, :, :, 1) ) ) ; % 1st component in 2D = X component in 3D
    u_t_2D(:,:,2) = transpose ( squeeze( u_t(disp_par.Ycs_after_crop, :, :, 3) ) ) ; % 2nd component in 2D = Z component in 3D

    f = figure;        
    imshow(im2D_t1, []);      
    set(gcf, 'units','normalized','outerposition',[0 0 1 1]);

    hold on
    quiver(X,Z,disp_par.arrow_scale_factor*(u_t_2D(:,:,1).*G), disp_par.arrow_scale_factor*(u_t_2D(:,:,2).*G), 'Autoscale', 'off', 'linewidth', disp_par.OF_arw_width, ...
        'color', [1 1 1]);
    hold off

    if beh_par.SAVE_DVF_JPG
        filename = write_3DOF_t_jpg_filename( beh_par, disp_par );
        set(gca,'position',[0 0 1 1],'units','normalized');
        set(gcf, 'InvertHardCopy', 'off');
        print(filename, '-djpeg', disp_par.OF_res);
    end

    close(f);
    
end