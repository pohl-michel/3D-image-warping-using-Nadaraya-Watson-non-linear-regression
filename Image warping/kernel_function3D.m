function [ K ] = kernel_function3D( warp_par )
% returns a function handle corresponding to a kernel function, used in forward warping
% filter_dim is the half size of the square filter
% 
% Author : Pohl Michel
% Date : August 31st, 2020
% Version : v1.0
% License : 3-clause BSD License

    switch(warp_par.kernel_idx)
        
        case 1 % gaussian filter
            C = 1/(2*(warp_par.sg_fw_wrp^2)); % constant computed in advance for making the calculations faster
            K = @(mu_y, mu_x, mu_z) @(y,x,z) exp(-C*((x-mu_x).^2 + (y-mu_y).^2 + (z-mu_z).^2));  
            
        case 2 % average filter
            K = @(mu_y, mu_x, mu_z) @(y,x,z) ones(size(y,1), size(x,1), size(z,1), 'single'); 
            % K = @(mu_y, mu_x, mu_z) @(y,x,z) 1 does not work properly
    end

end

