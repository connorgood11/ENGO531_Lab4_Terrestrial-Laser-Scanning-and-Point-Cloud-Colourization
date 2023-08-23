function [rotationAngles] = get_wpk(EOPs, imageNumber)
%Retrieve the rotation angles from the EOPs given the image
%number
    for i = 1:size(EOPs, 1)
        if(EOPs(i,1) == imageNumber)
            rotationAngles = transpose(EOPs(i,6:8));
            return
        end
    end
    disp("Image number " + imageNumber + " not found in EOPs");
end

