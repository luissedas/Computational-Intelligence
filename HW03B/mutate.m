function solution = mutate(individual, mRate)
solution = individual;
for i = 1:length(individual)
    if rand(1, 1) < mRate
        if individual(i) == 1
            solution(i) = 0;
        else
            solution(i) = 1;
        end
    end
end
end