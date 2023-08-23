function [Ao] = unflattenAo(Ao_flat, PHO, TIE, CON)
%Retrieves the Ao matrix from the flattened Ao and Observations
    numberOfTiePoints = size(TIE, 1);
    numberOfControlPoints = size(CON, 1);
    numberOfObservations = size(PHO, 1);
    
    pointNumbers = getSortedPointNumbers(TIE, CON);
    
    Ao = zeros(numberOfObservations*2, (numberOfTiePoints+numberOfControlPoints)*3);
    
    pointNumberMatrix = [];
    for i = 1:numberOfObservations
        for j = 1:2
            pointNumberMatrix = [pointNumberMatrix; PHO(i, 1)];
        end
    end
    
    for i = 1:numberOfObservations*2
        index = findIndexOfValue(pointNumberMatrix(i), pointNumbers);
        if(index ~= 0)
            index = (index-1)*3+1;
            Ao(i, index:index+2) = Ao_flat(i,1:3);
        end
    end
    
end

