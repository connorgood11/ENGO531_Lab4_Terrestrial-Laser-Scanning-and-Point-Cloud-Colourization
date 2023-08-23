function [v, vo, vx, vy] = getResiduals(Ae, Ao, me, mo, delta, w, wo)
%
    v = [Ae, Ao; zeros(mo, me), eye(mo, mo)]*delta+[w;wo];
    vo = v(size(Ae, 1)+1:size(Ae, 1)+mo);
    v = v(1:size(Ae, 1));
    vx = v(1:2:size(v, 1)-1);
    vy = v(2:2:size(v, 1));
    
end

