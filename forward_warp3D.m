function [Iwarped, im_warp_calc_time] = forward_warp3D(I, u, warp_par)
% forward_warp3D warps forward the 3D image I according to the displacement field u
% using a kernel described in warp_par
%
% Precision :
% u(y,x,z,1) is the x-value of the optical flow and coordinates (x,y,z)
% u(y,x,z,2) is the y-value of the optical flow and coordinates (x,y,z)
% u(y,x,z,3) is the z-value of the optical flow and coordinates (x,y,z)
%
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

    fprintf('Forward warping the optical flow \n');

    [W, L, H] = size(I);
    Iwarped = zeros(W, L, H, 'single');
    ksum = zeros(W, L, H, 'single'); % auxiliary coefficient 
    K = kernel_function3D(warp_par); 
    d = warp_par.filter_dim; % d : half size of the square filter
    [X,Y,Z] = meshgrid(1:(2*d)); % preparing a small coordinate grid fot computing the kernel array used in the gaussian smoothering    
    
    % Selection of a pixel in the image I to be warped ("org" means "arrow origin")
        tic
        for x_org = 1:L
            for y_org = 1:W   
                for z_org = 1:H

                    x_tip = x_org + u(y_org,x_org,z_org,1);
                    y_tip = y_org + u(y_org,x_org,z_org,2);
                    z_tip = z_org + u(y_org,x_org,z_org,3);

                    Ex_tip = floor(x_tip);
                    Ey_tip = floor(y_tip);
                    Ez_tip = floor(z_tip);

                    x_m = max([1, Ex_tip - d + 1]);
                    x_M = min([L, Ex_tip + d]);

                    y_m = max([1, Ey_tip - d + 1]);
                    y_M = min([W, Ey_tip + d]);  

                    z_m = max([1, Ez_tip - d + 1]);
                    z_M = min([H, Ez_tip + d]);

                    if (x_m <= x_M)&&(y_m <= y_M)&&(z_m <= z_M)

                        switch(warp_par.kernel_appl_meth) % kernel application method
                            case 1 % matrix calculus

                                mu_x = x_tip - Ex_tip + d;
                                mu_y = y_tip - Ey_tip + d;
                                mu_z = z_tip - Ez_tip + d;
                                Kloc = K(mu_y, mu_x, mu_z); % loc means "local"

                                Kloc_mat = Kloc(Y,X,Z);

                                if (x_M - x_m + 1 ~= 2*d)||(y_M - y_m + 1 ~= 2*d)||(z_M - z_m + 1 ~= 2*d)
                                    % cropping the kernel matrix is necessary due to the image borders
                                    x_m_kern = x_m - Ex_tip + d;
                                    x_M_kern = x_M - Ex_tip + d;
                                    y_m_kern = y_m - Ey_tip + d;
                                    y_M_kern = y_M - Ey_tip + d;
                                    z_m_kern = z_m - Ez_tip + d;
                                    z_M_kern = z_M - Ez_tip + d;
                                    Kloc_mat = Kloc_mat(y_m_kern:y_M_kern, x_m_kern:x_M_kern, z_m_kern:z_M_kern);
                                end

                                ksum(y_m:y_M, x_m:x_M, z_m:z_M) = ksum(y_m:y_M, x_m:x_M, z_m:z_M) + Kloc_mat;
                                Iwarped(y_m:y_M, x_m:x_M, z_m:z_M) = Iwarped(y_m:y_M, x_m:x_M, z_m:z_M) + I(y_org, x_org, z_org)*Kloc_mat;

                            case 2 % pointwise calculation

                                Kloc = K(y_tip, x_tip, z_tip); % loc means "local"
                                for x = x_m:x_M
                                    for y = y_m:y_M
                                        for z = z_m:z_M
                                            ksum(y,x,z) = ksum(y,x,z) + Kloc(y,x,z);
                                            Iwarped(y,x,z) = Iwarped(y,x,z) + I(y_org, x_org, z_org)*Kloc(y,x,z);
                                        end
                                    end
                                end

                        end

                    end

                end
            end
        end

        ksum(ksum == 0) = 1; % avoiding division by zero
        Iwarped(:, :, :) = floor(Iwarped(:, :, :)./ksum);
        im_warp_calc_time = toc;
    
end


