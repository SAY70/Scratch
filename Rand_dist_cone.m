% Define the parameters of the conical structure
radius = 5;  % radius of the base of the cone
height = 10; % height of the cone

% Generate random points within the bounding box of the inverted cone
n = 1000;    % number of particles
x = 2 * radius * (rand(n, 1) - 0.5); % x coordinates
y = 2 * radius * (rand(n, 1) - 0.5); % y coordinates
z = height - height * rand(n, 1);     % z coordinates (inverted)

% Filter out the points that are outside the inverted cone
r = sqrt(x.^2 + y.^2);  % radial distance from the center of the base
valid = (r <= (1 - z / height) * radius); % check if the point is inside the inverted cone
x = x(valid);
y = y(valid);
shift=4;
z = z(valid)+shift;
Randloc = [x y z]

% tree layer parameters
tr = 0.1; % tree radius [m]
tz = 4; % tree height [m]

% plot with a tree (cylinder)
% create a cylinder of radius (tr) and height (tz)
[Xt,Yt,Zt] = cylinder(tr) ;
Zt = tz * Zt;

% to place our branches / leaves, we need to insert htem into the layer
% i'll need to think about the best way to do this programmatically
shift_factor = tz+shift ;

figure('color','white')
surf(Xt, Yt, Zt, 'FaceColor', '#964B00')
hold('on'); grid('on')
% surf(Xt+8, Yt+10, Zt, 'FaceColor', '#964B00')
% hold('on'); grid('on')
% surf(Xt+15, Yt, Zt, 'FaceColor', '#964B00')
% hold('on'); grid('on')
% Visualize the distribution of particles using a 3D scatter plot
%figure;
scatter3(x, y, z, '.');
xlabel('x');
ylabel('y');
zlabel('z');
title('Random particles in an inverted cone');
axis equal;
