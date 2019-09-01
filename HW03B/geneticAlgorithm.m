function solution = geneticAlgorithm(set, popSize, gen, cRate, mRate)

% Creates the initial population
population = randi([0,1],popSize,length(set));
fitness = evaluate(population,set);
bFitness = 10000; % Initial best fitness

% Runs the genetic algorithm process

for i = 1:gen
    % Selection - Crossover - New Population
    k = 1;
    tmpPopulation = zeros(popSize, length(set));
    for j = 1:(popSize / 2)
        parentA = select(3, population, fitness);
        parentB = select(3, population, fitness);
        offspring = crossover(parentA, parentB, cRate);
        tmpPopulation(k:k+1,:) = offspring;
        k = k + 2;
    end
    population = tmpPopulation;
    
    % Mutation
    for j = 1:popSize
        population(j, :) = mutate(population(j, :), mRate);
    end
    fitness = evaluate(population,set);
    
    % Gets best individual so far
    for j = 1:popSize
       if fitness(j) < bFitness
           bFitness = fitness(j);
           solution = population(j,:);
       end
    end
end

end