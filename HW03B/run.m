% Homework Assignment #3B
% IA5008-Computational Intelligence
% Author: Luis Angel Sedas D�az
% Id: A00815430
%% 
set = [10, 4, 5, 8, 16, 3, 12, 11, 11, 7];
popSize = 30;
generations = 100;
cRate = 1.0;
mRate = 0.01;

solution = geneticAlgorithm(set, popSize, gen, cRate, mRate);
[set1,set2] = translation(solution, set);

clc
X = ['Set 1: [',num2str(set1), ']', '\n Sum: ',num2str(sum(set1)),'\n'];
Y = ['Set 2: [',num2str(set2), ']', '\n Sum: ',num2str(sum(set2)),'\n'];
fprintf(X)
fprintf(Y)

fprintf(['Fitness:', num2str(abs(sum(set1)-sum(set2))),'\n'])