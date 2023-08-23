function [n, no, u, ue, uo] = computeDimensions(PHO, TIE, CON, EOPs)
%Compute the dimension parameters
    ue = size(EOPs, 1)*6;
    uo = size([TIE; CON], 1)*3;
    n = size(PHO, 1)*2;
    u = ue + uo;
    no = size(getSortedPointNumbers(TIE, CON), 1);
end

