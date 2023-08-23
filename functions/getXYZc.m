function [perspectiveCentreCoordinates] = getXYZc(EOPs, imageNumber)
%Retrieve the perspective centre coordinates from the EOPs given the image
%number
    for i = 1:size(EOPs, 1)
        if(EOPs(i,1) == imageNumber)
            perspectiveCentreCoordinates = transpose(EOPs(i,3:5));
            return
        end
    end
    disp("There was an error finding image number " + imageNumber + " in EOPs");
end

