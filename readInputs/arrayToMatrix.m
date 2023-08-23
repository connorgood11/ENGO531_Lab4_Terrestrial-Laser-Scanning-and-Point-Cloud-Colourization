function [matrix] = arrayToMatrix(array, numberOfColumns)
    % check if the array can be formatted into a matrix of this size
    if (mod(length(array), numberOfColumns) ~= 0)
        return
    end

    %variable to iterate through the array
    i = 1;
    
    numberOfRows = length(array)/numberOfColumns; 
    matrix = zeros(numberOfRows, numberOfColumns);   
    % for loop to iterate through the matrix
    for j = 1:numberOfRows
        for k = 1:numberOfColumns
            matrix(j, k) = array(i);
            i = i + 1;
        end
    end
end