function [Ae, Ao, Ai, w] = get_Ae_Ao_w(IOPs, CON, EOPs, PHO, TIE)
%Retrieves the flattened Ae, Ao, and w matrices from the function
%calc_coll_pds_misc_v2 using IOPs, CON, EOPs, PHO, TIE
    numberOfObservations = size(PHO, 1);
    
    coordinateList = [CON; TIE];
    
    Ae_flat = [];
    Ao_flat = [];
    Ai_flat = [];
    w = [];
    
    % iterate through observations and retrive Ae, Ao, Ai, w
    for i = 1:numberOfObservations
        %get the image number and point number of the observation
        pointNumber = PHO(i, 1);
        imageNumber = PHO(i, 2);
        
        %retrieve parameters for the observation
        XYZc = getXYZc(EOPs, imageNumber);
        wpk = get_wpk(EOPs, imageNumber);
        XYZ = getXYZ(coordinateList, pointNumber);
        xpypc = get_xpypc(IOPs);
        xy_obs = get_xy_obs(PHO, i);
        lhs = 1;
        
        %calculate the A parameters and w for the observation
        [Ae_i, Ao_i, Ai_i, w_i] = calc_coll_pds_misc_v2(XYZc, wpk, XYZ, xpypc, xy_obs, lhs);
        
        %combine this observation with the rest
        Ae_flat = [Ae_flat; Ae_i];
        Ao_flat = [Ao_flat; Ao_i];
        Ai_flat = [Ai_flat; Ai_i];
        w = [w; w_i];
        
    end
        
    %unflatten the design matrices
    Ae = unflattenAe(Ae_flat, PHO);
    Ao = unflattenAo(Ao_flat, PHO, TIE, CON);
    Ai = Ai_flat;
end

