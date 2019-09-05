function [solution,population] = geneticAlgorithm(N, popSize, gen, cRate, mRate)

 
nbits = 3*(2^N-1+3);

population = randi([0,1],popSize,nbits);    % Initial population
fitness = evaluate(N, population, popSize); % Fitness of initial population
bFitness = -999;                               % Initial best fitness
 
% Genetic Algorithm process
for i = 1:gen
    % Selection -> Crossover -> New population
    k = 1;
    tmpPopulation = zeros(popSize,nbits);
    for j = 1:(popSize /2)
        parentA = select(3, population, popSize, fitness);
        parentB = select(3, population, popSize, fitness);
        offspring = crossover(parentA, parentB, cRate);
        tmpPopulation(k, :) = offspring(1, :);
        k = k + 1;
        tmpPopulation(k, :) = offspring(2, :);
        k = k + 1;  
    end
    population = tmpPopulation; % Replace generation
    
    % Mutation
    for j = 1:popSize
       population(j,:) = mutate(population(j,:), mRate);
       fitness(j) = evaluate(N, population(j,:), 1);
    end
    
    % Gets best individual/solution so far
    for j = 1:popSize
        if fitness(j) > bFitness
            bFitness = fitness(j);
            solution = population(j,:);
        end
    end
end

end