function [fitness, ilegal, useless_move] = evaluate(N, population, popSize)
% Done:
% Legal move? upper disk < lower disk

% To do:
% penalize moves that make no change
% stop when a solution has been reached

fitness = zeros(1,popSize);
t1 = 1:N;
t2 = zeros(1,length(t1));
t3 = zeros(1,length(t1));

%%
%display([t1',t2',t3']);

for j = 1:popSize
    ind = population(j,:);
    
    ilegal = 0;                  % Ilegal moves
    useless_move = 0;            % Moves that do nothing
    towers = [t1',t2',t3']; 
    
    % Change this for to while and have 2 conditions
    % 1. 0:length(ind)/3-1
    % 2. if fitness = sum(t3)
    for i = 0:length(ind)/3-1

        move = ind(3*i+1:3*i+3); % 3 bit string
        
        if ((sum(move == [0 0 0]) == 3 || sum(move == [1 1 0]) == 3) && sum(t1) ~= 0)
            t2 = circshift(t2,1);
            t2(1) = t1(1);
            t1 = circshift(t1,-1); 
            t1(end) = 0;
            ilegal = ilegal + legal_move(t2); % Disco grande/disco peque�o

        elseif ((sum(move == [0 0 1]) == 3 || sum(move == [1 1 1]) == 3) && sum(t1) ~= 0)
            t3 = circshift(t3,1);
            t3(1) = t1(1);
            t1 = circshift(t1,-1); 
            t1(end) = 0;
            ilegal = ilegal + legal_move(t3);
            
        elseif (sum(move == [0 1 0]) == 3) && (sum(t2) ~= 0)
            t1 = circshift(t1,1);
            t1(1) = t2(1);
            t2 = circshift(t2,-1); 
            t2(end) = 0;
            ilegal = ilegal + legal_move(t1);
            
        elseif (sum(move == [0 1 1]) == 3) && (sum(t2) ~= 0)
            t3 = circshift(t3,1);
            t3(1) = t2(1);
            t2 = circshift(t2,-1); 
            t2(end) = 0;
            ilegal = ilegal + legal_move(t3);
            
        elseif (sum(move == [1 0 0]) == 3) && (sum(t3) ~= 0)
            t1 = circshift(t1,1);
            t1(1) = t3(1);
            t3 = circshift(t3,-1); 
            t3(end) = 0;
            ilegal = ilegal + legal_move(t1);
            
        elseif (sum(move == [1 0 1]) == 3) && (sum(t3) ~= 0)
            t2 = circshift(t2,1);
            t2(1) = t3(1);
            t3 = circshift(t3,-1); 
            t3(end) = 0;    
            ilegal = ilegal + legal_move(t2);
            
        end
        %disp(['Movimiento ',num2str(i)+1,', Ilegal:',num2str(ilegal)])
        %display(move)
        %display([t1',t2',t3']);
        
        if sum([t1(1), t2(1), t3(1)] == towers(1,:)) == 3
            useless_move = useless_move + 1;
        end 
        towers = [t1',t2',t3'];
        
    end
    %t3(t3 == 30) = 0; 
    fitness(j) = sum(t3) ;

end