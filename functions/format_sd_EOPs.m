function [formatted_sd_EOPs] = format_sd_EOPs(sd_EOPs)
%FORMAT_SD_EOPS 
    sd_X = sd_EOPs(1:6:size(sd_EOPs,1)-5);
    sd_Y = sd_EOPs(2:6:size(sd_EOPs,1)-4);
    sd_Z = sd_EOPs(3:6:size(sd_EOPs,1)-3);
    sd_w = sd_EOPs(4:6:size(sd_EOPs,1)-2);
    sd_p = sd_EOPs(5:6:size(sd_EOPs,1)-1);
    sd_k = sd_EOPs(6:6:size(sd_EOPs,1));
    formatted_sd_EOPs = [sd_X,sd_Y,sd_Z,sd_w,sd_p,sd_k];
end

