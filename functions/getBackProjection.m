function [x_comp, y_comp] = getBackProjection(input_XYZ, XYZ, wpk, IOPs, lhs)
%GETBACKPROJECTION

if (lhs)
    K=-1;
else
    K=1;
end

w=deg2rad(wpk(1));
p=deg2rad(wpk(2));
k=deg2rad(wpk(3));

R1=[ 1 0 0 ; 0 cos(w) sin(w) ; 0 -sin(w) cos(w) ];
R2=[ cos(p) 0 -sin(p) ; 0 1 0 ; sin(p) 0 cos(p) ];
R3=[ cos(k) sin(k) 0 ; -sin(k) cos(k) 0 ; 0 0 1 ];

M=R3*R2*R1;

% compute UVW
dXYZ=input_XYZ-XYZ.';
UVW=M*dXYZ;

xp=IOPs(1);
yp=IOPs(2);
c=IOPs(3);

x_comp = xp-c*UVW(1)/UVW(3);
y_comp = yp-c*UVW(2)/UVW(3)*K;
end

