clear all; clc
L=10; H=2; alpha=1;D=1;k=1; c0=1;
Nx =100; Ny=50;
% change  coordinates x = dx*xi & y = dy*eta
dx = L/Nx/2; dy = H/Ny/2;
% grid points
Nxx = Nx+1; Nyy = Ny+1;
% Jacobi
J =[dx 0; 0 dy];

 % label the corodinates 
M_el = reshape(1:(Nx*Ny), Ny,[]);
M_coor = reshape(1:(Nxx*Nyy),Nyy,[]);
LtoG = [];
for i=1:numel(M_el)
    [a,b] = find(M_el==i);
    LtoG(i,:) = reshape(M_coor(a:a+1,b:b+1),1,[]);
end
K = zeros(numel(M_el),16);
for i = 1:numel(M_el)
    [a, b] = find(M_el==i);
    p1 = (b-1/2)*dx; p2 = (a-1/2)*dy; % find coordinate of (x,y)=(p1,p2)
    for j = 1:16
        K(i,j) = findK(H,alpha,D,k,dy,J,p2,j);
    end
end

A = zeros(numel(M_coor));
for i = 1:numel(M_el)
    A(LtoG(i,:),LtoG(i,:)) = A(LtoG(i,:),LtoG(i,:))+reshape(K(i,:),4,4);
end

b = zeros(numel(M_coor),1);
left = M_coor(:,1);
for i = 1:length(left)
    n = left(i);
    A(n,:) = 0;
    A(n,n) = 1;
    b(n) = c0;
end
right = M_coor(:,end);
for i = 1:length(right)
    n = right(i);
%     A(n,:) = 0;
%     A(n,n) = 1;
    b(n) = 0;
end
down = M_coor(1,:);
for i = 1:length(down)
    n = down(i);
    A(n,:) = 0;
    A(n,n) = 1;
    b(n) = 0;
end
up = M_coor(end,:);
for i = 1:length(up)
    n = up(i);
    A(n,:) = 0;
    A(n,n) = 1;
    b(n) = 0;
end

x = A\b;
[xx,yy]=meshgrid(linspace(0,L,Nxx),linspace(0,H,Nyy));
zz = reshape(x,Nyy,[]);
mesh(xx,yy,zz)






