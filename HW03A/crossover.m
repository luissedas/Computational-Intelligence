function offspring = crossover(parentA, parentB, cRate)
%rng(seed);
offspring = zeros(2,length(parentA));
if rand(1, 1) < cRate
    cPoint = randi([1, length(parentA)], 1, 1);
    offspring(1, :) = [parentA(1:cPoint), parentB((cPoint + 1):length(parentB))];
    offspring(2, :) = [parentB(1:cPoint), parentA((cPoint + 1):length(parentA))];
else
    offspring(1, :) = parentA;
    offspring(2, :) = parentB;
end
end