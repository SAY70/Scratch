function angle = calculate_conical_view_angle(range, beamwidth, height, receiver_pos, particle_pos)
% CALCULATE_CONICAL_VIEW_ANGLE Calculates the conical view angle from a
% receiver to a particle in space.
%   angle = CALCULATE_CONICAL_VIEW_ANGLE(range, beamwidth, height,
%   receiver_pos, particle_pos) calculates the conical view angle from a
%   receiver located at position receiver_pos with a maximum range of range
%   and a beamwidth of beamwidth to a particle located at position
%   particle_pos with a height of height above the ground.

% Calculate the distance between the receiver and particle
dist = norm(receiver_pos - particle_pos);

% Calculate the angle between the particle position and the antenna boresight
beam_direction = (particle_pos - receiver_pos) / dist;
boresight_direction = [0, 0, 1];
angle = acosd(dot(beam_direction, boresight_direction));

% Check if the particle is within the field of view
if dist > range || angle > beamwidth/2 || particle_pos(3) > height
    angle = inf; % particle is not within the field of view
end

end
