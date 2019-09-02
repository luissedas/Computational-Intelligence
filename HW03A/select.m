function solution = select(tournamentSize, population, fitness)

%rng(seed)

index = randperm(length(population)); % Gets a permutation of indexes
index = index(1:tournamentSize); % Selects tournamentSize elements

[~,fit_index] = max(fitness(index));

solution = population(fit_index,:);
end