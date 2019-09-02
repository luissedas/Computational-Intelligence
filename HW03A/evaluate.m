function fitness = evaluate(N, population, popSize)
t1 = 1:N;
t2 = zeros(1,length(t1));
t3 = zeros(1,length(t1));
%ind = population(1,:);
%%
for j = 1:popSize
    ind = population(j,:);
    
    for i = 0:length(ind)/3-1

        move = ind(end-3*i-2:end-3*i);

        if (sum(move == [0 0 0]) == 3 || sum(move == [1 1 0]) == 3) && sum(t1) ~= 0
            t2 = circshift(t2,1);
            t2(1) = t1(1);
            t1 = circshift(t1,-1); 
            t1(end) = 0;

        elseif (sum(move == [0 0 1]) == 3 || sum(move == [1 1 1]) == 3) && sum(t1) ~= 0
            t3 = circshift(t3,1);
            t3(1) = t1(1);
            t1 = circshift(t1,-1); 
            t1(end) = 0;

        elseif sum(move == [0 1 0]) == 3 && sum(t2) ~= 0
            t1 = circshift(t1,1);
            t1(1) = t2(1);
            t2 = circshift(t2,-1); 
            t2(end) = 0;

        elseif sum(move == [0 1 1]) == 3 && sum(t2) ~= 0
            t3 = circshift(t3,1);
            t3(1) = t2(1);
            t2 = circshift(t2,-1); 
            t2(end) = 0;

        elseif sum(move == [1 0 0]) == 3 && sum(t3) ~= 0
            t1 = circshift(t1,1);
            t1(1) = t3(1);
            t3 = circshift(t3,-1); 
            t3(end) = 0;

        elseif sum(move == [1 0 1]) == 3 && sum(t3) ~= 0
            t2 = circshift(t2,1);
            t2(1) = t3(1);
            t3 = circshift(t3,-1); 
            t3(end) = 0;    

        end
        %display(move)
        %display([t1',t2',t3']);
    end

    fitness(j) = sum(t3) ;

end