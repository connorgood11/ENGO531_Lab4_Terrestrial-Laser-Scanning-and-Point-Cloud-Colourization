function [corr_mats] = getCorrelationMatrix(EOPs, IOPs, C_xhat)
%GETCORRELATIONMATRIX
    corr_mats = [];
    for i = 1:size(EOPs, 1)
        eop_index = 1*i:1*i+5;
        sd_EOPs = C_xhat(eop_index,eop_index);
        iop_index = size(EOPs, 1) * 6 + 1:size(EOPs, 1) * 6 + 3;
        sd_IOPs = C_xhat(iop_index, iop_index);
        sd_EOPs_IOPs = C_xhat(eop_index, iop_index);
        combinedMat = [sd_EOPs, sd_EOPs_IOPs; sd_EOPs_IOPs.', sd_IOPs];
        disp("");
        disp("Correlation Matrix Image: " + EOPs(i, 1));
        disp("X    Y    Z   w	p   k   xp  yp  c");
        disp(corrcoef(combinedMat));
        corr_mats = [corr_mats; corrcoef(combinedMat)];
    end
end

