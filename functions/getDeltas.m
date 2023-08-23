function [delta, delta_e, delta_o] = getDeltas(N, u, me, mo)
%
    delta = -inv(N)*u;
    delta_e = delta(1:me);
    delta_o = delta(me+1:me+mo);
end

