% Translation from chromosome to puzzle moves
function translation(N, individual)

t1 = 1:N;                    % Tower 1
t2 = zeros(1,length(t1));    % Tower 2
t3 = zeros(1,length(t1));    % Tower 3

for i =0:length(individual)/3-1
    
    
    move = individual(3*i+1:3*i+3); % 3 bit string

    if ((sum(move == [0 0 0]) == 3 || sum(move == [1 1 0]) == 3)) && (sum(t1) ~= 0) && (legal_move(t1,t2))
        disp(['move: ',num2str(i+1),' ,','1->2']);
        t2 = circshift(t2,1);
        t2(1) = t1(1);
        t1 = circshift(t1,-1); 
        t1(end) = 0;

    elseif ((sum(move == [0 0 1]) == 3 || sum(move == [1 1 1]) == 3) && sum(t1) ~= 0) && (legal_move(t1,t3))
        disp(['move: ',num2str(i+1),' ,','1->3']);
        t3 = circshift(t3,1);
        t3(1) = t1(1);
        t1 = circshift(t1,-1); 
        t1(end) = 0;

    elseif (sum(move == [0 1 0]) == 3) && (sum(t2) ~= 0) && (legal_move(t2,t1))
        disp(['move: ',num2str(i+1),' ,','2->1']);
        t1 = circshift(t1,1);
        t1(1) = t2(1);
        t2 = circshift(t2,-1); 
        t2(end) = 0;

    elseif (sum(move == [0 1 1]) == 3) && (sum(t2) ~= 0) && (legal_move(t2,t3))
        disp(['move: ',num2str(i+1),' ,','2->3']);
        t3 = circshift(t3,1);
        t3(1) = t2(1);
        t2 = circshift(t2,-1); 
        t2(end) = 0;

    elseif (sum(move == [1 0 0]) == 3) && (sum(t3) ~= 0) && (legal_move(t3,t1))
        disp(['move: ',num2str(i+1),' ,','3->1']);
        t1 = circshift(t1,1);
        t1(1) = t3(1);
        t3 = circshift(t3,-1); 
        t3(end) = 0;

    elseif (sum(move == [1 0 1]) == 3) && (sum(t3) ~= 0) && (legal_move(t3,t2))
        disp(['move: ',num2str(i+1),' ,','3->2']);
        t2 = circshift(t2,1);
        t2(1) = t3(1);
        t3 = circshift(t3,-1); 
        t3(end) = 0;    
    end
    
    display([t1',t2',t3']);
end