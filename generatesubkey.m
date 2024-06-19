function subkeys = generatesubkey(permkey,i)
    if length(permkey) ~= 56
        error('Key does not satisfy the 56-bit requirement')
    end
    
    subkeys = cell(16,1); % Initialize cell array to store subkeys

    Split1 = permkey(1:28);
    Split2 = permkey(29:56);
    roundshifts = [1 1 2 2 2 2 2 2 1 2 2 2 2 2 2 1]; 

    for j = 1:16
        % Circular left shift for Split1 and Split2
        Split1 = circshift(Split1,[0,-roundshifts(j)]);
        Split2 = circshift(Split2,[0,-roundshifts(j)]);

        newkey = [Split1 Split2];
        perm2 = [14 17 11 24 1 5 3 28 15 6 21 10 23 19 12 4 26 8 16 7 27 20 13 2 41 52 31 37 47 55 30 40 51 45 33 48 44 49 39 56 34 53 46 42 50 36 29 32];
        subkey = newkey(perm2);
        subkeys{j} = subkey; % Stores the subkey in the cell array
    end
end