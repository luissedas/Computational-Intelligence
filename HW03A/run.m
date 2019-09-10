% Homework Assignment #3
% IA5008-Computational Intelligence
% Author: Luis Angel Sedas Díaz
% Id: A00815430

clc;clear all;
%------------------------------------------------------------------------
% This parameters worked for N = 3
N = 3;          % number of disks
popSize = 50;   % population size
gen = 500;      % number of generations
cRate = 1.0 ;   % crossover rate
mRate = 0.1;    % mutation rate

% Genetic Algorithm
[solution] = geneticAlgorithm(N, popSize, gen, cRate, mRate);
translation(N,solution)

