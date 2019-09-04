% 1 if Bigger (Disk/Smaller Disk). Needs to add the condition tower(2)~=0
% because towers is a matriz of 0s, and so moving a disk to an empty tower
% could appear as an ilegal move because of the first condition.
function ilegal = legal_move(tower)

if (tower(1)>tower(2) && tower(2)~= 0) 
    ilegal = 1; % ilegal move
else
    ilegal = 0; % legal move
end

end