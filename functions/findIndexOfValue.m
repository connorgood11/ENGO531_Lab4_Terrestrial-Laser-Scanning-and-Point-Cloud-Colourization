function [index] = findIndexOfValue(value, matrix)
% finds the index of a value located in the first column in a matrix
    column = matrix(:,1);
    for i = 1:length(column)
        if(column(i) == value)
            index = i;
            return
        end
    end
    index = 0;
end