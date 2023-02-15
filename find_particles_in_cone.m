function particles_in_cone = find_particles_in_cone(particles, range, beamwidth, height)
    
    % angle of the cone
    angle = calculate_conical_view_angle(range, beamwidth, height);

    % Convert the particle coordinates to polar coordinates relative to the receiver
    [azimuth, elevation, radius] = cart2sph(particles(:,1), particles(:,2), particles(:,3));
    elevation = pi/2 - elevation;


    % Find the particles that lie within the conical view
    particles_in_cone = (elevation >= -angle/2) & (elevation <= angle/2) & (radius <= range);


    % Return the indices of the particle in the volume of the cone
    particles_in_cone = find(particles_in_cone);
end
