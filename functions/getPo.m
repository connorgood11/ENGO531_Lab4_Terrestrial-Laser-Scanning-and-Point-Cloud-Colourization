function [Po] = getPo(PHO, TIE, CON)
%Get the Po matrix from PHO, TIE, and CON
    pointNumbers = getSortedPointNumbers(TIE, CON);
    pointNumbersIndexed = [];
    for i = 1:size(pointNumbers, 1)
        for j = 1:3
            pointNumbersIndexed = [pointNumbersIndexed; pointNumbers(i)];
        end
    end
    
    numberOfPoints = size(pointNumbers, 1);
    Po = zeros(numberOfPoints*3, numberOfPoints*3);
    for i = 1:numberOfPoints*3
        if(ismember(pointNumbersIndexed(i), CON(:, 1)))
            Po(i, i) = 1;
        end
    end
end

