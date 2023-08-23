function [u] = get_u(Ae, Ao, P, Po, w, wo)
%Retrieve the normal vector
    u = [Ae.'*P*w; Ao.'*P*w+Po*wo];
end

