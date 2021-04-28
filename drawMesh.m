function [] = drawMesh(X, Nx, Ny, L, H, title_str)
    [xx,yy]=meshgrid(linspace(0,L,Nx+1),linspace(-H/2,H/2,Ny+1));
    zz = reshape(X,Ny+1,[]);
    
    figure();
    mesh(xx,yy,zz)
    xlabel('x', 'Rotation',20)
    ylabel('y', 'Rotation',-30)
    zlabel('C(concentration)')
%     title_str = sprintf('H=%d, L=%d, alpha=%d, D=%d, k=%d, c0=%d', H, L, alpha, D, k);
    title(title_str);
end