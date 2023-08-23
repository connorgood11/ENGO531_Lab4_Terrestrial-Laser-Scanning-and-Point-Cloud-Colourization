function [formattedMatrix] = readMatrix(filename, numberOfColumns)
    array = readArray(filename);
    formattedMatrix = arrayToMatrix(array, numberOfColumns);
end