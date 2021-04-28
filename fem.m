function [x] = fem(Nx, Ny, L, H, alpha, D, k, c0)
    
    
    % change  coordinates x = dx*xi & y = dy*eta
    dx = L/Nx/2; dy = H/Ny/2;
    % grid points
    Nxx = Nx+1; Nyy = Ny+1;
    % Jacobi
    J =[dx 0; 0 dy];

     % label the corodinates 
    M_el = reshape(1:(Nx*Ny), Ny,[]);
    M_coor = reshape(1:(Nxx*Nyy),Nyy,[]);
    LtoG = zeros(Nx*Ny, 4);

    % for i=1:numel(M_el)
    %     [a,b] = find(M_el==i);
    for b = 1:Nx
        for a = 1:Ny
            i = (b - 1) * Ny + a;
            LtoG(i,:) = reshape(M_coor(a:a+1,b:b+1),1,[]);
        end
    end
    K = zeros(numel(M_el),16);
    % for i = 1:numel(M_el)
    %     [a, b] = find(M_el==i);
    for b = 1:Nx
        for a = 1:Ny
            i = (b - 1) * Ny + a;
            p1 = (b-1/2)*dx; p2 = (a-1/2)*2*dy-H/2; % find coordinate of (x,y)=(p1,p2)
            for j = 1:16
                K(i,j) = findK(H,alpha,D,k,dy,J,p2,j);
            end
        end
    end

    A = zeros(numel(M_coor));
    for i = 1:numel(M_el)
        A(LtoG(i,:),LtoG(i,:)) = A(LtoG(i,:),LtoG(i,:))+reshape(K(i,:),4,4);
    end

    b = zeros(numel(M_coor),1);

    % right = M_coor(:,end);
    % for i = 1:length(right)
    %     n = right(i);
    %     A(n,:) = 0;
    %     A(n,n) = 1;
    %     b(n) = 0;
    % end
    % down = M_coor(1,:);
    % for i = 1:length(down)
    %     n = down(i);
    %     A(n,:) = 0;
    %     A(n,n) = 1;
    %     b(n) = 0;
    % end
    % up = M_coor(end,:);
    % for i = 1:length(up)
    %     n = up(i);
    %     A(n,:) = 0;
    %     A(n,n) = 1;
    %     b(n) = 0;
    % end
    left = M_coor(:,1);
    for i = 1:length(left)
        n = left(i);
        A(n,:) = 0;
        A(n,n) = 1;
        b(n) = c0;
    end
    x = A\b;
end
% [xx,yy]=meshgrid(linspace(0,L,Nxx),linspace(0,H,Nyy));
% zz = reshape(x,Nyy,[]);
% %%
% figure();
% mesh(xx,yy,zz)
% xlabel('x', 'Rotation',20)
% ylabel('y', 'Rotation',-30)
% zlabel('C(concentration)')
% title_str = sprintf('H=%d, L=%d, alpha=%d, D=%d, k=%d', H, L, alpha, D, k);
% title(title_str);
% %%
% SanityCheck(zz, H, L, alpha, D, k);
