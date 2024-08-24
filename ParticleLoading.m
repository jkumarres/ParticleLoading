close all
clear
clc

%================================================================
                                     %
s{1} = stlread("Torus.stl");         %
s{2} = stlread("Knot.stl");          % .stl DATA FILE NAMES
s{3} = stlread("TripleTorus.stl");   %
                                     %
%================================================================
                          % PARAMETERS:
i = 2;                    % - CHOOSE DATA
NParticle = 10000;        % - NUMBER OF PARTICLES TO BE LOADED
                          %
%================================================================
                                 % DATA STRUCTURE
A.V2X = s{i}.Points;             % - MAPS VERTEX # TO COORDINATES
A.T2V = s{i}.ConnectivityList;   % - MAPS TRIANGLE # TO VERTEX #
                                 %
%================================================================
                             %
A.nV = length(A.V2X(:,1));   % - NUMBER OF VERTICES
A.nT = length(A.T2V(:,1));   % - NUMBER OF TRIANGLES
                             %
%================================================================
                                                  %
figure;                                           %
trisurf(A.T2V,A.V2X(:,1),A.V2X(:,2),A.V2X(:,3));  % VISUALIZE THE
axis equal;                                       % SURFACE
title('stl Data')                                 %
                                                  %
%================================================================
                       %
A = Get_T2A( A );      % Area of triangles
                       %
%================================================================
                            %
TotalArea = sum( A.T2A );   %
                            %
%================================================================
                                                        %
A.T2NParticle = round( NParticle * A.T2A / TotalArea ); % - PARTICLES IN EACH TRIANGLE
TotalParticle = sum(A.T2NParticle);                     % - TOTAL PARTICLES
                                                        %
%================================================================
                                         %
Xp = [];                                 %
                                         %
for iT = 1 : A.nT                        %
                                         %
    r1 = rand( A.T2NParticle(iT) , 1 );  %
    r2 = rand( A.T2NParticle(iT) , 1 );  %
                                         %
    r3 = sqrt(r2);                       %
                                         %
    X1 = A.V2X( A.T2V(iT,1) , : );       % ALGORITHM TO UNIFORMLY
    X2 = A.V2X( A.T2V(iT,2) , : );       % DISTRIBUTE PARTICLES
    X3 = A.V2X( A.T2V(iT,3) , : );       % IN A TRIANGLE
                                         %
    a = (1-r3);                          %
    b = (1-r1).*r3;                      %
    c = r1.*r3;                          %
                                         %
    Xp = [ Xp ; (a*X1+b*X2+c*X3) ];      %
                                         %
end                                      %
                                         %
%=========================================================
                                     %
figure;                              %
plot3(Xp(:,1),Xp(:,2),Xp(:,3),'.');  % VISUALIZING THE PARTICLES
axis equal;                          %
                                     %
%=========================================================