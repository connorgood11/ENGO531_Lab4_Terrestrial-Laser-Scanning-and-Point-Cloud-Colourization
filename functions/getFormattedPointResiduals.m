function [vo_formatted] = getFormattedPointResiduals(vo, TIE, CON)
%GETFORMATTEDPOINTRESIDUALS 
    points = getSortedPointNumbers(TIE, CON);
    vx = vo(1:3:size(vo,1)-2);
    vy = vo(2:3:size(vo,1)-1);
    vz = vo(3:3:size(vo,1));
    vo_formatted = [points,vx,vy,vz];
end

