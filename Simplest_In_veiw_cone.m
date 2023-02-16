% Receiver location and view angle
receiver_position = [0, 0, 100]; % [x,y,z]
view_angle = 30; % in degrees

% Generate example particle positions
n_particles = 100000;
particle_positions = 500*rand(n_particles, 3) - 250; % random positions between -250 and 250

% Calculate particle vectors relative to receiver location
particle_vectors = particle_positions - receiver_position;

% Calculate angles between particle vectors and receiver view direction
receiver_direction = [0, 0, 1]; % upward direction
cos_angles = dot(particle_vectors, repmat(receiver_direction, size(particle_vectors, 1), 1), 2) ./ vecnorm(particle_vectors, 2, 2);
angles = acosd(cos_angles);

% Find particles within the view cone
in_view = find(angles <= view_angle/2);

% Plot the particles in the view cone
figure;
scatter3(particle_positions(in_view,1), particle_positions(in_view,2), particle_positions(in_view,3), 'filled', 'g');
title('Particles in the Receiver View Cone');
xlabel('X');
ylabel('Y');
zlabel('Z');
axis equal;
grid on;
