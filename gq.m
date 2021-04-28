function [val] = gq(phi1,phi2,phi1_de,phi2_de,v,D,k,J)
% 3 by 3 guassain quadrature
% v: v function
%D,k: parameters
%J: jacobian

Jinv = inv(J);

%% 1 point is the bottom left (-sqrt(3/5),-sqrt(3/5)
%% 9 point is the upper right ( sqrt(3/5), sqrt(3/5)

% 1 point
val1 = v(1)*phi1(-sqrt(3/5),-sqrt(3/5))*(Jinv(1,:)*phi2_de(-sqrt(3/5),-sqrt(3/5)))+...
    D*((Jinv*phi1_de(-sqrt(3/5),-sqrt(3/5)))'*(Jinv*phi2_de(-sqrt(3/5),-sqrt(3/5))))+...
    k*phi1(-sqrt(3/5),-sqrt(3/5))*phi2(-sqrt(3/5),-sqrt(3/5));
val1 = 25/81*det(J)*val1;

% 2 point
val2 = v(1)*phi1(0,-sqrt(3/5))*(Jinv(1,:)*phi2_de(0,-sqrt(3/5)))+...
    D*((Jinv*phi1_de(0,-sqrt(3/5)))'*(Jinv*phi2_de(0,-sqrt(3/5))))+...
    k*phi1(0,-sqrt(3/5))*phi2(0,-sqrt(3/5));
val2 = 40/81*det(J)*val2;

% 3 point
val3 = v(1)*phi1(sqrt(3/5),-sqrt(3/5))*(Jinv(1,:)*phi2_de(sqrt(3/5),-sqrt(3/5)))+...
    D*((Jinv*phi1_de(sqrt(3/5),-sqrt(3/5)))'*(Jinv*phi2_de(sqrt(3/5),-sqrt(3/5))))+...
    k*phi1(sqrt(3/5),-sqrt(3/5))*phi2(sqrt(3/5),-sqrt(3/5));
val3 = 25/81*det(J)*val3;

% 4 point
val4 = v(2)*phi1(-sqrt(3/5),0)*(Jinv(1,:)*phi2_de(-sqrt(3/5),0))+...
    D*((Jinv*phi1_de(-sqrt(3/5),0))'*(Jinv*phi2_de(-sqrt(3/5),0)))+...
    k*phi1(-sqrt(3/5),0)*phi2(-sqrt(3/5),0);
val4 = 40/81*det(J)*val4;

% 5 point
val5 = v(2)*phi1(0,0)*(Jinv(1,:)*phi2_de(0,0))+...
    D*((Jinv*phi1_de(0,0))'*(Jinv*phi2_de(0,0)))+...
    k*phi1(0,0)*phi2(0,0);
val5 = 64/81*det(J)*val5;

% 6 point
val6 = v(2)*phi1(sqrt(3/5),0)*(Jinv(1,:)*phi2_de(sqrt(3/5),0))+...
    D*((Jinv*phi1_de(sqrt(3/5),0))'*(Jinv*phi2_de(sqrt(3/5),0)))+...
    k*phi1(sqrt(3/5),0)*phi2(sqrt(3/5),0);
val6 = 40/81*det(J)*val6;

% 7 point
val7 = v(3)*phi1(-sqrt(3/5),sqrt(3/5))*(Jinv(1,:)*phi2_de(-sqrt(3/5),sqrt(3/5)))+...
    D*((Jinv*phi1_de(-sqrt(3/5),sqrt(3/5)))'*(Jinv*phi2_de(-sqrt(3/5),sqrt(3/5))))+...
    k*phi1(-sqrt(3/5),sqrt(3/5))*phi2(-sqrt(3/5),sqrt(3/5));
val7 = 25/81*det(J)*val7;

% 8 point
val8 = v(3)*phi1(0,sqrt(3/5))*(Jinv(1,:)*phi2_de(0,sqrt(3/5)))+...
    D*((Jinv*phi1_de(0,sqrt(3/5)))'*(Jinv*phi2_de(0,sqrt(3/5))))+...
    k*phi1(0,sqrt(3/5))*phi2(0,sqrt(3/5));
val8 = 40/81*det(J)*val8;

% 9 point
val9 = v(3)*phi1(sqrt(3/5),sqrt(3/5))*(Jinv(1,:)*phi2_de(sqrt(3/5),sqrt(3/5)))+...
    D*((Jinv*phi1_de(sqrt(3/5),sqrt(3/5)))'*(Jinv*phi2_de(sqrt(3/5),sqrt(3/5))))+...
    k*phi1(sqrt(3/5),sqrt(3/5))*phi2(sqrt(3/5),sqrt(3/5));
val9 = 25/81*det(J)*val9;

val = val1+val2+val3+val4+val5+val6+val7+val8+val9;

