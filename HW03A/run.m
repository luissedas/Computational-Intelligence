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
% This one worked
% [solution,population] = geneticAlgorithm(3, 50, 500, 1, 0.1);

[solution,population] = geneticAlgorithm(N, popSize, gen, cRate, mRate);
translation(N,solution)

