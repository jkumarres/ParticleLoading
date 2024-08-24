close all
clear
clc

%--------------------------------------------

s{1} = stlread("Torus.stl");
s{2} = stlread("Knot.stl");
s{3} = stlread("TripleTorus.stl");

%================================================================

i = 2;
NParticle = 10000;

%================================================================

A.V2X = s{i}.Points;
A.T2V = s{i}.ConnectivityList;

%--------------------------------------------

A.nV = length(A.V2X(:,1));
A.nT = length(A.T2V(:,1));

%================================================================

figure;
trisurf(A.T2V,A.V2X(:,1),A.V2X(:,2),A.V2X(:,3));
axis equal;
title('stl Data')

%================================================================

A = Get_T2A( A );             % Area of triangles

%================================================================

TotalArea = sum( A.T2A );

A.T2NParticle = round( NParticle * A.T2A / TotalArea );
TotalParticle = sum(A.T2NParticle);

%================================================================

Xp = [];

for iT = 1 : A.nT

    r1 = rand( A.T2NParticle(iT) , 1 );
    r2 = rand( A.T2NParticle(iT) , 1 );

    r3 = sqrt(r2);

    X1 = A.V2X( A.T2V(iT,1) , : );
    X2 = A.V2X( A.T2V(iT,2) , : );
    X3 = A.V2X( A.T2V(iT,3) , : );

    a = (1-r3);
    b = (1-r1).*r3;
    c = r1.*r3;

    Xp = [ Xp ; (a*X1+b*X2+c*X3) ];

end

%=========================================================

figure;
plot3(Xp(:,1),Xp(:,2),Xp(:,3),'.');
axis equal;