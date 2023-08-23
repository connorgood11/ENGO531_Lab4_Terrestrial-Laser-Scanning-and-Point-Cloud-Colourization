function [xyObservations] = get_xy_obs(PHO, index)
%Retrieve the x, y observation vector from the observations
    xyObservations = transpose(PHO(index, 3:4));
end

