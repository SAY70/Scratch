function angle = calculate_conical_view_angle(range, beamwidth, height, receiver_pos, particle_pos)
    
    % Calculate the distance from the receiver to the maximum range
    r = range;

    % Calculate the height of the cone
    h = height - receiver_pos(3);

    % Calculate the distance from the receiver to the base of the cone
    d = sqrt(r^2 + h^2);

    % Calculate the radius of the cone at the base
    base_radius = tan(beamwidth/2) * d;

    % Calculate the angle of the cone
    angle = 2 * atan2(base_radius, d);

    % Convert the angle from radians to degrees
    angle = angle * 180 / pi;
end



