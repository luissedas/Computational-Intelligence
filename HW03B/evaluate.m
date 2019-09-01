function fitness = evaluate(individual,set)

fitness = abs(sum(individual.*set,2)-sum(not(individual).*set,2));

end