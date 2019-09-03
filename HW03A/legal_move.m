function ilegal = legal_move(tower)

if (tower(1)>tower(2) && tower(2)~= 0)
    ilegal = 1;
else
    ilegal = 0;
end

end