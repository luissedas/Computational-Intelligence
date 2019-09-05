% Homework Assignment #3
% IA5008-Computational Intelligence
% Author: Luis Angel Sedas Díaz
% Id: A00815430
%% Initial parameters
clc;clear all;
N = 3;          % number of disks
popSize = 50;   % population size
gen = 500;      % number of generations
cRate = 1.0 ;    % crossover rate
mRate = 0.1;   % mutation rate
%% Genetic Algorithm
[solution,population] = geneticAlgorithm(N, popSize, gen, cRate, mRate);
translation(3,solution)
%s = [0 0 1 0 0 0 1 0 1 0 0 1 0 1 0 0 1 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1];
%s = [0 0 1 0 0 0 1 0 1 0 0 1 0 1 0 0 1 1 0 0 1];



%% Parameters that worked
clc;clear all
N = 3;          % number of disks
popSize = 50;   % population size
gen = 500;      % number of generations
cRate = 1.0 ;    % crossover rate
mRate = 0.1;   % mutation rate
nbits = 3*(2^N-1+2);
%fitness(j) = sum(t3)-bad_move;