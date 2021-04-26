function [] = SanityCheck(C, H, L, alpha, D, k)
%     C = C';
    [n_y, n_x] = size(C); % num of nodes
    dx = (L / (n_x - 1)); dy = (H / (n_y - 1));
    
    [g_X, g_Y] = meshgrid(linspace(0,L,n_x),linspace(0,H,n_y)); %global coordinate
    % v(y)
    V_y = alpha * (H^2 / 4 - g_Y.^2);
    % d_c / d_x
    [d_c_d_x, d_c_d_y] = gradient(C, dx, dy);
    div_C = divergence(g_X,g_Y,d_c_d_x,d_c_d_y);
    
    delta_C = V_y .* d_c_d_x - D * div_C + k * C;
    
    figure();
    contourf(delta_C);
    colorbar;
end