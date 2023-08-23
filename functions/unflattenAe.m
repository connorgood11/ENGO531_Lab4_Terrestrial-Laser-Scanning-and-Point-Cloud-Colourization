function [Ae] = unflattenAe(Ae_flat, PHO)
%The number of observed images is found and the Ae matrix parameters are
%placed in their appropriate format from a flattened version
    numberOfImages = size(unique(PHO(:, 2)), 1);
    numberOfObservations = size(PHO, 1);
    
    Ae = zeros(numberOfObservations*2, numberOfImages*6);
    
    imageNumberMatrix = [];
    lastImageNumber = 0;
    indexNumber = 0;
    for i = 1:numberOfObservations
        imageNumberI = PHO(i, 2);
        if(lastImageNumber ~= imageNumberI)
            indexNumber = indexNumber + 1;
            lastImageNumber = imageNumberI;
        end
        for j = 1:2
            imageNumberMatrix = [imageNumberMatrix; indexNumber];
        end
    end
    
    for i = 1:numberOfObservations*2
        Ae_column = (imageNumberMatrix(i)-1)*6+1;
        Ae(i, (Ae_column:Ae_column+5)) = Ae_flat(i, :);
    end
end

