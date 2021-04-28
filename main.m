clear all; clc
%% run base case
L=10; H=2; alpha=1;D=100;k=1; c0=1;
Nx =100; Ny=50;
x = fem(Nx, Ny, L, H, alpha, D, k , c0);

%%
title_str = sprintf('H=%d, L=%d, alpha=%d, D=%d, k=%d, c0=%d', H, L, alpha, D, k, c0);
drawMesh(x, Nx, Ny, L, H, title_str);