function [fitness] = evaluate(N, population, popSize)
% Done:
% Legal move? upper disk < lower disk

% To do:
% penalize moves that make no change
% stop when a solution has been reached
% Only move when it is legal
% Mover el mismo disco de manera seguida se penaliza

fitness = zeros(popSize,1);
%%
for j = 1:popSize
    ind = population(j,:);       % Chromosome
    t1 = 1:N;                    % Tower 1
    t2 = zeros(1,length(t1));    % Tower 2
    t3 = zeros(1,length(t1));    % Tower 3
    towers = [t1',t2',t3'];      % Initial towers state 
    
   
    % Change this for to while and have 2 conditions
    % 1. 0:length(ind)/3-1
    % 2. if fitness = sum(t3)
    
    %for i = 0:length(ind)/3-1
    i = 0;
    tmpFitness = 0;              % temporal fitness value
    d_old = 8346;
    d_new = 8374;
    ilegal = 0;                  % Ilegal moves
    useless_move = 0;            % Moves that do nothing
    bad_move = 0;
    
    while (i<=(length(ind)/3-1)) && (tmpFitness ~= sum(1:N))
       
        move = ind(3*i+1:3*i+3); % 3 bit string
        
        if ((sum(move == [0 0 0]) == 3 || sum(move == [1 1 0]) == 3)) && (sum(t1) ~= 0) && (legal_move(t1,t2))
            t2 = circshift(t2,1);
            t2(1) = t1(1);
            d_new = t1(1);
            
            t1 = circshift(t1,-1); 
            t1(end) = 0;

        elseif ((sum(move == [0 0 1]) == 3 || sum(move == [1 1 1]) == 3) && sum(t1) ~= 0) && (legal_move(t1,t3))
            t3 = circshift(t3,1);
            t3(1) = t1(1);
            d_new = t1(1);
            
            t1 = circshift(t1,-1); 
            t1(end) = 0;
   
        elseif (sum(move == [0 1 0]) == 3) && (sum(t2) ~= 0) && (legal_move(t2,t1))
            t1 = circshift(t1,1);
            t1(1) = t2(1);
            d_new = t2(1);
            
            t2 = circshift(t2,-1); 
            t2(end) = 0;
    
        elseif (sum(move == [0 1 1]) == 3) && (sum(t2) ~= 0) && (legal_move(t2,t3))
            t3 = circshift(t3,1);
            t3(1) = t2(1);
            d_new = t2(1);
            
            t2 = circshift(t2,-1); 
            t2(end) = 0;
  
        elseif (sum(move == [1 0 0]) == 3) && (sum(t3) ~= 0) && (legal_move(t3,t1))
            t1 = circshift(t1,1);
            t1(1) = t3(1);
            d_new = t3(1);
            
            t3 = circshift(t3,-1); 
            t3(end) = 0;

        elseif (sum(move == [1 0 1]) == 3) && (sum(t3) ~= 0) && (legal_move(t3,t2))
            t2 = circshift(t2,1);
            t2(1) = t3(1);
            d_new = t3(1);
            
            t3 = circshift(t3,-1); 
            t3(end) = 0;    
            
        end
      
%         if sum([t1(1), t2(1), t3(1)] == towers(1,:)) == 3
%             useless_move = useless_move + 1;
%         end 
              
        if (d_old == d_new) || (sum([t1(1), t2(1), t3(1)] == towers(1,:)) == 3)
           bad_move = bad_move + 1 ;
        end
        d_old = d_new;
        towers = [t1',t2',t3'];
        tmpFitness = sum(t3);
        
        
%         disp([num2str(d_old),'  ',num2str(d_new)])        
        display(move)
        display([t1',t2',t3']);
        disp(['fitness: ', num2str(sum(t3)),...
              ', bad move:', num2str(bad_move)]);
        i = i + 1 ;
    end
    fitness(j) = sum(t3) - bad_move;

end
