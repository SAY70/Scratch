range = 100; % maximum range of the antenna
beamwidth = 10; % beamwidth of the antenna in degrees
height = 2; % height of the antenna above the ground
receiver_pos = [10, 20, 5]; % position of the receiver in 3D space

angle = calculate_conical_view_angle(range, beamwidth, height, receiver_pos);