function [P] = getP(PHO, o)
%gets initial weight matrix P
    numberOfObservations = size(PHO, 1);
    P = (1/o)*eye(numberOfObservations*2, numberOfObservations*2);
end

