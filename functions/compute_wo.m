function [flat_wo] = compute_wo(TIE, CON, initial_TIE, initial_CON)
%COMPUTE_WO
    TIE(:,2:4) = zeros(size(TIE,1),3);
    initial_TIE(:,2:4) = zeros(size(initial_TIE,1),3);
    flat_XYZ = sortrows([TIE;CON]);
    initial_XYZ = sortrows([initial_TIE;initial_CON]);
    wo = flat_XYZ-initial_XYZ;
    wo = wo(:, 2:size(wo, 2));
    flat_wo = [];
    for i = 1:size(wo,1)
        flat_wo = [flat_wo;wo(i,:).'];
    end
end

