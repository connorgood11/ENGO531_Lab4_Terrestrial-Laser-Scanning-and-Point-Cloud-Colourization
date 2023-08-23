function [TIE, CON] = correctTieCon(delta_o, TIE, CON)
%Correct TIE and CON with delta_o
    pointNumbers = getSortedPointNumbers(TIE, CON);
    numberOfPoints = size(pointNumbers, 1);
    
    corX = delta_o(1:3:numberOfPoints*3-2);
    corY = delta_o(2:3:numberOfPoints*3-1);
    corZ = delta_o(3:3:numberOfPoints*3);
    formatted_delta_o = [corX, corY, corZ];
    
    for i = 1:numberOfPoints
        if(~isempty(TIE))
            if(ismember(pointNumbers(i), TIE(:,1)))
                index = findIndexOfValue(pointNumbers(i), TIE(:,1));
                TIE(index,2:4) = TIE(index,2:4) + formatted_delta_o(i,1:3);
            end
            
        elseif(ismember(pointNumbers(i), CON(:,1)))
            index = findIndexOfValue(pointNumbers(i), CON(:,1));
            CON(index,2:4) = CON(index,2:4) + formatted_delta_o(i,1:3);
            
        else
            disp("Error: correctTieCon line ten for loop");
        end
    end
end

