function [EOPs] = correctEOPs(delta_e, EOPs)
%correct eops
numberOfImages = size(EOPs, 1);

X = delta_e(1:6:numberOfImages*6-5);
Y = delta_e(2:6:numberOfImages*6-4);
Z = delta_e(3:6:numberOfImages*6-3);
w = delta_e(4:6:numberOfImages*6-2);
p = delta_e(5:6:numberOfImages*6-1);
k = delta_e(6:6:numberOfImages*6);


formatted_delta_e = [X, Y, Z, w, p, k];
EOPs(:,3:8) = EOPs(:,3:8) + formatted_delta_e;
end

