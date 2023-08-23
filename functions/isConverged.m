function [converged] = isConverged(maxDelta, tolerance)
%ISCONVERGED 
    if(maxDelta * tolerance < 1)
        converged = 1;
        disp("The solution has converged.");
        return
    end
    converged = 0;
end

