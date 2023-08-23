function [N] = getN(Ae, Ao, P, Po)
%Retrieves the Normal equations matrix N using Ae, Ao, and P
    N = [Ae.'*P*Ae, Ae.'*P*Ao; (Ae.'*P*Ao).', Ao.'*P*Ao+Po];
end

