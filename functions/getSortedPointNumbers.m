function [sortedPointNumbers] = getSortedPointNumbers(TIE, CON)
%GETSORTEDPOINTNUMBERS
    if isempty(TIE)
        sortedPointNumbers = sort(CON(:, 1));
    else
        sortedPointNumbers = sort([TIE(:, 1); CON(:, 1)]);
    end
end

