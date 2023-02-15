
range = 100; % maximum range of the antenna
%r = 100; % maximum range of the antenna
beamwidth = 10; % beamwidth of the antenna in degrees

% Define the height of the antenna above the ground
height = 2; % height of the antenna above the ground
%h = 2; % height of the antenna above the ground

% Define the position of the receiver in 3D space
receiver_pos = [10, 20, 5]; % position of the receiver in 3D space

% Generate random positions for the particles
%np = 1000; % number of particles to generate
num_particles = 1000; % number of particles to generate
particle_positions = rand(num_particles, 3) * 50; % randomly generate particle positions in 3D space
% we can difine exact particle position in the 3D space??

% Calculate the conical view angle for each particle
angles = zeros(num_particles, 1); % initialize an array to store the angles
for i = 1:num_particles
    particle_pos = particle_positions(i, :); % get the position of the current particle
    angle = calculate_conical_view_angle1(range, beamwidth, height, receiver_pos, particle_pos); % calculate the conical view angle for the current particle
    dist(i) = norm(receiver_pos - particle_pos);
    angles(i) = angle; % store the angle for the current particle
end

%dist = norm(receiver_pos - particle_pos(i));

% Find the particles that are within the receiver's field of view
threshold_angle = 5; % set a threshold angle for particles to be considered within the field of view
in_view = (angles <= threshold_angle); % create a logical array indicating which particles are within the field of view

% Plot the particles and their field of view
figure;
scatter3(particle_positions(:,1), particle_positions(:,2), particle_positions(:,3)); % plot the particles
hold on;
plot_conical_view(range, beamwidth, height, receiver_pos, particle_pos); % plot the field of view of the receiver
scatter3(particle_positions(in_view,1), particle_positions(in_view,2), particle_positions(in_view,3), 'filled', 'g'); % plot the particles within the field of view
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Particle positions and receiver field of view');
