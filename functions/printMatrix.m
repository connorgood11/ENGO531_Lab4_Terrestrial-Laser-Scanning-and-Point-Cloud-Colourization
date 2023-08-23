function [] = printMatrix(file_ID, matrix)
%FPRINTF
    for i = 1:size(matrix, 1)
        for j = 1:size(matrix, 2)
            fprintf(file_ID, matrix(i, j));
        end
    end
end

