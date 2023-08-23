function [coordinates] = getXYZ(coordinateList, pointNumber)
%Retrieve the coordinates of point pointNumber from coordinateList
    for i = 1:size(coordinateList, 1)
        if(coordinateList(i, 1) == pointNumber)
            coordinates = transpose(coordinateList(i, 2:4));
            return
        end
    end
    disp("There was an error finding " + pointNumber + " in the coordinateList");
end

