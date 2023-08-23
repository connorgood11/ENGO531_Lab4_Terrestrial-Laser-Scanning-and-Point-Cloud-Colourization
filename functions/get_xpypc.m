function [xpypc] = get_xpypc(IOPs)
%Returns the basic IOPs from INT
    xpypc = transpose(IOPs(1, 2:4));
end

