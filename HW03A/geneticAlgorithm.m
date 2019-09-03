function solution = geneticAlgorithm(N, popSize, gen, cRate, mRate)

 
nbits = 3*(2^N-1+5);

population = randi([0,1],popSize,nbits);    % Initial population
fitness = evaluate(N, population, popSize); % Fitness of initial population
bFitness = 0;                               % Initial best fitness
 
% Genetic Algorithm process
for i = 1:gen
    % Selection -> Crossover -> New population
    k = 1;
    tmpPopulation = zeros(popSize,nbits);
    for j = 1:(popSize /2)
        parentA = select(3, population, popSize, fitness);
        parentB = select(3, population, popSize, fitness);
        offspring = crossover(parentA, parentB, cRate);
        tmpPopulation(k:k+1,:) = offspring;
        k = k + 2;  
    end
    population = tmpPopulation; % Replace generation
    
    % Mutation
    for j = 1:popSize
       population(j,:) = mutate(population(j,:), mRate); 
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