function [array] = readArray(filename)
    file_ID = fopen(filename, 'r');
    formatSpec = '%f';
    array = fscanf(file_ID, formatSpec);
    fclose(file_ID);
end