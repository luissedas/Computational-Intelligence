function solution = select(tournamentSize, population, popSize, fitness)

%rng(seed)

index = randperm(popSize); % Gets a permutation of indexes
index = index(1:tournamentSize); % Selects tournamentSize elements

[~,fit_index] = min(fitness(index));

solution = population(fit_index,:);
end