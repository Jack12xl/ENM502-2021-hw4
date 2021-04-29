function[err] = FieldL2Err(f1, f2, l, h)
%% L2 distance of fine grid and coarse grid
% f1: coarse grid
% f2: fine grid
% n: one dim of f1

%% for simplicity, we assume 
% 
% * n2 = 2n1 - 1 (no 2d interpolation)
% * field is square
% 
% 

% get the corresponding value on fine grid
    f_tmp = f2(1:2:2*l-1, 1:2:2*h-1);
    
    err_map = (f_tmp - f1).^2;
%     figure();
%     contour(err_map);
%     title_str = sprintf("x grid: %d, y grid: %d", l, h);
%     title(title_str);
%     colorbar;
    err = norm(f_tmp - f1) / (l * h);
end