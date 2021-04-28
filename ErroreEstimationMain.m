clear all; clc
%% run base case
L=10; H=2; alpha=1;D=1;k=1; c0=1;

for i = 1:1:10
    Nx = 10 * i; Ny = 5 * i;
    coarse_x = fem(Nx, Ny, L, H, alpha, D, k , c0);
    coarse_x = reshape(coarse_x, Nx+1, []);
    %%
    fine_x = fem(2*Nx, 2*Ny, L, H, alpha, D, k , c0);
    fine_x = reshape(fine_x, 2*Nx+1, []);
    %% 
    err(i) = FieldL2Err(coarse_x, fine_x, Nx+1, Ny+1);
    
end


%%
figure();
log_x = log(10:10:100);
log_y = log(err);

p2 = polyfit(log_x, log_y, 2);
f2 = polyval(p2, log_x);

plot(log_x, log_y, '-o', log_x, f2, '-');

txt2 = ['y = (' num2str(p2(1)) ')x+ (' num2str(p2(2)) ')'];
text(log_x(3), log_y(3), txt2);

legend('log error vs log dimension','1nd degree fit')

xlabel('log dimension') 
ylabel('log error ')

title_str = sprintf('Error Evluation between fine and coarse grid');
title(title_str)
