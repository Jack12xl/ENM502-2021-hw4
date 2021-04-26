function [val] = findK(H,alpha,D,k,dy,J,p2,i)

% dx: x size of the element unit
% dy: y size of the element unit
%J: jacobian
%p2: y coordinte of center in (x,y) coordinate
%i: the index of K_{ij}

phi1 = @(x,y) 0.25*(1-x)*(1-y);
phi2 = @(x,y) 0.25*(1-x)*(1+y);
phi3 = @(x,y) 0.25*(1+x)*(1-y);
phi4 = @(x,y) 0.25*(1+x)*(1+y);

phi1_de = @(x,y) [-0.25*(1-y); -0.25*(1-x)];
phi2_de = @(x,y) [-0.25*(1+y); 0.25*(1-x)];
phi3_de = @(x,y) [0.25*(1-y); -0.25*(1+x)];
phi4_de = @(x,y) [0.25*(1+y); 0.25*(1+x)];

v = [alpha*(H^2/4-(p2-sqrt(3/5)*dy)^2);alpha*(H^2/4-(p2)^2);alpha*(H^2/4-(p2+sqrt(3/5)*dy)^2) ];
switch i
    case 1 % for i = 1, use phi_1 and phi_1
        val = gq(phi1,phi1,phi1_de,phi1_de,v,D,k,J); 
    case 2 % for i = 2, use phi_2 and phi_1
        val = gq(phi2,phi1,phi2_de,phi1_de,v,D,k,J); 
    case 3 % for i = 3, use phi_3 and phi_1
        val = gq(phi3,phi1,phi3_de,phi1_de,v,D,k,J); 
    case 4 % for i = 4, use phi_4 and phi_1
        val = gq(phi4,phi1,phi4_de,phi1_de,v,D,k,J); 
    case 5 % for i = 5, use phi_1 and phi_2
        val = gq(phi1,phi2,phi1_de,phi2_de,v,D,k,J); 
    case 6 % for i = 6, use phi_2 and phi_2
        val = gq(phi2,phi2,phi2_de,phi2_de,v,D,k,J); 
    case 7 % for i = 7, use phi_3 and phi_2
        val = gq(phi3,phi2,phi3_de,phi2_de,v,D,k,J); 
    case 8 % for i = 8, use phi_4 and phi_2
        val = gq(phi4,phi2,phi4_de,phi2_de,v,D,k,J); 
    case 9 % for i = 9, use phi_1 and phi_3
        val = gq(phi1,phi3,phi1_de,phi3_de,v,D,k,J); 
    case 10 % for i = 10, use phi_2 and phi_3
        val = gq(phi2,phi3,phi2_de,phi3_de,v,D,k,J); 
    case 11 % for i = 11, use phi_3 and phi_3
        val = gq(phi3,phi3,phi3_de,phi3_de,v,D,k,J); 
    case 12 % for i = 12, use phi_4 and phi_3
        val = gq(phi4,phi3,phi4_de,phi3_de,v,D,k,J); 
    case 13 % for i = 13, use phi_1 and phi_4
        val = gq(phi1,phi4,phi1_de,phi4_de,v,D,k,J); 
    case 14 % for i = 14, use phi_2 and phi_4
        val = gq(phi2,phi4,phi2_de,phi4_de,v,D,k,J); 
    case 15 % for i = 15, use phi_3 and phi_4
        val = gq(phi3,phi4,phi3_de,phi4_de,v,D,k,J); 
    case 16 % for i = 16, use phi_4 and phi_4
        val = gq(phi4,phi4,phi4_de,phi4_de,v,D,k,J); 
end
        
        
        
        
        
        
        
        
        
        
        
        
        
        