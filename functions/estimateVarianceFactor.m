function [estimatedVarianceFactor] = estimateVarianceFactor(v, P, vo, Po, n, u, no)
%
    estimatedVarianceFactor = (v.'*P*v+vo.'*Po*vo)/(n-u+no);
end

