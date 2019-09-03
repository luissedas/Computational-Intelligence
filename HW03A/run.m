% Homework Assignment #3
% IA5008-Computational Intelligence
% Author: Luis Angel Sedas Díaz
% Id: A00815430
%% Initial parameters
clc;clear all
N = 3;          % number of disks
popSize = 30;   % population size
gen = 100;      % number of generations
cRate = 1.0;    % crossover rate
mRate = 0.01;   % mutation rate
%% Genetic Algorithm
solution = geneticAlgorithm(N, popSize, gen, cRate, mRate);

