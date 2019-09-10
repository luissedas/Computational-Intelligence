function [fitness] = evaluate(N, population, popSize)
% Evaluates population
fitness = zeros(popSize,1);
for j = 1:popSize
    
    ind = population(j,:);       % Chromosome
    t1 = 1:N;                    % Tower 1
    t2 = zeros(1,length(t1));    % Tower 2
    t3 = zeros(1,length(t1));    % Tower 3
    towers = [t1',t2',t3'];      % Initial towers state
   
    i = 0;                       % Counter of # of moves
    tmpFitness = 0;              % temporal fitness value
    d_old = 8346;                % Disk moved previos turn
    d_new = 8374;                % Disk moved in present turn
    bad_move = 0;                % # of bad moves
    
    while (i<=(length(ind)/3-1)) && (tmpFitness ~= sum(1:N))
       
        move = ind(3*i+1:3*i+3); % 3 bit string
        [t1,t2,t3,d_new] = move_board(move, towers, d_new);
        
        % Bad move if: 
        % (1) moves 2 times the same disk.
        % (2) the movement didnt change the board.
        if (d_old == d_new) || (sum([t1(1), t2(1), t3(1)] == towers(1,:)) == 3)
           bad_move = bad_move + 1 ;
        end
        d_old = d_new;
        towers = [t1,t2,t3];
        tmpFitness = sum(t3);
        i = i + 1 ;
    end
    fitness(j) = sum(t3)- bad_move;

end
