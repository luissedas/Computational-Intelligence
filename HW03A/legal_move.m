% 1 if Bigger (Disk/Smaller Disk). Needs to add the condition tower(2)~=0
% because towers is a matriz of 0s, and so moving a disk to an empty tower
% could appear as an ilegal move because of the first condition.
function legal = legal_move(t_inicial, t_final)

if ((t_inicial(1) < t_final(1))||((t_final(1)==0)) && (t_inicial(1)~= 0)) 
    legal = true; % ilegal move
else
    legal = false; % legal move
end

end