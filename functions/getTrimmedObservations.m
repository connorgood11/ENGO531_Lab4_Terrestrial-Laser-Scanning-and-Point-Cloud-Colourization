function [trimmed_PHO] = getTrimmedObservations(PHO, CON)
%GETTRIMMEDOBSERVATIONS 
    trimmed_PHO = [];
    for i = 1:size(PHO, 1)
        if ismember(PHO(i, 1), CON(:, 1))
            trimmed_PHO = [trimmed_PHO; PHO(i, :)];
        end
    end
end

